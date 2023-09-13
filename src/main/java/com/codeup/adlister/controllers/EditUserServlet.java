package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Config;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("/profile");
            return;
        }
        long userId = Long.parseLong(req.getParameter("editId"));

        User editedUser = DaoFactory.getUsersDao().findById(userId);

        if (editedUser != null) {
            req.setAttribute("user", editedUser);
        }
        req.setAttribute("editUser", editedUser);
        req.getRequestDispatcher("/WEB-INF/editUser.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long userId = Long.parseLong(req.getParameter("editId"));
        User user = DaoFactory.getUsersDao().findById(userId);

        user.setPhoneNumber(req.getParameter("phone_number"));
        user.setEmail(req.getParameter("email"));
        user.setUsername(req.getParameter("username"));


        DaoFactory.getUsersDao().editUser(user);
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        resp.sendRedirect("/profile");

    }





}
