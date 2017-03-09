
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Data Confidentiality</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<script>
    function validation(){
      if(document.ukey.key.value==0){
          alert("Enter your key");
          document.ukey.key.foucs();
          return false;
      }
    }
</script>
</head>
<body>
<!-- start header -->
<%
    if(request.getParameter("status")!=null){
        out.println("<script>alert('invalid key')</script>");
    }
        

%>
<div id="header">
	<div id="menu">
        <div>
			<ul>
				<li class="current_page_item"><a href="index.html">Homepage</a></li>
				<li><a href="admin.jsp">Admin</a></li>
				<li><a href="user.jsp">User</a></li>
				<li><a href="user_registration.jsp">User Registration</a></li>
				<li class="last"><a href="#">Contact</a></li>
			</ul>
        </div>
	</div>
</div>
<!-- end header -->
<div id="logo">
<!--	<h1><a href="#">Voyage </a></h1>-->
<h2 style="font-size: x-large">Data Confidentiality and Security in Cloud</h2><br>
</div><br>

<div id="banner"></div>

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div style="font-size: 15px;">
		<div class="post" id="ulogin">
			<center>
				<h2 class="title"style="color: coral">Welcome ! </h2>
				
					<form action="key_verify" name="ukey" method="post" onsubmit="return validation()"> 
						ENTER YOUR KEY: <input type="text" name="key" placeholder="Enter key"><br></br>
							  
						<input type="submit" value="SUBMIT"style="background-color: #AA330F"><br></br>
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
