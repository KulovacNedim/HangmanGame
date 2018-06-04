<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
</head>
<body class="lightGrey">
	
	
	<section id="container">
	
	<!-- HEADER -->
	<section id="header">
		<%@ include file="header.jsp"%>
	</section>
	
	<!-- CONTENT -->
	<section id="content">
		
	<!-- LEFT SIDE -->
		<section id="leftSide">
<!-- 			<img src="images/7.png"> -->
<%@ include file="adminButtons.jsp"%>
		</section>
		
	<!-- RIGHT SIDE -->
		<section id="rightSide">
			
<!-- 			<a href="addUser" class="btn btn-info" role="button">Add user</a> -->
<!-- 			<a href="deleteUser" class="btn btn-info" role="button">Delete user</a> -->
			
<!-- 			<a href="addCategory" class="btn btn-info" role="button">Add word categories</a> -->
<!-- 			<a href="addWord" class="btn btn-info" role="button">Add words</a> -->
			
<!-- 			<a href="addUser"><input type="button" value="ADD USER"></a><br /><br /> -->
<!-- 			<a href="deleteUser"><input type="button" value="DELETE USER"></a><br /><br /> -->
<!-- 			<a href="addCategory"><input type="button" value="ADD WORD CATEGORIES"></a><br /><br /> -->
<!-- 			<a href="addWord"><input type="button" value="ADD WORDS"></a><br /><br /> -->
		</section>
		
	</section>
	
	<!-- FOOTER -->
	<section id="footer">
		
	</section>
</section>
	
	
	
	
	<%
		if (request.getAttribute("registerSuccess") != null) {
	%>
	<%=request.getAttribute("registerSuccess")%><br />
	<%
		}
	%>

</body>
</html>