<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="all_js_css.jsp"%>
<title>Add Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<c:set var="message" />
		<c:set var="msgcolor" />
		<c:if test="${param.msg == 'added'}">
			<c:set var="message" value="Note Added Successfully !!" />
			<c:set var="msgcolor" value="green" />
		</c:if>
		<p style="color:${msgcolor}; text-align:center">${message}</p>
		<h1>Please fill your note detail</h1>
		<form action="SaveNoteServlet" method="post">
			<div class="from-group mb-3">
				<label for="title" class="form-label">Note title</label> <input
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here" name="title"
					required>
			</div>
			<div class="from-group mb-3">
				<label for="noteContext" class="form-label">Note Content</label>
				<textarea id="content" placeholder="Enter your content here"
					class="form-control" style="height: 300px;" name="content" required></textarea>
			</div>
			<div class="Container text-center">
				<button type="submit" class="btn btn-primary ">Add</button>
			</div>
		</form>
	</div>


</body>
</html>