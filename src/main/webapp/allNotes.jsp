<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.util.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes : Note Taker</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 style="text-align: center;" class="text-uppercase">All Notes</h1>

	</div>


	<div class="row">
		<div class="col-12">
			<%
			Session s = FactoryProvider.getSessionFactory().openSession();
			Query q = s.createQuery("from Note");
			List<Note> list = q.list();

			for (Note note : list) {
			%>
			<div class="card mt-3">
				<img class="card-img-top m-4 mx-auto" style="max-width: 100px"
					src="image/notepad.png" alt="Card image cap">
				<div class="card-body px-10">
					<h5 class="card-title"><%=note.getTitle()%></h5>
					<p class="card-text">
						<%=note.getContent()%></p>
						
						<p><h3>AddedDate :</h3><b class="text-primary"><%= note.getAddedDate() %></b></p>

					<div class="container text-center mt-2">
						<a href="DeleteServlet?note_id=<%= note.getId()%>" class="btn btn-danger">Delete</a> 
						<a href="update.jsp?note_id=<%= note.getId()%>" class="btn btn-primary">Edit</a>
					</div>

				</div>
			</div>

			<%
			}
			s.close();
			%>

		</div>

	</div>


</body>
</html>