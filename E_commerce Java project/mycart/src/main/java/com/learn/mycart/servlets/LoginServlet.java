/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entites.User;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author AKSHAY
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
    
            String email = request.getParameter("email");
            String password = request.getParameter("password");

// validations
//authenticating user
UserDao userDao = new UserDao(FactoryProvider.getFactory());
User user = userDao.getUserByEmailAndPassword(email, password);
//System.out.println(user);
HttpSession httpSession = request.getSession();
if (user  == null) {
httpSession.setAttribute( "message", "Invalid details try another email or password" );
response.sendRedirect("login.jsp");
return;
} else {
out.println("<h1>Welcome "+ user.getUserName()+"</h1>");

//login
httpSession.setAttribute("current-user", user);
if (user.getUserType().equals("admin")) {
//admin:-admin.jsp
response.sendRedirect("admin.jsp");
} else if (user.getUserType().equals("normal")) {
//normal :normal.jsp
response.sendRedirect("normal.jsp");
} else {
out.println("We have not identified user type");
}
    }
}
}
