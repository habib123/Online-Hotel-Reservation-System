package dao.Implemetation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AbstractDao {

private Connection con;
	
	protected Connection createConnection() {	
		if(con == null){
			try {
				Class.forName("com.mysql.jdbc.Driver"); 
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotelreservationsystem","root",""); 
				//Class.forName("org.postgresql.Driver");
				//con = DriverManager.getConnection("jdbc:postgresql:ATCS", "postgres", "postgres");			
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			};
		}
        return con;
	}

	protected void closeConnection() {
		if(con != null){
    		try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
    		con = null; 
    	}
	}
	
	public void beginTransaction() throws SQLException{
		if(con == null){
			createConnection();			
		}
		con.setAutoCommit(false);
	}
	
	public void endTransaction() throws SQLException{
		if(con != null){
			con.commit();
			closeConnection();
		}
	}
	
	public void rollBackTransaction() throws SQLException{
		if(con != null){
			con.rollback();
			closeConnection();
		}
	}
	
	protected java.sql.Date convertToSqlDate(String stringDate) throws ParseException{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date parsed = format.parse(stringDate);
        java.sql.Date sqlDate = new java.sql.Date(parsed.getTime());
        return sqlDate;
	}
	
	protected Timestamp convertToTimeStamp(String stringDate) throws ParseException{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date parsedDate = dateFormat.parse(stringDate);
	    Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
        return timestamp;
	}
	protected Timestamp convertToTimeSta(String stringDate) throws ParseException{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date parsedDate = dateFormat.parse(stringDate);
	    Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
        return timestamp;
	}
	protected Date convertSqlToUtilDate(Date date) throws ParseException{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date parsedDate = format.parse(date.toString());
        return parsedDate;
	}
	
	@SuppressWarnings("deprecation")
	protected java.sql.Date getNextDayDate(String date) throws ParseException{
		java.sql.Date nextDayDate = convertToSqlDate(date);
		nextDayDate.setDate(nextDayDate.getDate() + 1);        
		return nextDayDate;
	}

}
