<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Data Confidentiality</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<script>
   
   
</script>
</head>
<body>
<!-- start header -->
<%
  String q=request.getQueryString();
//  String[] q1=q.split(".");
//  String query=q1[1];
  System.out.println();
  for(String t:q.split(".")){
      System.out.println("q:"+t);
  }

Connection con=Dbconnection.getConn();
Statement st=con.createStatement();
ResultSet rt=st.executeQuery("select * from files where filename like '"+q+"' and owner_name='"+session.getAttribute("UNAME").toString()+"'");


%>
<div id="header">
	<div id="menu">
            <div>
				<ul>
                    <li><a href="query.jsp">SEARCH</a></li>
                    <li><a href="upload.jsp">UPLOAD</a></li>
                    <li><a href="update.jsp">UPDATE</a></li>
                    <li class="last"><a href="index.html">Logout</a></li>
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
						<h2 class="title"style="color: coral">KNN QUERY PROCESSING </h2>
                        <table style="border-style: solid ">
                            <tr style="background-color: #897B7B">
                                <td >FILENAME</td><td>SIZE</td><td>DOWNLOAD</td><td>VIEW</td>
                            </tr>
						   <%
						   while(rt.next()){
							   String filename=rt.getString("filename");
							   String size=rt.getString("size");
							   String id=rt.getString("idfiles");
						   %>
                            <tr>
                                <td><%=filename%></td><td><%=size%></td><td><a href="download?<%=id%>">download</a></td><td><a href="view_file.jsp?<%=id%>">view</a></td>
                            </tr>
                            <%
							}
                            %>
                        </table>
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
