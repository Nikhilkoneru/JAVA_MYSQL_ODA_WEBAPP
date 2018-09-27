<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>JAVA DYNAMIC WEBAPP BOOKSTORE</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>
	<center>
		<h1>JAVA DYNAMIC WEBAPP BOOKSTORE</h1>
		<br>
        <h2>
        	<a href="new1"><button type="button" class="btn btn-outline-primary">ADD NEW BOOK TO BOOK STORE 1</button></a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="new2"><button type="button" class="btn btn-outline-primary">ADD NEW BOOK TO BOOK STORE 2</button></a>
        	&nbsp;&nbsp;&nbsp;
        	
        	
        </h2>
	</center>
	<br><br>
    <div align="center">
        <caption><h2>List of Books in BookStore 1</h2></caption>
        <table style="width:50%"id="mytable" class="table table-bordered">
            
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="book1" items="${listBook1}">
                <tr>
                    <td><c:out value="${book1.id}" /></td>
                    <td><c:out value="${book1.title}" /></td>
                    <td><c:out value="${book1.author}" /></td>
                    <td><c:out value="${book1.price}" /></td>
                    <td>
                    	<a href="edit1?id=<c:out value='${book1.id}' />">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="delete1?id=<c:out value='${book1.id}' />">Delete</a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br><br>
        <caption><h2>List of Books in Book Store 2</h2></caption>
        <table style="width:50%"id="mytable" class="table table-bordered">
            
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="book2" items="${listBook2}">
                <tr>
                    <td><c:out value="${book2.id}" /></td>
                    <td><c:out value="${book2.title}" /></td>
                    <td><c:out value="${book2.author}" /></td>
                    <td><c:out value="${book2.price}" /></td>
                    <td>
                    	<a href="edit2?id=<c:out value='${book2.id}' />">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="delete2?id=<c:out value='${book2.id}' />">Delete</a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>	
</body>
</html>
