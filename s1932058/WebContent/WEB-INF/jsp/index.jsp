<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Items"%>
<%
	Items items = new Items();
	items = (Items) request.getAttribute("result");
	String mode = (String) request.getAttribute("mode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<title>TOP PAGE</title>
<!-- スクロールで現れる -->
<script src="https://unpkg.com/scrollreveal"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<!-- 自作関数 -->
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-dark bg-dark">
			<div class="container-fluid d-flex justify-content-between">
				<a href="/s1932058/MainServlet" class="btn text-white p-3"
					role="button" style="font-size: 24pt; font-weight: bold;">書籍管理アプリ</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse"
					data-bs-target="#navbarToggleExternalContent"
					aria-controls="navbarToggleExternalContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</nav>
		<div class="collapse" id="navbarToggleExternalContent">
			<div class="bg-dark p-4">
				<a href="/s1932058/BookshelfServlet" class="btn text-white"
					role="button" style="font-size: 16pt;"><u>私の本棚</u></a> <br> <span
					class="text-muted">登録した本を見に行く</span>
			</div>
			<div class="bg-dark p-4">
				<a href="/s1932058/MainServlet" class="btn text-white" role="button"
					style="font-size: 16pt;"><u>本を探す</u></a> <br> <span
					class="text-muted">レビューや売上で検索できます</span>
			</div>
		</div>

		<div class="bg-dark shadow-sm">
			<div class="container mb-3 p-3">
				<a href="#" class="navbar-brand d-flex align-items-center"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="none" stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2" aria-hidden="true"
						class="me-2" viewBox="0 0 24 24">
                        <circle cx="12" cy="13" r="4" />
                    </svg> <strong class="text-light">おすすめの書籍一覧</strong>
				</a>
				<form action="/s1932058/MainServlet" method="post" class="d-flex">
					<input type="hidden" name="Action" value="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" name="searchKeyword">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>

		</div>
	</header>
	<main>
		<div>
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<%
						for (int i = 0; i < items.getItems().size(); i++) {
					%>
					<div class="col">
						<div class="card shadow-sm">
							<%
								if(mode.equals("ranking")) {
							%>
								<h4 class="text-center p-2">
									ランキング　第<%=i + 1%>位
								</h4>
							<%
								} else if(mode.equals("search")) {
							%>
								<h4 class="text-center p-2">
									検索結果　<%=i + 1%>
								</h4>
							<%
								}
							%>
							<img id="img<%=i%>" class="d-block mx-auto"
								src="<%=items.getItems().get(i).getImageUrl()%>" width="177"
								height="200">
							<div class="card-body">
								<h4 id="title<%=i%>" class="card-title text-success overflow-hidden" style="height: 50pt;">
									<u><%=items.getItems().get(i).getTitle()%></u>
								</h4>
								<p id="author<%=i%>">
									著者：<%=items.getItems().get(i).getAuthor()%></p>
								<p id="publisher<%=i%>">
									出版社：<%=items.getItems().get(i).getPublisherName()%></p>
								<p id="price<%=i%>">
									¥<%=items.getItems().get(i).getItemPrice()%></p>
								<p>
									発売日：<%=items.getItems().get(i).getSalesDate()%></p>
								<p>
									レビュー評価：<%=items.getItems().get(i).getReviewAverage()%></p>
								<button type="button" id="<%=i%>" class="btn btn-secondary"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									onclick="bindData(this.id)">登録する</button>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>

			<!-- 登録用Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center">
							<h5 class="modal-title" id="exampleModalLabel">登録フォーム</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3" action="/s1932058/MainServlet"
								method="post" id="registerForm">
								<div class="col-12 form-floating mb-3">
									<input type="text" name="title" class="form-control"
										id="inputTitle" placeholder="Title"> <label
										for="inputTitle" class="form-label">Title</label>
								</div>
								<div class="col-12 form-floating">
									<textarea class="form-control" name="comment"
										placeholder="Leave a comment here" id="inputComment"
										style="height: 100px"></textarea>
									<label for="inputComment">Comments</label>
								</div>
								<div class="col-md-4 form-floating">
									<select id="inputState" class="form-select" name="state">
										<option selected>読みたい！</option>
										<option>読んでいる！</option>
										<option>読み終わった！</option>
									</select> <label for="inputState" class="form-label">State</label>
								</div>
								<div class="col-md-4">
									<label for="inputEvaluation" class="form-label">Evaluation</label>
									<input type="range" class="form-range" min="0" max="5" step="1"
										name="evaluation" id="inputEvaluation" list="my-datalist">
									<datalist id="my-datalist">
										<option value="0">
										<option value="1">
										<option value="2">
										<option value="3">
										<option value="4">
										<option value="5">
									</datalist>
								</div>
								<div class="col-md-4 form-floating">
									<input type="text" name="price" class="form-control"
										id="inputPrice" placeholder="Price"> <label
										for="inputPrice" class="form-label">Price</label>
								</div>
								<div class="col-md-6 form-floating mb-3">
									<input type="text" name="author" class="form-control"
										id="inputAuthor" placeholder="Author"> <label
										for="inputAuthor" class="form-label">Author</label>
								</div>
								<div class="col-md-6 form-floating">
									<input type="text" name="publisher" class="form-control"
										id="inputPublisher" placeholder="publisher"> <label
										for="inputPublisher" class="form-label">Publisher</label>
								</div>
								<div class="col-md-5 form-floating">
									<input type="text" name="purchaseStore" class="form-control"
										id="inputPurchaseStore" placeholder="PurchaseStore"> <label
										for="inputPurchaseStore" class="form-label">PurchaseStore</label>
								</div>
								<div class="col-md-5 form-floating">
									<input type="date" name="purchaseDate" class="form-control"
										id="inputPurchaseDate" placeholder="PurchaseDate"> <label
										for="inputPurchaseDate" class="form-label">PurchaseDate</label>
								</div>
								<div class="col-md-2">
									<input type="button" value="Reset" class="btn btn-warning"
										onclick="resetForm();reset();">
								</div>
								<input type="hidden"  name="Action" value="register">
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">閉じる</button>
							<button type="submit" form="registerForm" class="btn btn-success">登録</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 終　登録用Modal -->

			<!-- 検索用Modal -->
			<div class="modal fade" id="searchModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center">
							<h5 class="modal-title" id="exampleModalLabel">検索</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3" action="/s1932058/MainServlet"
								method="post" id="registerForm">
								<div class="col-12 form-floating mb-3">
									<input type="text" name="title" class="form-control"
										id="inputTitle" placeholder="Title"> <label
										for="inputTitle" class="form-label">Title</label>
								</div>
								<input type="hidden"  name="Action" value="search">
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">閉じる</button>
							<button type="submit" form="registerForm" class="btn btn-success">検索！</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 終　検索用Modal -->
		</div>
	</main>
	<footer class="bg-light text-muted py-5 m-3 p-3">
		<div class="container m-3 p-3" style="height: 50px">
			<p class="float-start mb-1">Copyright © 2021 </p>
			<p class="float-end mb-1">
				<a href="#">Back to top</a>
			</p>
		</div>
	</footer>
	<script>
		ScrollReveal().reveal('.card');
	</script>
</body>
</html>