
package com.select;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getPlace")
public class getPlace extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static final int ITEMS_PER_PAGE = 4; // 한 페이지에 출력할 아이템 수

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 요청 파라미터로 지역 이름을 받음
		String region = request.getParameter("region");
		System.out.println("Region: " + region); //region 값 오는지 확인

		placeDAO dao = new placeDAO();

		ArrayList<place_info> list = dao.getPlacesByRegion(region);

		request.setAttribute("places", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("select.jsp");
		rd.forward(request, response);

	}
}
