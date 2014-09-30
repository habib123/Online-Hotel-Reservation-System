package dao.Implemetation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import tum.Bean.BookBean;

@SuppressWarnings("serial")
public class BookDao extends AbstractDao{
	
	public int insertInToBooking(int cust_id,String hotelname,String address, String phone, String roomtype, 
			int days, String paymethod, String comment, Double totalcost,String bookedTime,String entryTime,int Roomprice) throws Exception {
		

		
		String query = new StringBuilder()
		.append("INSERT INTO booking(book_id,hotel_name,location,room_type,booked_time,entry_time,"
				+ "address,phone,paymentmethod,totalcost,days,comment,price_perday,status) ")
		.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ")
		.toString();		
		
		System.out.print("entry time after converting"+entryTime);
		System.out.print("class="+convertToTimeSta(entryTime).getClass().getName());
		try {
		Connection connection = createConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		preparedStatement.setInt(1, cust_id);
		preparedStatement.setString(2, hotelname);
		preparedStatement.setString(3, "Christoph-probst Str.8, 80805, Munich");
		preparedStatement.setString(4, roomtype);
		preparedStatement.setString(5, bookedTime);
		preparedStatement.setString(6,entryTime);
		preparedStatement.setString(7, address);
		preparedStatement.setString(8, phone);
		preparedStatement.setString(9, paymethod);
		preparedStatement.setDouble(10, totalcost);
		preparedStatement.setInt(11, days);
		preparedStatement.setString(12, comment);
		preparedStatement.setDouble(13, Roomprice);
		preparedStatement.setString(14, "Pending");
		
		
		preparedStatement.executeUpdate();
		ResultSet foreignKeys = preparedStatement.getGeneratedKeys();
		foreignKeys.next();
		int id = foreignKeys.getInt(1);
		return id;
		//preparedStatement.executeQuery();
		} finally{
			closeConnection();
		}
		
	}
	
	public List<BookBean> getBookBeanListByBookId(int book_id) throws Exception {
		
		List<BookBean> bookBeanList = new ArrayList<BookBean>();

			
		String query = new StringBuilder()
		.append("SELECT * from booking ")
		.append("where book_id= ? ")
		.toString();		
		// java.sql.Date sqlDate = new java.sql.Date(entryTime.getTime());
		try {
		Connection connection = createConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setInt(1, book_id);
		ResultSet rs= preparedStatement.executeQuery();
		while(rs.next()){
			BookBean bookBean = new BookBean();
			bookBean.setId(rs.getInt(1));
			bookBean.setBook_id(rs.getInt(2));
			bookBean.setHotel_name(rs.getString(3));
			bookBean.setLocation(rs.getString(4));
			bookBean.setPrice_perday(rs.getInt(5));
			bookBean.setRoom_type(rs.getString(6));
			bookBean.setBooked_time(rs.getString(7));
			bookBean.setEntry_time(rs.getString(8));
			bookBean.setAddress(rs.getString(10));
			bookBean.setPhone(rs.getString(11));
			bookBean.setPaymentmethod(rs.getString(12));
			bookBean.setTotalcost(rs.getDouble(13));
			bookBean.setDays(rs.getInt(14));
			bookBean.setComment(rs.getString(15));
			bookBean.setStatus(rs.getString(16));
			
			bookBeanList.add(bookBean);
		}
		
		rs.close();
		//preparedStatement.executeQuery();
		} finally{
			closeConnection();
		}
		return bookBeanList;
	}
	public BookBean getBookBeanById(int id) throws Exception {
		
			BookBean bookBean = new BookBean();
			
		String query = new StringBuilder()
		.append("SELECT * from booking ")
		.append("where id= ? ")
		.toString();		
		// java.sql.Date sqlDate = new java.sql.Date(entryTime.getTime());
		try {
		Connection connection = createConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setInt(1, id);
		ResultSet rs= preparedStatement.executeQuery();
		while(rs.next()){
			bookBean.setId(rs.getInt(1));
			bookBean.setBook_id(rs.getInt(2));
			bookBean.setHotel_name(rs.getString(3));
			bookBean.setLocation(rs.getString(4));
			bookBean.setPrice_perday(rs.getInt(5));
			bookBean.setRoom_type(rs.getString(6));
			bookBean.setBooked_time(rs.getString(7));
			bookBean.setEntry_time(rs.getString(8));
			bookBean.setAddress(rs.getString(10));
			bookBean.setPhone(rs.getString(11));
			bookBean.setPaymentmethod(rs.getString(12));
			bookBean.setTotalcost(rs.getDouble(13));
			bookBean.setDays(rs.getInt(14));
			bookBean.setComment(rs.getString(15));
			bookBean.setStatus(rs.getString(16));
		}
		
		rs.close();
		//preparedStatement.executeQuery();
		} finally{
			closeConnection();
		}
		return bookBean;
	}

	
}
