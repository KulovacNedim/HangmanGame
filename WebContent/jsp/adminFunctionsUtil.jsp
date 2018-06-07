<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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