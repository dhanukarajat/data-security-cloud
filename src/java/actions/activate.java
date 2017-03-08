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
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pack.Dbconnection;
import pack.MailUtil;
import pack.encryption;


public class activate extends HttpServlet {

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
            String uname=request.getQueryString();
            Random r=new Random();
            int n=r.nextInt();
            String key=n+"";
            
			Connection con= Dbconnection.getConn();
          
			Statement st1=con.createStatement();
			ResultSet rt1=st1.executeQuery("select * from user_reg where username='"+uname+"'");
          
			if(rt1.next()){
				String[] mail=new String[]{rt1.getString("mail")};
				new MailUtil().sendMail(mail, mail, "productkey", key);
			}
			else{
              out.println("gettin mail id failed");
			}
          
			Statement st=con.createStatement();
			int i=st.executeUpdate("update user_reg set product_key='"+key+"',activate='yes' where username='"+uname+"' ");
			if(i!=0){
				response.sendRedirect("users.jsp");
			}
			else{
				out.println("error while entering data");
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
