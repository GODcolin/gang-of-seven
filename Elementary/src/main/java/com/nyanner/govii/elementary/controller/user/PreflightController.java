package com.nyanner.govii.elementary.controller.user;

import com.nyanner.govii.elementary.config.SecurityAuditorAware;
import com.nyanner.govii.elementary.service.user.SysPermissionService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/api/preflight")
@AllArgsConstructor
public class PreflightController {
    private final SecurityAuditorAware securityAuditorAware;
    private final SysPermissionService permissionService;

    @GetMapping
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public Set<String> preflight() {
        Long userId = securityAuditorAware.getCurrentAuditor().orElseThrow();
       return permissionService.getMenuPermission(userId);
    }
}
