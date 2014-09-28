package tum.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Implemetation.LoginDao;

/**
 * Servlet implementation class loginCustServlet
 */
@WebServlet("/loginCustServlet")
public class loginCustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginCustServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//RequestDispatcher dispatcher = new RequestDispatcher() ;
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			try{
			LoginDao loginDao = new LoginDao();
			 
				//if(loginDao.checkUserNamebyUserNameOrEmail(username, password)){
				HttpSession session = req.getSession(); 
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				RequestDispatcher dispatcher = req.getRequestDispatcher("/roombooking.jsp");
				dispatcher.forward(req, resp);
				//}
				
				//else{
					req.setAttribute("error", "Wrong User Name or Password.Try again");
					req.setAttribute("password", password);
					req.setAttribute("username", username);
					//RequestDispatcher dispatcher = req.getRequestDispatcher("/login_customer.jsp");
					dispatcher.forward(req, resp);
				//}
				
		}catch (Exception ex){
			 System.out.println("Exception thrown  :" + ex);
			}
			
			
   }

}
