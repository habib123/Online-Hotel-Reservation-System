package tum.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signOutServlet
 */
@WebServlet("/signOutServlet")
public class signOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		
		HttpSession session=req.getSession();
		session.invalidate();
		
		req.setAttribute("message","You are successfully logged out!");
		dispatcher = req.getRequestDispatcher("/customerLogin.jsp");
		dispatcher.forward(req, resp);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		
		HttpSession session=req.getSession();
		session.invalidate();
		
		req.setAttribute("message","You are successfully logged out!");
		dispatcher = req.getRequestDispatcher("/customerLogin.jsp");
		dispatcher.forward(req, resp);	;
	}

}
