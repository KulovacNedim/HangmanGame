<% if (request.getAttribute("userDelSuccess") != null) { %>
	<p><%=request.getAttribute("userDelSuccess")%></p><br />
<% } %>
	
<% if (request.getAttribute("wordRegSuccess") != null) { %>
<p><%=request.getAttribute("wordRegSuccess")%></p><br />
<% } %>
	
<% if (request.getAttribute("errorMessage") != null) { %>
<p><%=request.getAttribute("errorMessage")%></p><br />
<% } %>
	
<% if (request.getAttribute("passErrorMessage") != null) { %>
<p><%=request.getAttribute("passErrorMessage")%></p><br />
<% } %>
	
<% if (request.getAttribute("categRegSuccess") != null) { %>
<p><%=request.getAttribute("categRegSuccess")%></p><br />
<% } %>
	
<% if (request.getAttribute("registerSuccess") != null) { %>
<p><%=request.getAttribute("registerSuccess")%></p><br />
<% } %>
	
<% if (request.getAttribute("categoryErrorMessage") != null) { %>
<p><%=request.getAttribute("categoryErrorMessage")%></p><br />
<% } %>
		
<% if (request.getAttribute("emptyInputErrorMessage") != null) { %>
<p><%=request.getAttribute("emptyInputErrorMessage")%></p><br />
<% } %>
	
<% if (request.getAttribute("letterUsedErrorMessage") != null) { %>
<p><%=request.getAttribute("letterUsedErrorMessage")%></p><br />
<% } %>
	
<% if (request.getAttribute("loginErrorMessage") != null) { %>
<p><%=request.getAttribute("loginErrorMessage")%></p><br />
<% } %>