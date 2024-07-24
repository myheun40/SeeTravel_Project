package com.aischool.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aischool.model.WebMember;
import com.aischool.model.WebMemberDAO;


@WebServlet("/editService")
public class editService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String id = request.getParameter("id");
		
		
		HttpSession session = request.getSession();
		WebMember logindata = (WebMember)session.getAttribute("logindata");
		String email = logindata.getEmail();	
		
		//기존 사용자 정보
		WebMember member = new WebMember(email, pw, name, id);
		member.setEmail(email);
		member.setPw(pw);
		member.setName(name);
		member.setId(id);
        
        WebMemberDAO dao = new WebMemberDAO();
        int cnt = dao.memberEdit(member);
        
        if(cnt > 0) {
        	session.setAttribute("logindata", member);//마이페이지로 이동
        	response.sendRedirect("Mypage.jsp");
        }else {
        	request.setAttribute("errorMsg", "정보 업데이트에 실패했습니다.");
            request.getRequestDispatcher("modify.jsp").forward(request, response); //회원정보수정페이지로 이동
        }

	}

}
