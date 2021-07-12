<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Items" %>
<%
Items items = new Items();
items = (Items) request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>検索結果</h1>
	<% for(int i = 0; i < items.getItems().size(); i++) { %>
	<div>
		<p><%= i %>
		<p><%= items.getItems().get(i).getTitle() %></p>
		<p><%= items.getItems().get(i).getAuthor() %></p>
		<img src="<%= items.getItems().get(i).getImageUrl() %>"></p>
	</div>
	<% } %>
</body>
</html>