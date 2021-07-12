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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<title>TOP PAGE</title>
	<script src="https://unpkg.com/scrollreveal"></script>
</head>
<body>
	<header>
        <div class="bg-dark shadow-sm">
            <div class="container">
                <a href="#" class="navbar-brand d-flex align-items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor"
                        stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2"
                        viewBox="0 0 24 24">
                        <circle cx="12" cy="13" r="4" />
                    </svg>
                    <strong class="text-light">おすすめの書籍一覧</strong>
                </a>
            </div>
        </div>
	</header>
	<div>
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<% for(int i = 0; i < items.getItems().size(); i++) { %>
				<div class="col">
					<div class="card shadow-sm">
						<p class="text-center">ランキング第<%= i + 1 %>位</p>
						<img class="d-block mx-auto" src="<%= items.getItems().get(i).getImageUrl() %>" width="177" height="200">
						<div class="card-body">
							<h4 class="card-title text-success"><u><%= items.getItems().get(i).getTitle() %></u></h4>
							<p>著者：<%= items.getItems().get(i).getAuthor() %></p>
							<p>出版社：<%= items.getItems().get(i).getPublisherName() %></p>
							<p>値段：<%= items.getItems().get(i).getItemPrice() %>円</p>
							<p>発売日：<%= items.getItems().get(i).getSalesDate() %></p>
							<p>レビュー評価：<%= items.getItems().get(i).getReviewAverage() %></p>
							<button class="btn btn-outline-secondary" onclick="register()">登録する</button>
						</div>
					</div>
				</div>
				<% } %>
			</div>
		</div>
	</div>
	<script>
		ScrollReveal().reveal('.card');
		function register() {
			alert('登録しました');
		}
	</script>
</body>
</html>