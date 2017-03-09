
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
if(request.getParameter("st")!=null){
    out.println("<script>alert('updated')</script>");
}
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
			<%
		   String name=(String)session.getAttribute("UNAME");
			
			%>
			<h2 class="title"style="color: coral">Welcome ! <%=name%> </h2>
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
