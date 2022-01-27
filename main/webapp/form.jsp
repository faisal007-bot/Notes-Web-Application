<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<title>Add Note</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container mt-5">
		<form action="addNoteServlet" method="post">
			<div class="mb-3 p-4 text-center">
				<label for="exampleInputEmail1" class="form-label text-bold">Enter
					The Title Of The Note</label> <input required="required" type="text"
					class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter The Title"
					name="title">
			</div>
			<div class="container">
				<div class="mb-3 text-center">
					<label for="exampleFormControlTextarea1" class="form-label">Enter
						The Content Of The Note</label>
					<textarea required="required" class="form-control"
						id="exampleFormControlTextarea1" rows="18"
						placeholder="Enter Here" name="content"></textarea>
				</div>
			</div>
			<div class="text-center p-2">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>
		</form>
	</div>
</body>
</html>