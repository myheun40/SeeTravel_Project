package com.aischool.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.model.WebMemberDAO;

/**
 * Servlet implementation class CheckEmailServlet
 */
@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
        WebMemberDAO dao = new WebMemberDAO();
        
        boolean isEmailExists = dao.checkEmailExists(email);
        
        
        
        if (isEmailExists) {
            response.getWriter().write("이미 존재하는 이메일입니다.");
        } else {
            response.getWriter().write("사용가능한 이메일입니다.");
        }
	}

}
