package com.laioffer.onlineorder.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public record UserInfoDto(
        String email,
        @JsonProperty("first_name") String firstName,
        @JsonProperty("last_name") String lastName
) {
    public UserInfoDto(String email, String firstName, String lastName) {
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return "UserInfoDto(email=" + this.email + ", firstName=" + this.firstName + ", lastName=" + this.lastName + ")";
    }
}
