package tum.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;






import com.google.gson.Gson;
import com.sun.xml.internal.bind.v2.runtime.Name;

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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/* String country=req.getParameter("countryname");
		  String json = new String() ;
		  try{
		  Map<String, String> ind = new LinkedHashMap<String, String>();
		     ind.put("1", "New delhi");
		     ind.put("2", "Tamil Nadu");
		     ind.put("3", "Kerala");
		     ind.put("4", "Andhra Pradesh");
		     
		     Map<String, String> us = new LinkedHashMap<String, String>();
		     us.put("1", "Washington");
		     us.put("2", "California");
		     us.put("3", "Florida");
		     us.put("4", "New York");
		    
		    if(country.equals("India")){
		      json= new Gson().toJson(ind);   
		     }
		     else if(country.equals("US")){
		      json=new Gson().toJson(us);  
		     }
		     
		  }catch (Exception e){
			  System.out.print("probelm" + e);
		  
		  }
		  System.out.print(json); 
		     resp.setContentType("application/json");
		     resp.setCharacterEncoding("UTF-8");
		     resp.getWriter().write(json); */
		
		RequestDispatcher dispatcher = null;
		dispatcher = req.getRequestDispatcher("/registrationForm.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String confirm_password = req.getParameter("confirm_password");
		String email = req.getParameter("email");
		
		req.setAttribute("firstname",firstname);
		req.setAttribute("lastname",lastname);
		req.setAttribute("username",username);
		req.setAttribute("password",password);
		req.setAttribute("confirm_password",confirm_password);
		req.setAttribute("email",email);
		
		
		//resp.setContentType("text/plain");  
		//resp.setCharacterEncoding("UTF-8"); 
		//PrintWriter out = resp.getWriter();
		//resp.getWriter().write("Hello ");
		
	try {	
		LoginDao loginDao = new LoginDao();
		
		int user_id = loginDao.checkUserbyUserName(username);
				if(user_id == 0){
			
				
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
					Calendar cal = Calendar.getInstance();
					String bookingDate = dateFormat.format(cal.getTime());
				
			 	CustomerDao customerDao = new CustomerDao();
				int cust_id = customerDao.insertInToCustomer(firstname, lastname, email);
			
				//LoginDao loginDao = new LoginDao();
				loginDao.insertInToLogin(cust_id, username, password, confirm_password);
				
					//session create and store pass and username
			
					HttpSession session = req.getSession(true); 
					session.setAttribute("username", username);
					session.setAttribute("password", password);
				    
					req.setAttribute("customerName", lastname + ", " + firstname);
			
					dispatcher = req.getRequestDispatcher("/roomBooking.jsp"); 
					
					}
				
				else
				{

					req.setAttribute("username1", "Duplicate user Name. Try again.");
			
					dispatcher = req.getRequestDispatcher("/registrationForm.jsp");
					
				}
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
