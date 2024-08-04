<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.List"%>
<%@page import="com.todo.entity.Note"%>
<%@page import="com.todo.helper.FactoryProvider"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="all_js_css.jsp"%>

<title>All notes : Note Taker</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<c:set var="message" />
		<c:set var="msgcolor" />
		<c:if test="${param.msg == 'deleteSuccess'}">
			<c:set var="message" value="Note Delete Successfully !!" />
			<c:set var="msgcolor" value="green" />
		</c:if>
		<c:if test="${param.msg == 'updateSuccess'}">
			<c:set var="message" value="Note Update Successfully !!" />
			<c:set var="msgcolor" value="green" />
		</c:if>
		<p style="color:${msgcolor};">${message}</p>
			<%
			Session s = FactoryProvider.getFactory().openSession();
			Query q = s.createQuery("from Note");
			List<Note> list = q.list();
			for (Note note : list) {
			%>

			<div class="container-fluid card">
				<div class="card-body">
					<h5 class="card-title"><%=note.getTitle()%></h5>
					<p class="card-text"><%=note.getContent()%></p>
					<p><b> Last Update : </b><%=note.getAddedDate() %></p>
					<div class="container text-center mt-2">
						<a href="edit_note.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a> 
						<a href="DeleteNoteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
					</div>
				</div>
			</div>
			<%
			}
			s.close();
			%>
		</div>
</body>
</html>