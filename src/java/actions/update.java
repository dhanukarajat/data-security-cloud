/**
 * Data Confidentiality and security in Cloud
 * @author: Rajat
 */
package actions;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;
import pack.encryption;


@WebServlet(name = "update", urlPatterns = {"/update"})
public class update extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
			String fname=request.getParameter("filename");
			String updated=request.getParameter("content");
			//out.println(updated);
			
			KeyGenerator keyGen = KeyGenerator.getInstance("AES");
			keyGen.init(128);
			SecretKey secretKey = keyGen.generateKey();
			System.out.println("secret key:"+secretKey);

			encryption e=new encryption();
			String encryptedtext=e.encrypt(updated,secretKey);

			//converting secretkey to String
			byte[] b=secretKey.getEncoded();//encoding secretkey
			String skey=Base64.encode(b);
			System.out.println("converted secretkey to string:"+skey);
			
			//getting properties
			HttpSession session=request.getSession(true);
			String owner=session.getAttribute("UNAME").toString();
			
			//get current date time with Date()
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			System.out.println(dateFormat.format(date));
			String time=dateFormat.format(date); 
			
			//get current date time with Calendar()
			Calendar cal = Calendar.getInstance();
			System.out.println(dateFormat.format(cal.getTime()));

			Connection con= Dbconnection.getConn();
			Statement st=con.createStatement();
			Statement st1=con.createStatement();
			System.out.println("upto statement ok");
			  
			HttpSession session1=request.getSession(true);
			String fid=session1.getAttribute("fileid").toString();
			String uname=session.getAttribute("UNAME").toString();
			HttpSession session2=request.getSession(true);
			fname=session2.getAttribute("filename").toString();
			System.out.println("fid , filename :"+fid+" "+fname);
			System.out.println("upto this ok");
			 
			int i=  st.executeUpdate("update files set content='"+encryptedtext+"',file_key='"+skey+"' where idfiles='"+fid+"'");

			int j=  st1.executeUpdate("insert into updates (name,filename,time)values('"+uname+"','"+fname+"','"+time+"')");
			con.close();
			response.sendRedirect("user_actions.jsp?st='updated'");
           
        }
        catch(Exception e){
            out.println(e);
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
