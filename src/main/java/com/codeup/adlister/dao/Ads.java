package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    List<Ad> all();
    List<Ad> findByUser(User user);

    Long insert(Ad ad);

    Ad findById(long id);

    void editAd(Ad ad);
    void deleteAd(long id);
}
