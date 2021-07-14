<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String title = request.getParameter("title");
String author = request.getParameter("author");
String publisher = request.getParameter("publisher");
String price = request.getParameter("price");
String comment = request.getParameter("comment");
String state = request.getParameter("state");
String evaluation = request.getParameter("evaluation");
String purchaseStore = request.getParameter("purchaseStore");
String purchaseDate = request.getParameter("purchaseDate");
String imageUrl = request.getParameter("imageUrl");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録内容の確認</title>
</head>
<body>
	<h2>以下の内容で登録しました</h2>
	<img src="<%= imageUrl %>">
	<p>タイトル	: <%= title %></p>
	<p>著者		： <%= author %></p>
	<p>出版社	： <%= publisher %></p>
	<p>値段 	： <%= price %></p>
	<p>状態 	： <%= state %></p>
	<p>評価 	： <%= evaluation %></p>
	<p>コメント	： <%= comment %></p>
	<p>店舗名	： <%= purchaseStore  %></p>
	<p>購入日	： <%= purchaseDate  %></p>

	<a href="/s1932058/MainServlet">トップページに戻る</a>
	<a href="/s1932058/BookshelfServlet">登録した本を見る</a>
</body>
</html>