package tum.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Implemetation.CustomerDao;
import dao.Implemetation.LoginDao;


/**
 * Servlet implementation class HotelServlet
 */
@WebServlet("/HotelServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String confirm_password = req.getParameter("confirm_password");
		String email = req.getParameter("email");
		
		
		RequestDispatcher dispatcher = null;
		try {
			// Getting system current date
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
			Calendar cal = Calendar.getInstance();
			String bookingDate = dateFormat.format(cal.getTime());
		
	 	CustomerDao customerDao = new CustomerDao();
		int cust_id = customerDao.insertInToCustomer(firstname, lastname, email);
	
		LoginDao loginDao = new LoginDao();
		loginDao.insertInToLogin(cust_id, username, password, confirm_password);
		
			//session create and store pass and username
	
			HttpSession session = req.getSession(true); 
			session.setAttribute("username", username);
			session.setAttribute("password", password);
		    
			req.setAttribute("customerName", lastname + ", " + firstname);
	
			dispatcher = req.getRequestDispatcher("/roomBooking.jsp");
		} catch (Exception e) {
			System.out.print(e.getMessage());
			req.setAttribute("error", "Error while reservation. Please try again.");
			req.setAttribute("firstname", firstname);
			req.setAttribute("lastname", lastname);
			req.setAttribute("username", username);
			req.setAttribute("password", password);
			req.setAttribute("confirm_password", confirm_password);
			req.setAttribute("email", email);
			dispatcher = req.getRequestDispatcher("/registrationForm.jsp");
		}
		
		dispatcher.forward(req, resp);
	}

}
