package com.laioffer.onlineorder.controller;

import ch.qos.logback.classic.encoder.JsonEncoder;
import com.laioffer.onlineorder.entity.CustomerEntity;
import com.laioffer.onlineorder.model.RegisterBody;
import com.laioffer.onlineorder.model.UserInfoDto;
import com.laioffer.onlineorder.service.CustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;


@RestController
public class CustomerController {

    Logger logger = LoggerFactory.getLogger(CustomerController.class);
    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @PostMapping("/signup")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void signUp(@RequestBody RegisterBody body) {
        customerService.signUp(body.email(), body.password(), body.firstName(), body.lastName());
    }

    @GetMapping("/user/me")
    public UserInfoDto getCurrentUser(@AuthenticationPrincipal UserDetails userDetails) {
        String email = userDetails.getUsername();
        CustomerEntity cust = customerService.getCustomerByEmail(email);

        return new UserInfoDto(cust.email(), cust.firstName(), cust.lastName());
    }

}
