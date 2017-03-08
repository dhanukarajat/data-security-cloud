/**
 * Data Confidentiality and security in Cloud
 * @author: Rajat
 */
package actions;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.oreilly.servlet.MultipartRequest;  
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import pack.Dbconnection;
import pack.Ftpcon;
import pack.encryption;


@WebServlet(name = "upload", urlPatterns = {"/upload"})
public class upload extends HttpServlet {
File file;
final String filepath="C:/Users/username/Desktop/CLOUD DATA/"; //Localhost cloud folder to upload files

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
            
			MultipartRequest m=new MultipartRequest(request,filepath);
			File file=m.getFile("file");           
			String filename=file.getName().toLowerCase();

			//out.println("file location:"+filepath+"\n file name:"+filename+"\n");  

			BufferedReader br=new BufferedReader(new FileReader(filepath+filename));
			StringBuffer sb=new StringBuffer();
			String temp=null;

			while(( temp=br.readLine())!=null){
				sb.append(temp);              
			}           
			// out.println("file content:"+sb.toString());

			// secretkey generating
			KeyGenerator keyGen = KeyGenerator.getInstance("AES");
			keyGen.init(128);
			SecretKey secretKey = keyGen.generateKey();
			System.out.println("secret key:"+secretKey);

			encryption e=new encryption();
			String encryptedtext=e.encrypt(sb.toString(),secretKey);
			//storing encrypted file
			FileWriter fw=new FileWriter(file);
			fw.write(encryptedtext);
			fw.close();

			//converting secretkey to String
			byte[] b=secretKey.getEncoded();//encoding secretkey
			String skey=Base64.encode(b);
			System.out.println("converted secretkey to string:"+skey);

			//getting properties
			HttpSession session=request.getSession(true);
			String owner=session.getAttribute("UNAME").toString();

			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			//get current date time with Date()
			Date date = new Date();
			System.out.println(dateFormat.format(date));
			String time=dateFormat.format(date); 
			//get current date time with Calendar()
			Calendar cal = Calendar.getInstance();
			System.out.println(dateFormat.format(cal.getTime()));

			String len=file.length()+"bytes";

			//uploading file
			boolean status=new Ftpcon().upload(file);
			if(status){
				Connection con= Dbconnection.getConn();
				Statement st=con.createStatement();
				int i=st.executeUpdate("insert into files(filename,content,owner_name,upload_time,size,file_key)values('"+file.getName()+"','"+encryptedtext+"','"+owner+"','"+time+"','"+len+"','"+skey+"')");

				if(i!=0){
				   // out.println("success");
					response.sendRedirect("upload.jsp?status='uploded'");
					
				}
				else{
					out.println("error while uploading additional informations");
				}
				// out.println("file stored");
				// out.println(file.length());
			}
			else{
				out.println("error");
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
