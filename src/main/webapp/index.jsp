<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="all_js_css.jsp"%>

<title>Note Taker</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>

		<div class="card bg-white py-5">
			<img class="img-fluid mx-auto" style="max-width: 200px;"
				src="img/pencil.png" alt="Note Card Image">
			<h1 class="text-primary text-uppercase text-center mt-3">Start
				Taking your notes</h1>
			<div class="container text-center">
				<button class="btn btn-outline-primary text-center"
					onclick="window.location.href = 'addnotes.jsp';">Start
					Here</button>
			</div>
		</div>
	</div>





</body>
</html>