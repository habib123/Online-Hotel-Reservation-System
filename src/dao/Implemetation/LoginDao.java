package dao.Implemetation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tum.Bean.LoginBean;

public class LoginDao extends AbstractDao{

	public void insertInToLogin(int user_id,String userName, String password, String confirmPassword ) throws Exception {
			
		String query = new StringBuilder()
		.append("INSERT INTO login(user_id,user_name,password,confirmpassword)")
		.append("VALUES (?, ?, ?, ?) ")
		.toString();		
		
		try {
		Connection connection = createConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setInt(1, user_id);
		preparedStatement.setString(2, userName);
		preparedStatement.setString(3, password);
		preparedStatement.setString(4, confirmPassword);
		
		preparedStatement.executeUpdate();
		} finally{
			closeConnection();
		}
		
	}
	
	public  int checkUserbyUserNameOrPassword(String userName, String password) throws Exception{
		//LoginBean loginBean = new LoginBean();
		int user_id=0;
		String query = new StringBuilder()
		.append("SELECT user_id from login ")
		.append("where user_name = ? and password = ?").toString();
				
		try{
			Connection con = createConnection();
			PreparedStatement prepareStatement  =  con.prepareStatement(query); 
			prepareStatement.setString(1, userName);
			prepareStatement.setString(2, password);
			ResultSet rs = prepareStatement.executeQuery();
			
			if (!rs.next() ) {
				user_id=-1;
			    System.out.println("no data");
			} else {

			    do {
			    	user_id = rs.getInt(1);
			    } while (rs.next());
			}
	
			
		/*	prepareStatement  =  con.prepareStatement(query2); 
			prepareStatement.setString(1, userNameOrEmail);
			rs = prepareStatement.executeQuery();
			if(rs.first()){
				flag = true;
			}*/
			rs.close();
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeConnection();
		}
		
		
		return user_id;
	}
	public  int checkUserbyUserName(String userName) throws Exception{
		//LoginBean loginBean = new LoginBean();
		int user_id=0;
		String query = new StringBuilder()
		.append("SELECT user_id from login ")
		.append("where user_name = ? ").toString();
				
		try{
			Connection con = createConnection();
			PreparedStatement prepareStatement  =  con.prepareStatement(query); 
			prepareStatement.setString(1, userName);
			//prepareStatement.setString(2, password);
			ResultSet rs = prepareStatement.executeQuery();
			
			if (!rs.next() ) {
				user_id=0;
			    System.out.println("no data");
			} else {

			    do {
			    	user_id = rs.getInt(1);
			    } while (rs.next());
			}
	
			
		/*	prepareStatement  =  con.prepareStatement(query2); 
			prepareStatement.setString(1, userNameOrEmail);
			rs = prepareStatement.executeQuery();
			if(rs.first()){
				flag = true;
			}*/
			rs.close();
			
		}catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeConnection();
		}
		
		
		return user_id;
    }

	
	
	 
}//class
