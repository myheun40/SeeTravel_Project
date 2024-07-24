package com.aischool.placeservice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aischool.placemodel.FirstScreenDAO;
import com.aischool.placemodel.FirstScreenVO;


public class infoService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FirstScreenDAO dao = new FirstScreenDAO();
		ArrayList<FirstScreenVO> busan = dao.infoSelect();
		
		request.setAttribute("busanInfo", busan);
		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);
	}

}
