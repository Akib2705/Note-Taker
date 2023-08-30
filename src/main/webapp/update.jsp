<%@page import="org.hibernate.Session"%>
<%@page import="com.util.FactoryProvider"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.entities.Note"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>

	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit Your Note</h1>
		<br>

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id"));
		Session s = FactoryProvider.getSessionFactory().openSession();
		Transaction transaction = s.beginTransaction();

		Note note = s.get(Note.class, noteId);
		%>

		<form action="updateServlet" method="post">
			<input value="<%= note.getId()%>" name="noteId" type="hidden" />
			
			
			<div class="form-group">
				<label for="title">Note Title</label> <input type="text"
					class="form-control" id="title" aria-describedby="emailHelp"
					placeholder="Enter your title here" name="title" required
					value="<%=note.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea id="content" placeholder="Enter your content here"
					name="content" class="form-control" style="height: 300px" required>	
					<%=note.getContent()%>
					</textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save your
					Notes</button>
			</div>
		</form>

	</div>


	</div>

</body>
</html>