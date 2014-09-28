package tum.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tum.Bean.BookBean;
import tum.Bean.CustomerBean;
import dao.Implemetation.BookDao;
import dao.Implemetation.CustomerDao;
import dao.Implemetation.LoginDao;

/**
 * Servlet implementation class CustomerLogin
 */
@WebServlet("/CustomerLogin")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
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
		 BookDao bookDao = new BookDao();
		 BookBean bookBean = new BookBean();
		 LoginDao loginDao = new LoginDao();
		 CustomerDao customerDao = new CustomerDao();
		 CustomerBean customerBean = new CustomerBean();
       
		String username = req.getParameter("username");  // new session from login
		String password = req.getParameter("password");  //  new session from login
		
		RequestDispatcher dispatcher = null;


		try {
								 
			HttpSession session = req.getSession();
			
				session.setAttribute("username", username);
				session.setAttribute("password", password);
			
				// int id = bookDao.insertInToBooking(cust_id,hotelname, address, phone, roomtype, days,
				//		 payMethodAdd, comment, totalcost, bookingDate, entryDate);
				// System.out.print(username_old+"sss"+password_old);
				 
				 int user_id = loginDao.checkUserbyUserNameOrPassword(username, password);
				 System.out.print("user_iv=="+user_id);
				 customerBean = customerDao.getCustomerById(user_id);
				 bookBean = bookDao.getBookByBookId(customerBean.getCust_id());
		
		    
			System.out.print(customerBean.getFirstname());
			req.getSession().setAttribute("fastname",customerBean.getFirstname());
			req.getSession().setAttribute("bookBean",bookBean);
			req.getSession().setAttribute("customerBean",customerBean);
												
			dispatcher = req.getRequestDispatcher("/reservationInvoice.jsp");
			
		} catch (Exception e) {
			System.out.print("huge problem"+e.getMessage());
			req.setAttribute("error", "Error while reservation. Please try again.");
				
			dispatcher = req.getRequestDispatcher("/customerLogin.jsp");
		}
		
		dispatcher.forward(req, resp);
}


}
