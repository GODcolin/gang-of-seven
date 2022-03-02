package com.nyanner.govii.elementary.controller.user;

import com.nyanner.govii.elementary.annotation.Captcha;
import com.nyanner.govii.elementary.entity.user.TestE;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/api/test")
public class TestEController {
    public TestEController() {
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<?> getTest() {
        return new ResponseEntity<>(new TestE("indekkusu", "123456789", new Date()), HttpStatus.OK);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    @Captcha
    public ResponseEntity<?> createTest(@RequestBody TestE testE) {
        System.out.println(testE);
        return new ResponseEntity<>(testE, HttpStatus.CREATED);
    }
}
