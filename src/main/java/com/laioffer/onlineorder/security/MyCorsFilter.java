package com.laioffer.onlineorder.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class MyCorsFilter extends OncePerRequestFilter {
    private static final String ALLOWED_ORIGINS_ENV_VAR = "ALLOWED_ORIGINS";
    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        String allowedOrigins = System.getenv(ALLOWED_ORIGINS_ENV_VAR); // Fetch the allowed origins from environment variable
        Set<String> allowedOriginsSet = new HashSet<>();

        if (allowedOrigins != null && !allowedOrigins.isEmpty()) {
            allowedOriginsSet = new HashSet<>(Arrays.asList(allowedOrigins.split(","))); // Split by comma to handle multiple URLs
        }

        String originHeader = httpServletRequest.getHeader("Origin");
        if (allowedOriginsSet.contains(originHeader)) {
            httpServletResponse.setHeader("Access-Control-Allow-Origin", originHeader);
        }
        httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        httpServletResponse.setHeader("Access-Control-Allow-Headers", "Authorization, Content-Type");
        if ("OPTIONS".equalsIgnoreCase(httpServletRequest.getMethod())) {
            httpServletResponse.setStatus(HttpServletResponse.SC_OK);
        } else {
            filterChain.doFilter(httpServletRequest, httpServletResponse);
        }
    }
}
