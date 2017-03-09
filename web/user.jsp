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
        var uname=document.ulogin.username.value;
        var pass=document.ulogin.password.value;
        
        if(uname==0){
            alert("Enter username");
            document.ulogin.username.focus();
            return false;
        }
        if(pass==0){
            alert("Enter password");
            document.ulogin.password.focus();
            return false;
        }
    }
</script>
</head>
<body>
    <%
    if(request.getParameter("status")!=null){
        out.println("<script>alert('Registered')</script>");
    }
    
    %>
<!-- start header -->
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
			<h2 class="title"style="color: coral">USER LOGIN </h2>
				<form action="user_login" name="ulogin" method="post" onsubmit="return validation()"> 
					<input type="text" name="username" placeholder="Enter username"><br></br>

					<input type="password" name="password" placeholder="Enter password"><br></br>
                    <input type="submit" value="LOGIN"style="background-color: #AA330F"><br></br>
                    New User <a href="user_registration.jsp">Register here</a>                   
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
