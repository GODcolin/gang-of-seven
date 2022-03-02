package com.nyanner.govii.elementary.auth.payload.response;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.util.List;

@Getter
@Setter
@Accessors(chain = true)
@RequiredArgsConstructor
@Builder(toBuilder = true)
public class JwtResponse {
    private final String token;
    private final String type = "Bearer";
    private final Long userId;
    private final String username;
    private final String email;
    private final String nickname;
    private final List<String> roles;
}
