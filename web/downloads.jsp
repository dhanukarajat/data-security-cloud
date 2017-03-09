
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<!-- start header -->
<%
        Connection con=Dbconnection.getConn();
        Statement st=con.createStatement();
        ResultSet rt=st.executeQuery("select * from downloads");
%>
<div id="header">
	<div id="menu">
            <div>
				<ul>
					<li><a href="users.jsp">Users</a></li>
					<li><a href="file_logs.jsp">FileLogs</a></li>
					<li><a href="downloads.jsp">Downloads</a></li>
					<li><a href="attackers.jsp">Attackers</a></li>
					<li><a href="file_updates.jsp">File Updates</a></li>
					<li class="last"><a href="index.html">Logout</a></li>
				</ul>
           </div>
	</div>
</div>
<!-- end header -->
<div id="logo">
<!--	<h1><a href="#">Voyage </a></h1>-->
<h2 style="font-size: x-large">Data Confidentiality  in the Cloud with RASP
Data Perturbation</h2><br>
</div><br>

<div id="banner"></div>

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div style="font-size: 15px;">
        <div class="post" id="ulogin">
            <center>
			<h2 class="title"style="color: coral"> DOWNLOADS</h2>
                        <table style="border-style: solid">
                            <tr STYLE="background-color: burlywood;">
                                <td>FILENAME</td><td>USERNAME</td><td>DOWNLOAD TIME</td>
                            </tr>
                            <%
                            while(rt.next()){
                                String fname=rt.getString("filename");
                                String uname=rt.getString("username");
                                String time=rt.getString("time");
                         
                            %>
                            <tr>
                                <td><%=fname%></td><td><%=uname%></td><td><%=time%></td>
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
