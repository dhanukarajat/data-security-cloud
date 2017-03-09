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
    var a=document.que.query.value;
    if(a==0)
    {
        alert("Enter the Key word");
        return false;
        document.que.query.focus();
    }
    }
    history.forward();
</script>
</head>
    <body onload="">
<!-- start header -->
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
						<h2 class="title"style="color: coral">QUERY </h2>
                        <form action="query" name="que" method="get" onsubmit="return validation()">
                            <input type="text" name="query"placeholder="Enter keyword">   
                            <input type="submit" value="SEARCH"><BR></BR>  
                            <select name="qtype" style="position: absolute;left: 600px">
                                <option value="range">RangeQuery</option>
                                <option value="knn">KNN</option>
                            </select>
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
