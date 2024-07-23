package  com.aischool.placemodel;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Trip")
public class Trip extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       


	public void init(ServletConfig config) throws ServletException {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String trip=request.getParameter("trip");
		
		FirstScreenDAO dao= new FirstScreenDAO();
		FirstScreenVO vo = new FirstScreenVO();
	
		
		
		
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
