<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ page session="false" %>

<HTML>
    <HEAD>
        <TITLE>Database Lookup</TITLE>
    </HEAD>
 
    <BODY>
    
        <H1>Database Lookup</H1>
			<script type="text/javascript">
        		alert("hai this is sathish");
        	</script>
        	
        	
        	<br>
<h3>Persons List</h3>
<c:if test="${!empty search}">
	<table class="tg">
	<tr>
		<th width="80">Person ID</th>
		<th width="120">Person Name</th>
		<th width="120">Person Country</th>
		<th width="120">Person Company</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<tr>
			<td>${search.id}</td>
			<td>${search.name}</td>
			<td>${search.country}</td>
			<td>${search.company}</td>
	</tr>
	<%-- <c:forEach items="${search}" var="person">
		<tr>
			<td>${search.id}</td>
		
			<td>${person.id}</td>
			<td>${person.name}</td>
			<td>${person.country}</td>
			<td>${person.company}</td>
			<td><a href="<c:url value='/edit/${person.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${person.id}' />" >Delete</a></td>
		</tr> 
	</c:forEach> --%>
	</table>
</c:if>
        	
        	
        <%-- <c:url var="search" value="/basic" ></c:url>
        <form:form action="${search}" commandName="id">
        
        <FORM ACTION="basic.jsp" METHOD="POST">
            Please enter the ID of the publisher you want to find:
            <BR>
            <INPUT TYPE="TEXT" NAME="id">
            <BR>
            <INPUT TYPE="SUBMIT" value="Submit">
        </FORM>
        </form:form> --%>
    </BODY>
<HTML>