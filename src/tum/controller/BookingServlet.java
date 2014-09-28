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
				
				 
				// Getting system current date
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
				Calendar cal = Calendar.getInstance();
				String bookingDate = dateFormat.format(cal.getTime());
				
				
				// set BookBean to get in to the Invoice 
				bookBean.setHotel_name(hotelname);
				bookBean.setAddress(address);
				bookBean.setPhone(phone);
				bookBean.setRoom_type(roomtype);
				bookBean.setDays(days);
				bookBean.setPaymentmethod(payMethodAdd);
				bookBean.setComment(comment);
				bookBean.setTotalcost(totalcost);
				bookBean.setBooked_time(bookingDate);
				//bookBean.setEntry_time(entry_time);
				
				System.out.println(totalcost);
				try {
										 
					HttpSession session = req.getSession();
					if (session.isNew()) {
						session.setAttribute("username", username);
						session.setAttribute("password", password);
						 
					} else {
						String username_old =  (String) req.getSession().getAttribute("username");
						   String password_old = (String) req.getSession().getAttribute("password");
						   int cust_id = (int) req.getSession().getAttribute("cust_id");
						// System.out.print(username_old+ " "+password_old+" "+cust_id);
						 int id = bookDao.insertInToBooking(cust_id,hotelname, address, phone, roomtype, days,
								 payMethodAdd, comment, totalcost, bookingDate, entryDate);
						 System.out.print(username_old+"sss"+password_old);
						 
						 int user_id = loginDao.checkUserbyUserNameOrPassword(username_old, password_old);
						 System.out.print("user_iv=="+user_id);
						 customerBean = customerDao.getCustomerById(user_id);
						
					}
				    
					System.out.print(customerBean.getFirstname());
					req.getSession().setAttribute("fastname",customerBean.getFirstname());
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
