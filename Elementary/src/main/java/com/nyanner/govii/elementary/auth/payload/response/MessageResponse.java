package com.nyanner.govii.elementary.auth.payload.response;

import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

@Getter
@Setter
@Accessors(chain = true)
@RequiredArgsConstructor
@Builder(toBuilder = true)
public class MessageResponse {
    private final String message;
}
