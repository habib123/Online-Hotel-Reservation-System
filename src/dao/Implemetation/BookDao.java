package dao.Implemetation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import tum.Bean.BookBean;

public class BookDao extends AbstractDao{
	
	public int insertInToBooking(int cust_id,String hotelname,String address, String phone, String roomtype, 
			int days, String paymethod, String comment, Double totalcost,String bookedTime,Date entryTime) throws Exception {
		

		
		String query = new StringBuilder()
		.append("INSERT INTO booking(book_id,hotel_name,location,room_type,booked_time,"
				+ "address,phone,paymentmethod,totalcost,days,comment) ")
		.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ")
		.toString();		

		try {
		Connection connection = createConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		preparedStatement.setInt(1, cust_id);
		preparedStatement.setString(2, hotelname);
		preparedStatement.setString(3, "Christoph-probst Str.8, 80805, Munich");
		preparedStatement.setString(4, roomtype);
		preparedStatement.setTimestamp(5, convertToTimeStamp(bookedTime));
		//preparedStatement.setDate(6, new java.sql.Date(entryTime.getTime()));
		preparedStatement.setString(6, address);
		preparedStatement.setString(7, phone);
		preparedStatement.setString(8, paymethod);
		preparedStatement.setDouble(9, totalcost);
		preparedStatement.setInt(10, days);
		preparedStatement.setDouble(11, totalcost);
		
		
		preparedStatement.executeUpdate();
		ResultSet foreignKeys = preparedStatement.getGeneratedKeys();
		foreignKeys.next();
		int book_id = foreignKeys.getInt(1);
		return book_id;
		//preparedStatement.executeQuery();
		} finally{
			closeConnection();
		}
		
	}
	
	public BookBean getBookByBookId(int book_id) throws Exception {
		
			BookBean bookBean = new BookBean();
			
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
			bookBean.setBook_id(rs.getInt(2));
			bookBean.setHotel_name(rs.getString(3));
			bookBean.setLocation(rs.getString(4));
			bookBean.setPrice_perday(rs.getInt(5));
			bookBean.setRoom_type(rs.getString(6));
			bookBean.setBooked_time(rs.getString(7));
			bookBean.setEntry_time(rs.getDate(8));
			bookBean.setEntry_time(rs.getDate(9));
			bookBean.setAddress(rs.getString(10));
			bookBean.setPhone(rs.getString(11));
			bookBean.setPaymentmethod(rs.getString(12));
			bookBean.setTotalcost(rs.getDouble(13));
			bookBean.setDays(rs.getInt(14));
			bookBean.setComment(rs.getString(15));
		}
		
		rs.close();
		//preparedStatement.executeQuery();
		} finally{
			closeConnection();
		}
		return bookBean;
	}
	
	
}
