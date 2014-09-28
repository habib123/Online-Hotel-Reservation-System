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
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 req.getRequestDispatcher("customerLogin.jsp").include(req, resp);
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
				String hotelname = req.getParameter("hotelname");
				String address = req.getParameter("address");
				String phone = req.getParameter("phone");
				String roomtype = req.getParameter("roomtype");
				int days = Integer.parseInt(req.getParameter("days"));
				String[] paymethod = req.getParameterValues("payMethod");
				String comment = req.getParameter("comment");
				Double totalcost = Double.parseDouble(req.getParameter("total"));
				Date entryDate = new Date();
				RequestDispatcher dispatcher = null;
				
				String payMethodAdd = new String();
				if(paymethod != null ){
					for (String s: paymethod )	{
						payMethodAdd += s+" ";
					}
				}
				int Roomprice =0 ;
				if(roomtype.equals("Single")) 
					Roomprice = 50;
				
				else if(roomtype.equals("Double"))
					Roomprice = 80;

				else
					Roomprice = 100;
				
				// Getting system current date
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
				Calendar cal = Calendar.getInstance();
				String bookingDate = dateFormat.format(cal.getTime());
				
				//System.out.println(totalcost);
				try {
										 
				    String username_old =  (String) req.getSession().getAttribute("username");
				    String password_old = (String) req.getSession().getAttribute("password");
						   
					int user_id = loginDao.checkUserbyUserNameOrPassword(username_old, password_old);
						   customerBean = customerDao.getCustomerById(user_id);
						   System.out.println("user_id from login"+user_id);
				    int id = bookDao.insertInToBooking(customerBean.getCust_id(),hotelname, address, phone, roomtype, days,
								 payMethodAdd, comment, totalcost, bookingDate, entryDate,Roomprice);
						    
					bookBean = bookDao.getBookBeanById(id);

					req.getSession().setAttribute("bookBean",bookBean);
					req.getSession().setAttribute("customerBean",customerBean);
														
					dispatcher = req.getRequestDispatcher("/reservationInvoice.jsp");
					
				} catch (Exception e) {
					System.out.print("huge problem"+e.getMessage());
					req.setAttribute("error", "Error while reservation. Please try again.");
					req.setAttribute("hotelname", hotelname);
					req.setAttribute("address", address);
					req.setAttribute("phone", phone);
					req.setAttribute("roomtype", roomtype);
					req.setAttribute("days", days);
					req.setAttribute("payMethod", paymethod);
					req.setAttribute("comment", comment);
					req.setAttribute("totalcost", totalcost);
					req.setAttribute("entryDate", entryDate);
					
					dispatcher = req.getRequestDispatcher("/roomBooking.jsp");
				}
				
				dispatcher.forward(req, resp);
		
	}
	

}
