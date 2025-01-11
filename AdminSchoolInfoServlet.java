package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminSchoolInfoServlet
 */
@WebServlet("/AdminSchoolInfoServlet")
public class AdminSchoolInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward the request to the User Management JSP page
        request.getRequestDispatcher("AdminSchoolInfo.jsp").forward(request, response);
    }
}
