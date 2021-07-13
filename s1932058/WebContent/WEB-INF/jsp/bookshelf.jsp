<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Manage, java.util.List"%>
<%
	List<Manage> bookList = (List<Manage>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<title>TOP PAGE</title>
<script src="https://unpkg.com/scrollreveal"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<title>MY本棚</title>
</head>
<body>
	<header>
		    <nav class="navbar navbar-dark bg-dark">
		        <div class="container-fluid d-flex justify-content-between">
		            <a href="/s1932058/MainServlet" class="btn text-white p-3" role="button" style="font-size:24pt;font-weight:bold;">書籍管理アプリ</a>
		            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		                data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent"
		                aria-expanded="false" aria-label="Toggle navigation">
		                <span class="navbar-toggler-icon"></span>
		            </button>
		        </div>
		    </nav>
		    <div class="collapse" id="navbarToggleExternalContent">
		        <div class="bg-dark p-4">
		            <a href="/s1932058/BookshelfServlet" class="btn text-white" role="button" style="font-size:16pt;"><u>私の本棚</u></a>
		            <br>
		            <span class="text-muted">登録した本を見に行く</span>
		        </div>
		        <div class="bg-dark p-4">
		            <a href="/s1932058/MainServlet" class="btn text-white" role="button" style="font-size:16pt;"><u>本を探す</u></a>
		            <br>
		            <span class="text-muted">レビューや売上で検索できます</span>
		        </div>
		    </div>
	</header>
	<%
		if (bookList != null) {
	%>
		<%
			for (Manage book : bookList) {
		%>
			<p><%= book.getTitle()%></p>
			<img src="<%= book.getImageUrl()%>">

		<%
			}
		%>
	<%
		} else {
	%>
		<h1>登録した本がありません。</h1>
		<a href="/s1932058/MainServlet" class="btn text-white" role="button" style="font-size:16pt;"><u>本を探す</u></a>
	<%
		}
	%>
</body>
</html>