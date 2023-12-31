package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);

    Long insert(User user);

    void editUser(User user);

    User findById(long userId);

    List<User> all();

    boolean usernameExists(String username);

    boolean emailExists(String email);
}
