package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);


    // Find by ID
    Ad findById(long id);

    void editAd(Ad ad);

    void deleteAd(int adId, long id);

    List<Ad> findByUser(User user);

}
