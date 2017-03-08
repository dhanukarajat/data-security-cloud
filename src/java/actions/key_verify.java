/**
 * Data Confidentiality and security in Cloud
 * @author: Rajat
 */
package actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;


@WebServlet(name = "key_verify", urlPatterns = {"/key_verify"})
public class key_verify extends HttpServlet {

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
			String key=request.getParameter("key");

			Connection con= Dbconnection.getConn();
			Statement st=con.createStatement();
			ResultSet rt=st.executeQuery("select * from user_reg where product_key='"+key+"'");
			if(rt.next()){
				response.sendRedirect("user_actions.jsp");
			}
			else{
				
				HttpSession session=request.getSession(true);
				String name=(String)session.getAttribute("UNAME");

				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				//get current date time with Date()
				java.util.Date date = new java.util.Date();
				System.out.println(dateFormat.format(date));

				//get current date time with Calendar()
				Calendar cal = Calendar.getInstance();
				String d=dateFormat.format(cal.getTime());
				System.out.println(dateFormat.format(cal.getTime()));
				  
				Statement st1=con.createStatement();
				st1.executeUpdate("insert into attacker (attacker,time)values('"+name+"','"+d+"')");

				response.sendRedirect("user_key.jsp?status='invalid'");
			}
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
