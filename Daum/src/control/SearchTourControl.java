package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SearchTourService;


@WebServlet("/searchtour")
public class SearchTourControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SearchTourService searchTourService;
	
	public SearchTourControl() {
		searchTourService = new SearchTourService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("location");
		String place = request.getParameter("place");
		
		String result = searchTourService.getKeywordSearch(location, place);
		request.setAttribute("result", result);
		
		String path = "/searchTourResult.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
