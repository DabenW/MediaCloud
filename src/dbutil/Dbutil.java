package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * The class is used to connection to database
 * and release connection that has been used.
 * Also, it provides general query and update
 * function to improve codes' reusability.
 *
 */
public class Dbutil {
	 private String driver = "org.apache.derby.jdbc.EmbeddedDriver";
	 private String protocol = "jdbc:derby:";
	 private String username = "root";
	 private String password = "root";
	 private String dbName = "McloudDataBase";
	 private Properties userInfo;
	 private Connection connection = null;
	  
	 public Dbutil(){
		 userInfo = new Properties();
		 userInfo.put("user", username);
		 userInfo.put("password", password);
	 }
	 
	 /**
	  * connect to the database, get Connection
	  * @return
	  */
	 public Connection getConnection(){
		 try {
			Class.forName(driver);
			String dbUrl = protocol + dbName + ";create=true";
			
			connection = DriverManager.getConnection(dbUrl, userInfo);
		 } catch (ClassNotFoundException e) {
			e.printStackTrace();
		 } catch (SQLException e) {
		 	e.printStackTrace();
		 }
	     
		 return connection;
	 }
	 
	 /**
	  * release the connection that has been used
	  */
	 public void releaseConnection(){
		 try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	 }
	 
	 /**
	  * General query function
	  * @param query
	  * @return
	  */
	 public ResultSet query(String query){
		 ResultSet resultSet = null;
		 Connection connection = getConnection();
		 try {
			 Statement statement = connection.createStatement();
			 resultSet = statement.executeQuery(query);
		 } catch (SQLException e) {
			 e.printStackTrace();
		 }
		
		 return resultSet;
	 }
	 
	 /**
	  * General update function
	  * @param update
	  */
	 public void update(String update){
		 Connection connection = getConnection();
		 try {
			 Statement statement = connection.createStatement();
			 statement.executeUpdate(update);
			 statement.close();
		 } catch (SQLException e) {
			 e.printStackTrace();
		 }
	 }
}