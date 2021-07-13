<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String title = request.getParameter("title");
String author = request.getParameter("author");
String comment = request.getParameter("comment");
String store = request.getParameter("store");
String imageUrl = request.getParameter("imageUrl");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>以下の内容で登録しました</h2>
	<img src="<%= imageUrl %>">
	<p>タイトル	: <%= title %></p>
	<p>著者		： <%= author %></p>
	<p>コメント	： <%= comment %></p>
	<p>店舗名	： <%= PurchaseStore %></p>

	<a href="/s1932058/MainServlet">トップページに戻る</a>
	<a href="/s1932058/MainServlet">登録した本を見る</a>
</body>
</html>