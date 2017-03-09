
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
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
 ResultSet rt=st.executeQuery("select * from user_reg ");


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
	<h2 style="font-size: x-large">Data Confidentiality and Security in Cloud</h2><br>
</div><br>

<div id="banner"></div>

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div style="font-size: 15px;">
        <div class="post" id="ulogin">
            <center>
				<h2 class="title"style="color: coral"> USERS</h2>
                    <form action="activate" method="get">
                        <table style="border-style: solid">
                            <tr STYLE="background-color: burlywood;">                                
                                <td>NAME</td> <td>USERNAME</td><td>PASSWORD</td><td>MAIL</td><td>STATUS</td><td>ACTIVATE</td><td>DEACTIVATE</td>
                            </tr>
                            <%
                            while(rt.next()){
                                String name=rt.getString("name");
                                String uname=rt.getString("username");
                                String pass=rt.getString("password");
                                String mail=rt.getString("mail");
                                String status=rt.getString("activate");
                            %>
                            <tr>
                                <td><%=name%></td> <td><%=uname%></td> <td><%=pass%></td> <td><%=mail%></td><td><%=status%></td>
                                <td><a href="activate?<%=uname%>">Activate</a></td>
                                <td><a href="deactivate?<%=uname%>">Deactivate</a></td>
                            </tr>    
                            <%
                            }
                            %>
                        </table>
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
