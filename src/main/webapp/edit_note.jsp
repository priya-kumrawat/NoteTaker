<%@page import="org.hibernate.Session" %>
<%@page import="com.todo.helper.FactoryProvider" %>
<%@page import="com.todo.entity.Note" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="all_js_css.jsp"%>

<title>Edit Note : Note Taker</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		
			<h1 class="text-center">edit your note</h1>

	<%
	int id = Integer.parseInt(request.getParameter("note_id").trim());
	Session s = FactoryProvider.getFactory().openSession();
	Note note= (Note)s.get(Note.class, id);
	%>


<form action="UpdateNoteServlet" method="post">
<input value="<%= note.getId() %>" name="id" hidden />
			<div class="from-group mb-3">
				<label for="title" class="form-label">Note title</label> <input
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here" name="title" value="<%=note.getTitle() %>"
					required />
			</div>
			<div class="from-group mb-3">
				<label for="noteContext" class="form-label">Note Content</label>
				<textarea id="content" placeholder="Enter your content here"
					class="form-control" style="height: 200px;" name="content" required><%=note.getContent() %></textarea>
			</div>
			<div class="Container text-center">
				<button type="submit" class="btn btn-success">Save Your Note</button>
			</div>
		</form>
	</div>




</body>
</html>