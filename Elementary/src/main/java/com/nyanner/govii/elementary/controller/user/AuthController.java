package com.nyanner.govii.elementary.controller.user;

import com.nyanner.govii.elementary.annotation.Captcha;
import com.nyanner.govii.elementary.annotation.Log;
import com.nyanner.govii.elementary.annotation.RedisLimit;
import com.nyanner.govii.elementary.auth.payload.request.LoginRequest;
import com.nyanner.govii.elementary.auth.payload.request.SignupRequest;
import com.nyanner.govii.elementary.auth.payload.response.JwtResponse;
import com.nyanner.govii.elementary.auth.payload.response.MessageResponse;
import com.nyanner.govii.elementary.auth.security.jwt.JwtUtils;
import com.nyanner.govii.elementary.auth.security.service.UserDetailsImpl;
import com.nyanner.govii.elementary.common.BusinessType;
import com.nyanner.govii.elementary.config.LoginConfig;
import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.entity.user.SysLoginInfo;
import com.nyanner.govii.elementary.entity.user.SysUser;
import com.nyanner.govii.elementary.service.user.AsyncService;
import com.nyanner.govii.elementary.service.user.SysLoginInfoService;
import com.nyanner.govii.elementary.service.user.SysPermissionService;
import com.nyanner.govii.elementary.service.user.UserService;
import com.nyanner.govii.elementary.utils.ServletUtils;
import com.nyanner.govii.elementary.utils.ip.AddressUtils;
import com.nyanner.govii.elementary.utils.ip.IpUtils;
import com.nyanner.govii.elementary.vo.RestResponse;
import eu.bitwalker.useragentutils.UserAgent;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;


@RestController
@RequestMapping("/api/auth")
@AllArgsConstructor
@Slf4j
public class AuthController {
    private final AuthenticationManager authenticationManager;
    private final UserService userService;
    private final JwtUtils jwtUtils;
    private final SecurityAuditorAware securityAuditorAware;
    private final AsyncService asyncService;
    private final SysPermissionService permissionService;

    private final StringRedisTemplate stringRedisTemplate;

    private final LoginConfig loginConfig;



    @Captcha
    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest request) {
        final ValueOperations<String, String> ssOps = stringRedisTemplate.opsForValue();
        Boolean                               exist = stringRedisTemplate.hasKey(request.getUsername());
        if(exist && "lock".equals(ssOps.get(request.getUsername()))){
            return ResponseEntity
                    .status(HttpStatus.UNAUTHORIZED)
                    .body(new MessageResponse("该账号已被锁定，请稍后在尝试"));
        }


        Authentication authentication = null;
        try {
            authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                    request.getUsername(),
                    request.getPassword()
                )
            );
        } catch (BadCredentialsException e) {
            asyncService.asyncRecordLoginInfo(request.getUsername(),"1","用户名或密码不匹配",ServletUtils.getRequest());
            if(exist == null || !exist){
                ssOps.set(request.getUsername(),"1",loginConfig.getWatch(), TimeUnit.SECONDS);
                return ResponseEntity
                        .status(HttpStatus.UNAUTHORIZED)
                        .body(new MessageResponse("用户名密码不匹配,你还有"+(loginConfig.getTimes()-1)+"次机会"));
            }
            int errorCounts = Integer.parseInt(ssOps.get(request.getUsername())) + 1;

            if(errorCounts == loginConfig.getTimes()){
                ssOps.set(request.getUsername(), "lock", loginConfig.getLock(), TimeUnit.SECONDS);


                 return ResponseEntity
                        .status(HttpStatus.UNAUTHORIZED)
                        .body(new MessageResponse("登陆失败次数过多，该账号已被锁定，请在5分钟后再尝试"));
            }

            ssOps.set(request.getUsername(),String.valueOf(errorCounts));
            return ResponseEntity
                .status(HttpStatus.UNAUTHORIZED)
                .body(new MessageResponse("用户名密码不匹配,你还有"+(loginConfig.getTimes()-errorCounts)+"次机会"));
        } catch (Exception e) {
            asyncService.asyncRecordLoginInfo(request.getUsername(),"1",e.getMessage(),ServletUtils.getRequest());

            return ResponseEntity
                .status(HttpStatus.UNAUTHORIZED)
                .body(new MessageResponse(e.getMessage()));
        }
        SecurityContextHolder.getContext().setAuthentication(authentication);
        var jwt = jwtUtils.generateJwtToken(authentication);
        var userDetails = (UserDetailsImpl) authentication.getPrincipal();
        var roles = userDetails.getAuthorities().stream()
            .map(GrantedAuthority::getAuthority)
            .collect(Collectors.toList());

        asyncService.asyncRecordLoginInfo(request.getUsername(),"0","登录成功",ServletUtils.getRequest());
        return ResponseEntity.ok(
            JwtResponse.builder()
                .token(jwt)
                .userId(userDetails.getUserId())
                .username(userDetails.getUsername())
                .email(userDetails.getEmail())
                .nickname(userDetails.getNickname())
                .roles(roles)
                .build()
        );
    }

    @PostMapping("/signup")
    @Log(title = "注册用户", businessType = BusinessType.INSERT)
    public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest request) {
        var auditorId = securityAuditorAware.getCurrentAuditor()
            .orElseThrow(() -> new AccessDeniedException("403 Forbidden"));
        if (!userService.getUserById(auditorId).isAdmin()) {
            throw new AccessDeniedException("403 Forbidden");
        }
        if (userService.existsByUsername(request.getUsername())) {
            return ResponseEntity
                .badRequest()
                .body(new MessageResponse("Error: Username is already taken!"));
        }
        if (userService.existsByEmail(request.getEmail())) {
            return ResponseEntity
                .badRequest()
                .body(new MessageResponse("Error: Email is already in use!"));
        }
        var user = SysUser.builder()
            .userName(request.getUsername())
            .email(request.getEmail())
            .nickName(request.getNickname())
            .password(request.getPassword())
            .build();
        userService.registerUser(user);
        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }

    @PostMapping("/sendCode")
    public RestResponse sendCode(@RequestBody Map<String, Object> map) {
        return userService.sentCode(map.get("username").toString());
    }

    @PostMapping("/resetPassword")
    public RestResponse resetPassword(@RequestBody Map<String, Object> map) {
        return userService.resetPassword(map);
    }

    /**
     * @Description     获取用户信息
     * @param
     * @return
     **/
    @GetMapping("getInfo")
    public RestResponse getInfo(){
        Long userId = securityAuditorAware.getCurrentAuditor().orElseThrow();
        return RestResponse.ok(permissionService.getMenuPermission(userId));

    }

}
