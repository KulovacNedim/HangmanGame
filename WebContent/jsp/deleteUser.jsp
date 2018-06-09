<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="model.User" isErrorPage="false"
	errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<%@ include file="headContent.jsp"%>
	</head>
	
	<body class="lightGrey">
	
		<section id="container">
		
			<!-- HEADER -->
			<section id="header">
				<%@ include file="header.jsp"%>
				
				<br class="clear"/>
			</section>
		
			<!-- CONTENT -->
			<section id="content">
				
				<!-- LEFT SIDE -->
				<section id="leftSide">
				<%@ include file="adminButtons.jsp"%>
		
					<br class="clear"/>
				</section>
				
				<!-- RIGHT SIDE -->
				<section id="rightSide">
					<div class="adminFunction">
						
						<h3>DELETE USER SECTION</h3>
						<br /><br /><br />
	
						<form action="search" method="post" class="form">
							<input type="search" placeholder="Search for user..." name="search"
							value="<%=session.getAttribute("searchString") == null ? "" : session.getAttribute("searchString")%>">
							<input class="button" type="submit" value="Search">
						</form>
	
						<form action="deleteUser" method="post" class="form">
							<select name="userID">
								
								<c:forEach items="${sessionScope.searchResult}" var="result" varStatus="loop">
									<option value="${result.userID}">${result.username}</option>
								</c:forEach>
								
							</select> <input class="button" type="submit" value="Delete user">
						</form>
					</div>
					<br class="clear"/>
				</section>
				
				<br class="clear"/>
			</section>
		
			<!-- FOOTER -->
			<section id="footer">
				<%@ include file="footer.jsp"%>
			</section>
			
		</section>
	</body>
</html>