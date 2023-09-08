package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ads/edit")
public class EditAdsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("/login");
            return;
        }
        long adId = Long.parseLong(req.getParameter("edit"));
        // find the actual ad object
        Ad editedAd = DaoFactory.getAdsDao().findById(adId);
        // add the ad to the req attributes
        req.setAttribute("editedAd", editedAd);
        req.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double price = Double.parseDouble(req.getParameter("price"));
        User loggedInUser = (User) req.getSession().getAttribute("user");

        long adId = Long.parseLong(req.getParameter("edit"));
        Ad ad = new Ad(
                adId,
                loggedInUser.getId(),
                req.getParameter("title"),
                req.getParameter("description"),
                price
        );
        DaoFactory.getAdsDao().editAd(ad);
        resp.sendRedirect("/profile");
    }
}
