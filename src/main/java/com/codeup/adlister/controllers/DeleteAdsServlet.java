package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ads/delete")
public class DeleteAdsServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedInUser = (User) req.getSession().getAttribute("user");
        if (loggedInUser == null) {
            resp.sendRedirect("/login");
            return;
        }
        long adId = Long.parseLong(req.getParameter("delete"));
        DaoFactory.getAdsDao().deleteAd(adId);

        resp.sendRedirect("/ads");

    }


}
