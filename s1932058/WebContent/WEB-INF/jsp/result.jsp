<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Result" %>
<%
Result result = (Result)	request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>検索結果</h1>
	<p><%= result.getTitle() %></p>
	<p><%= result.getAuthor() %></p>
	<img src="<%= result.getImageUrl() %>"></p>
</body>
</html>