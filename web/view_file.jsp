<%@page import="pack.decryption"%>
<%@page import="pack.encryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Cloud Security Project
Author: Rajat
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Data Confidentiality</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<script>
    function validation(){
     
    }
</script>
</head>
<body>
    <%
   
        String id=request.getQueryString();
        HttpSession session1=request.getSession(true);
        session1.setAttribute("fileid", id);
        
        Connection con=Dbconnection.getConn();
        Statement st=con.createStatement();
        ResultSet rt=st.executeQuery("select * from files where idfiles='"+id+"'");
        StringBuffer sb=new StringBuffer();
        InputStream is=null;
        String fname=null,temp=null,fkey=null;
       
       if(rt.next()){
           fname=rt.getString("filename");
           fkey=rt.getString("file_key");
           is=(InputStream)rt.getAsciiStream("content");             
       }
       else{
           out.println("error while retreiving data");
       }
       BufferedReader br=new BufferedReader(new InputStreamReader(is));
        while((temp=br.readLine())!=null){
            sb.append(temp);
        }
        String content=new decryption().decrypt(sb.toString(),fkey);
        
    %>
<!-- start header -->
<div id="header">
	<div id="menu">
		<div>
			<ul>
				<li><a href="query.jsp">SEARCH</a></li>
				<li><a href="upload.jsp">UPLOAD</a></li>
				<li><a href="update.jsp">UPDATE</a></li>
				<li class="last"><a href="#">Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- end header -->
<div id="logo">
	<h2 style="font-size: x-large">Data Confidentiality and Security in Cloud</h2><br>
</div><br>

<div id="banner"></div>

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div style="font-size: 15px;">
		<div class="post" id="ulogin">
			<center>
				<h2 class="title"style="color: coral">FileName:<input type="text" name="filename" value="<%=fname%>"readonly="readonly"></input> </h2>
				<%
				HttpSession session2=request.getSession();
				session2.setAttribute("filename",fname);
				%>
				<form action="update" method="post">
					<!--<p><%=content%></p>-->
					<textarea style="width: 400px; height: 400px;" name="content"><%=content%></textarea><br></br>
					<input type="submit" value="UPDATE"></input>
				</form>
			   
			</center>
		
		</div>
	<!-- end content -->
	<!-- start sidebar -->
	
	<!-- end sidebar -->
		<div style="clear: both;">&nbsp;</div>
	</div>
<!-- end page -->
<!-- start footer -->
<div id="footer">
	<p id="legal">Academic Project</p>
</div>
<!-- end footer -->

</body>
</html>
