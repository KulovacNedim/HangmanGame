<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body>
<section id="container">
	
	<!-- HEADER -->
	<section id="header">
		<%@ include file="header.jsp"%>
	</section>
	
	<!-- CONTENT -->
	<section id="content">
		
	<!-- LEFT SIDE -->
		<section id="leftSide">
			<img src="images/7.png">
		</section>
		
	<!-- RIGHT SIDE -->
		<section id="rightSide">
				<form action="addCategory" method="post">
		<label>Category</label> 
		<input type="text" name="categoryname" id="categoryname" value=""><br /> 
	 
		<input type="submit" value="Save category">
	</form>

		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		<%
		if (request.getAttribute("categRegSuccess") != null) {
	%>
	<%=request.getAttribute("categRegSuccess")%><br />
	<%
		}
	%>
	</section>
</section>


	




	
	
</body>
</html>