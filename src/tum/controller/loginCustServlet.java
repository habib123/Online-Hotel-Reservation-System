package tum.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		dispatcher = req.getRequestDispatcher("/customerLogin.jsp");
		dispatcher.forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		    RequestDispatcher dispatcher = null;
		    LoginDao loginDao = new LoginDao();
		    BookDao bookDao = new BookDao();
			BookBean bookBean = new BookBean();
			CustomerDao customerDao = new CustomerDao();
			CustomerBean customerBean = new CustomerBean();
		   

			String username = req.getParameter("username");
			String password = req.getParameter("password");
			try{
			    
			    
			    int user_id = loginDao.checkUserbyUserNameOrPassword(username, password);
			    if(user_id == -1){
			     dispatcher = req.getRequestDispatcher("/customerLogin.jsp");
			     req.setAttribute("error", "Wrong User Name or Password.Try again");
			    
			    }
			    else{
				HttpSession session = req.getSession(true); 
				//session.invalidate();
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				
				customerBean = customerDao.getCustomerById(user_id);
				 
				 List<BookBean> bookBeanList = new ArrayList<BookBean>();
				 System.out.print(customerBean.getCust_id());
				 bookBeanList = bookDao.getBookBeanListByBookId(customerBean.getCust_id());
				 System.out.print("ddsd");
				req.getSession().setAttribute("bookBeanList",bookBeanList);
				req.getSession().setAttribute("customerBean",customerBean);
				dispatcher = req.getRequestDispatcher("/status.jsp");
			    }
					
					

		}catch (Exception ex){
			 System.out.println("Exception thrown  :" + ex);
			}
			
	   dispatcher.forward(req, resp);	
   }

}
