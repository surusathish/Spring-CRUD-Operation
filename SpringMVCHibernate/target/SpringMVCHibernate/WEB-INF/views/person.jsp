<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@ page session="false"%>
<html>
<head>
<title>Person Page</title>
<style type="text/css">
@font-face {
	font-family: 'Raleway';
	font-style: normal;
	font-weight: 400;
	src: local('Raleway'),
		url(http://fonts.gstatic.com/s/raleway/v9/IczWvq5y_Cwwv_rBjOtT0w.woff)
		format('woff');
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}

div#first {
	width: 350px;
	height: auto;
	margin: 50px auto 0;
	padding: 50px;
	background-color: #EEE;
	color: #333;
	border: 2px solid #C2D6FF;
	border-radius: 40px 0 40px 0
}

input#box {
	background-repeat: no-repeat;
	background-position: 6px;
	border: 1px solid #DADADA;
	margin-top: 10px;
	margin-bottom: 10px;
	padding-left: 35px;
	width: 310px;
	height: 30px;
	font-size: 14px;
	box-shadow: 0 0 10px;
	-webkit-box-shadow: 0 0 10px;
	-moz-box-shadow: 0 0 10px;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px 
}

input#submit {
	background-color: #cc7a66;
	border-radius: 5px;
	border: none;
	padding: 10px 25px;
	color: #FFF;
	text-shadow: 1px 1px 1px #949494;
	margin-left: 120px
}

input#submit:hover {
	background-color: #FF9980
}
</style>
<script src="./libs/jquery/1.10.1/jquery.min.js"></script>
</head>
<body>
	<div id="first">
		<h1>Add a Person</h1>
		<c:url var="addAction" value="/person/add"></c:url>

		<form:form action="${addAction}" commandName="person">
			<table>
				<c:if test="${!empty person.name}">
					<tr>
						<td><form:label path="id">
								<spring:message text="ID" />
							</form:label></td>	
					<tr> 
						<td><form:input id="box" path="id" readonly="true" size="8"
								disabled="true" /> <form:hidden path="id" /></td>
					</tr>
					
				</c:if>
				<tr>
					<td><form:label path="name">
							<spring:message text="Name" />
						</form:label></td></tr> 
				<tr>		
					<td><form:input id="box" path="name" /></td>
				</tr>
				<tr>
					<td><form:label path="country">
							<spring:message text="Country" />
						</form:label></td> </tr>
				<tr>
					<td><form:input id="box" path="country" /></td>
				</tr>
				<tr>
					<td><form:label path="company">
							<spring:message text="Company" />
						</form:label></td> </tr>
				<tr> <td><form:input id="box" path="company" /></td> 
				</tr>
				<tr>
					<td colspan="2"><c:if test="${!empty person.name}">
							<input id="submit" type="submit"
								value="<spring:message text="Edit Person"/>" />
						</c:if> <c:if test="${empty person.name}">
							<input id="submit" type="submit"
								value="<spring:message text="Add Person"/>" />
						</c:if></td>
				</tr>
			</table>
		</form:form>

		<c:url var="searchAction" value="/person/search"></c:url>
		<div>
				<h3>Search Person</h3>
		
			<form:form action="${searchAction}" modelAttribute="person">
			<br>
				<table>
					<tr>
						<td><form:input id="box" path="name" /></td>
						
					</tr>

					<tr>
						<td><input id="submit" type="submit"
							value="<spring:message text="Search Person"/>" /></td>
					</tr>


				</table>
			</form:form>
		</div>
	</div>



	<c:if test="${!empty search.name}">
		<h3>Searched Item</h3>
		<table class="tg" id="search">
			<tr>
				<th width="80">Person ID</th>
				<th width="120">Person Name</th>
				<th width="120">Person Country</th>
				<th width="120">Person Company</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<tr id="123" data-person="person" data-salary="120">
				<td>${search.id}</td>
				<td>${search.name}</td>
				<td>${search.country}</td>
				<td>${search.company}</td>
			</tr>
		</table>
	</c:if>




	<h3>Persons List</h3>
	<c:if test="${!empty listPersons}">
		<table class="tg">
			<tr>
				<th width="80">Person ID</th>
				<th width="120">Person Name</th>
				<th width="120">Person Country</th>
				<th width="120">Person Company</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${listPersons}" var="person">
				<tr>
					<td>${person.id}</td>
					<td>${person.name}</td>
					<td>${person.country}</td>
					<td>${person.company}</td>
					<td><a href="<c:url value='/edit/${person.id}' />">Edit</a></td>
					<td><a href="<c:url value='/remove/${person.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
