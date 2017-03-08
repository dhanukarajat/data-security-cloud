/**
 * Data Confidentiality and security in Cloud
 * @author: Rajat
 */
package pack;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.SocketException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.jasper.tagplugins.jstl.core.Catch;


public class Ftpcon {
    
	FTPClient client = new FTPClient();
    FileInputStream fis = null;
    boolean status;

	public boolean upload(File file){
	   try{
			client.connect("ftp.drivehq.com");
	   
			client.login("username", "password");
			client.enterLocalPassiveMode();
			
			fis = new FileInputStream(file);
			 
			status= client.storeFile(" /c/"+file.getName(), fis);
	   
			client.logout();
			fis.close();
		
		}
		
		catch(Exception e){
			System.out.println(e);
		}
		
		if(status){
			 System.out.println("success");
			 return true;
		}
		else{
			System.out.println("failed");
			return false;
		  
		}
		
	} 
//    public static void main(String[] args) {
//        Ftpcon f=new Ftpcon();
//        f.upload();
//    }
   
}
