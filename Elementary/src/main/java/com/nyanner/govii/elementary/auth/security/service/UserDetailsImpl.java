package com.nyanner.govii.elementary.auth.security.service;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.nyanner.govii.elementary.entity.user.SysUser;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serial;
import java.util.Collection;
import java.util.stream.Stream;

@Getter
@EqualsAndHashCode
@AllArgsConstructor
public class UserDetailsImpl implements UserDetails {
    @Serial
    private static final long serialVersionUID = 1L;

    private final Long userId;
    private final String username;
    private final String email;
    private final String nickname;
    @JsonIgnore
    private final String password;
    private final Collection<? extends GrantedAuthority> authorities;

    public static UserDetailsImpl build(SysUser user) {
        var authorities = Stream.of("USER")
            .map(SimpleGrantedAuthority::new)
            .toList();
        return new UserDetailsImpl(
            user.getUserId(),
            user.getUserName(),
            user.getEmail(),
            user.getNickName(),
            user.getPassword(),
            authorities
        );
    }


    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
