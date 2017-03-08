/**
 * Data Confidentiality and security in Cloud
 * @author: Rajat
 */
package pack;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconnection {
    
    public static Connection getConn()throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/building_confidential","root","root");
        return con;
    
    }
   
}
