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
        var uname=document.ureg.username.value;
        var pass=document.ureg.password.value;
        var cpass=document.ureg.cpassword.value;
        var mail=document.ureg.mail.value;
        var name=document.ureg.name.value;
        var ph=document.ureg.mobile.value;
        
        if(name==0){
            alert("Enter name");
            document.ureg.name.focus();
            return false;
        }
        if(uname==0){
            alert("Enter username");
            document.ureg.username.focus();
            return false;
        }
        if(pass==0){
            alert("Enter password");
            document.ureg.password.focus();
            return false;
        }
        if(cpass!=pass){
            alert("Incorrect password");
            document.ureg.cpassword.focus();
            return false;
        }
        
        
        if(mail==0){
            alert("Enter mailid");
            document.ureg.mail.focus();
            return false;
        }
        if(ph==0){
            alert("Enter your mobile no");
            document.ureg.mobile.focus();
            return false;
        }
         if(isNaN(ph)){
                 alert("Invalid phoneno");
                 document.ureg.mobile.focus();
                 return  false;
            }
    }
</script>
</head>
<body>
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
	<h2 style="font-size: x-large">Data Confidentiality and Security in Cloud</h2><br>
</div><br>

<div id="banner"></div>

<!-- start page -->
<div id="page">
	<!-- start content -->
	<div style="font-size: 15px;">
		<div class="post" id="ulogin">
            <center>
				<h2 class="title"style="color: coral">USER REGISTRATION </h2>
                   
                    <form action="user_registration" name="ureg" method="get" onsubmit="return validation()"> 
						<input type="text" name="name" placeholder="Enter your name" ><br></br>
						<input type="text" name="username" placeholder="Enter username"><br></br>
						<input type="password" name="password" placeholder="Enter password"><br></br>
						<input type="password" name="cpassword" placeholder="confirm your password"><br></br>
						<input type="email" name="mail" placeholder="Enter your email"><br></br>
						<input type="text" name="mobile" placeholder="Enter your mobile no" maxlength="10"><br></br>
						<input type="submit" value="Register"style="background-color: #AA330F;width: 150px"><br></br>
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
