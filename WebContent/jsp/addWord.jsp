<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="java.util.Iterator"%>
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
						<h3>ADD WORD SECTION</h3>
							<br />
							
						<form action="addWord" method="post" class="form">
							<label>Word</label> <input type="text" name="word" id="word" value=""><br />
							<label>Select category</label>
							<select name="categoryID">
							<%
								ArrayList<Category> categories = (ArrayList) session.getAttribute("categories");
								Iterator<Category> iterator = categories.iterator();
								while (iterator.hasNext()) {
									Category category = iterator.next();
							%>
							<option value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>
							<%
								}
							%>
	
							</select> 
							
							<input class="button" type="submit" value="Save word">
						</form>
					</div>
					<br class="clear"/>
				</section>
				
			</section>
			
			<!-- FOOTER -->
			<section id="footer">
				<%@ include file="footer.jsp"%>
			</section>
			
		</section>

	</body>
</html>