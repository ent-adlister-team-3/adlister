package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        String phoneNumber = request.getParameter("phone_number");

        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (!password.equals(passwordConfirmation))
                || phoneNumber.isEmpty();

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }

        if (DaoFactory.getUsersDao().usernameExists(username)) {
            response.sendRedirect("/register?error=username-exists");
            return;
        }

        if (DaoFactory.getUsersDao().emailExists(email)) {
            response.sendRedirect("/register?error=email-exists");
            return;
        }

        User user = new User(username, email, password, phoneNumber);
        String hash = Password.hash(user.getPassword());
        user.setPassword(hash);

        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
