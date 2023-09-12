package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Config;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;


    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }
    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, price) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setDouble(4, ad.getPrice());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }
    @Override
    public Ad findById (long id){
        String query = "SELECT * FROM ads WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Ad ad = new Ad();
                ad.setId(resultSet.getLong("id"));
                ad.setUserId(resultSet.getLong("user_id"));
                ad.setTitle(resultSet.getString("title"));
                ad.setDescription(resultSet.getString("description"));
                ad.setPrice(resultSet.getDouble("price"));
                // Set other ad attributes here

                return ad;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
        return null; // Return null if no ad with the given ID was found
    }
    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
    @Override
    public void editAd(Ad ad) {
        String editQuery = "UPDATE ads SET title = ?, description = ?, price = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(editQuery);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setDouble(3, ad.getPrice());
            stmt.setLong(4, ad.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error editing the ad.", e);
        }

    }
    @Override
    public void deleteAd(long id) {
        String deleteQuery = "DELETE FROM ads WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(deleteQuery);
            stmt.setLong(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting the ad.", e);
        }
    }
    @Override
    public List<Ad> findByUser(User user) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Ad> userAds = new ArrayList<>();

        try {
            String query = "SELECT * FROM ads WHERE user_id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, user.getId()); // Assuming user has an ID field

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                // Create Ad objects from the result set and add them to the list
                Ad ad = new Ad(
                        resultSet.getLong("id"),
                        resultSet.getLong("user_id"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getDouble("price")
                        // Add other fields as needed
                );
                userAds.add(ad);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching user ads.", e);
        } finally {
            // Close database resources in the reverse order of opening
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return userAds;
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getDouble("price")
        );
    }
    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

}
