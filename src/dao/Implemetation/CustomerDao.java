package dao.Implemetation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import tum.Bean.CustomerBean;



public class CustomerDao extends AbstractDao {
	
	public CustomerBean getCustomerById(int cust_Id) throws Exception {
		CustomerBean customerBean = new CustomerBean();
		
		String query = new StringBuilder()
		.append("SELECT * ")
		.append("FROM customer ")
		.append("WHERE cust_id = ? ")
		.toString();		

		try {			
			Connection connection = createConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,cust_Id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				customerBean.setCust_id(resultSet.getInt(1));
				customerBean.setE_mail(resultSet.getString(2));
				customerBean.setFirstname(resultSet.getString(3));
				customerBean.setLastname(resultSet.getString(4));
			}			
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeConnection();
		}
		return customerBean;
	}
	public int insertInToCustomer(String firstName,String lastName, String eMail) throws Exception {
			
		String query = new StringBuilder()
		.append("INSERT INTO customer(e_mail,firstName,lastName) ")
		.append("VALUES (?, ?, ?) ")
		.toString();		
		
		try {
		Connection connection = createConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
		preparedStatement.setString(1, eMail);
		preparedStatement.setString(2, firstName);
		preparedStatement.setString(3, lastName);
		
		preparedStatement.executeUpdate();
		ResultSet tableKeys = preparedStatement.getGeneratedKeys();
		tableKeys.next();
		int autoGeneratedID = tableKeys.getInt(1);
		return autoGeneratedID;
		//preparedStatement.executeQuery();
		} finally{
			closeConnection();
		}
		
	}

}
