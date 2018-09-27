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
        	<a href="new1"><button type="button" class="btn btn-outline-primary">ADD NEW BOOK TO BOOKSTORE 1</button></a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="list1"><button type="button" class="btn btn-outline-primary">LIST ALL BOOKS FROM ALL STORES</button></a>
        	&nbsp;&nbsp;&nbsp;
        
        	
        </h2>
	</center>
	<br>
    <div align="center">
		<c:if test="${book2 != null}">
			<form action="update2" method="post">
        </c:if>
        <c:if test="${book2 == null}">
			<form action="insert2" method="post">
        </c:if>
        <caption>
            	<h2>
            		<c:if test="${book2 != null}">
            			Edit Book
            		</c:if>
            		<c:if test="${book2 == null}">
            			Add New Book
            		</c:if>
            	</h2>
            </caption>
            <br>
        <table style="width:50%"id="mytable" class="table table-bordred table-striped">
            
            <br>
        		<c:if test="${book2 != null}">
        			<input type="hidden" name="id" value="<c:out value='${book2.id}' />" />
        		</c:if>            
            <tr>
                <th>Title: </th>
                <td>
                	<input type="text" name="title" size="45"
                			value="<c:out value='${book2.title}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Author: </th>
                <td>
                	<input type="text" name="author" size="45"
                			value="<c:out value='${book2.author}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Price: </th>
                <td>
                	<input type="text" name="price" size="5"
                			value="<c:out value='${book2.price}' />"
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" />
            	</td>
            </tr>
        </table>
        </form>
    </div>	
</body>
</html>
