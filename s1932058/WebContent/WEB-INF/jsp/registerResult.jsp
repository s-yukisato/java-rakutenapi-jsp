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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<title>登録内容の確認</title>
<!-- スクロールで現れる -->
<script src="https://unpkg.com/scrollreveal"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>
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

	<main>
		<div class="bg-light d-flex align-items-center justify-content-center m-3 p-3">
			<div id="data" class="container m-3 p-3">
				<h2>以下の内容で登録しました</h2>
				<img class="m-3 p-3" src="<%= imageUrl %>">
				<p>タイトル	: <%= title %></p>
				<p>著者		： <%= author %></p>
				<p>出版社	： <%= publisher %></p>
				<p>値段 	： <%= price %></p>
				<p>状態 	： <%= state %></p>
				<p>評価 	： <%= evaluation %></p>
				<p>コメント	： <%= comment %></p>
				<p>店舗名	： <%= purchaseStore  %></p>
				<p>購入日	： <%= purchaseDate  %></p>
			</div>
		</div>
	</main>
	<footer class="bg-light text-muted py-5 m-3 p-3">
		<div class="container m-3 p-3">
			<a class="float-start" href="/s1932058/MainServlet">検索ページに戻る</a>
			<a class="float-end" href="/s1932058/BookshelfServlet">本棚を見る</a>
		</div>
		<div class="container m-3 p-3" style="height: 50px">
			<p class="float-start mb-1">Copyright © 2021 </p>
			<p class="float-end mb-1">
				<a href="#">Back to top</a>
			</p>
		</div>
	</footer>
	<script>
		ScrollReveal().reveal('#data');
	</script>

</body>
</html>