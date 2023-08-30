<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>

<!-- Add custom CSS for padding -->
<style>
  .container-fluid {
    padding: 20px;
  }
  .form-group {
    margin-bottom: 20px;
  }
  .container.text-center {
    margin-top: 20px;
  }
</style>

</head>
<body>

	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Please fill your note details here</h1>
		<br>

		<form action="Save" method="post">
			<div class="form-group">
				<label for="title">Note Title</label>
				<input type="text"
					class="form-control" id="title" aria-describedby="emailHelp"
					placeholder="Enter your title here" name="title" required>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea id="content"
					placeholder="Enter your content here" name="content"
					class="form-control" style="height: 300px" required></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>

	</div>

</body>
</html>
