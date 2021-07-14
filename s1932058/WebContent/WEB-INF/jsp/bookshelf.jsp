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
<!-- スクロールで現れる -->
<script src="https://unpkg.com/scrollreveal"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<!-- 自作関数 -->
<script src="${pageContext.request.contextPath}/js/bookshelf.js"></script>
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
		<main>
		<div>
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<%
					if (bookList.size() != 0) {
				%>
					<%
						for (int i = 0; i < bookList.size(); i++) {
					%>
					<div class="col">
						<div class="card shadow-sm">
							<img id="img<%=i%>" class="d-block mx-auto"
								src="<%= bookList.get(i).getImageUrl() %>" width="177"
								height="200">
							<div class="card-body">
								<h4 id="title<%=i%>" class="card-title text-success">
									<u><%= bookList.get(i).getTitle() %></u>
								</h4>
								<!--  jsから取得用 -->
								<div class="d-none" >
									<p id="id<%=i%>"><%= bookList.get(i).getId()%></p>
									<p id="author<%=i%>"><%= bookList.get(i).getAuthor()%></p>
									<p id="publisher<%=i%>"><%= bookList.get(i).getPublisher()%></p>
									<p id="price<%=i%>"><%= bookList.get(i).getPrice()%></p>
									<p id="comment<%=i%>"><%= bookList.get(i).getComment()%></p>
									<p id="evaluation<%=i%>"><%= bookList.get(i).getEvaluation()%></p>
									<p id="state<%=i%>"><%= bookList.get(i).getState()%></p>
									<p id="purchaseStore<%=i%>"><%= bookList.get(i).getPurchaseStore()%></p>
									<p id="purchaseDate<%=i%>"><%= bookList.get(i).getPurchaseDate()%></p>
								</div>
								<button type="button" id="<%=i%>detail" class="btn btn-secondary"
									data-bs-toggle="modal" data-bs-target="#detailModal"
									onclick="bindRegisterData(this.id)">詳細</button>
								<button type="button" id="<%=i%>update" class="btn btn-warning"
									data-bs-toggle="modal" data-bs-target="#updateModal"
									onclick="bindRegisterData(this.id)">変更</button>
								<button type="button" id="<%=i%>delete" class="btn btn-danger"
									data-bs-toggle="modal" data-bs-target="#deleteModal"
									onclick="bindRegisterData(this.id)">削除</button>
							</div>
						</div>
					</div>
					<%
						}
					%>
				<%
					} else {
				%>
					<h1>登録した本がありません。</h1>
					<a href="/s1932058/MainServlet" class="btn text-white" role="button" style="font-size:16pt;"><u>本を探しに行く！</u></a>
				<%
					}
				%>
				</div>
			</div>

			<!-- 詳細用Modal -->
			<div class="modal fade" id="detailModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center">
							<h5 class="modal-title" id="exampleModalLabel">詳細</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<img id="detailImage">
							<p id="detailTitle"></p>
							<p id="detailAuthor"></p>
							<p id="detailPublisher"></p>
							<p id="detailPrice"></p>
							<p id="detailState"></p>
							<p id="detailEvaluation"></p>
							<p id="detailComment"></p>
							<p id="detailPurchaseStore"></p>
							<p id="detailPurchaseDate"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">閉じる</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 更新用Modal -->
			<div class="modal fade" id="updateModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center">
							<h5 class="modal-title" id="exampleModalLabel">変更フォーム</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form class="row g-3" action="/s1932058/BookshelfServlet"
								method="post" id="updateForm">
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
								<input type="hidden" name="Action" value="update">
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">閉じる</button>
							<button type="submit" form="updateForm" class="btn btn-success">更新</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 削除用Modal -->
			<div class="modal fade" id="deleteModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center">
							<h5 class="modal-title" id="exampleModalLabel">本棚からの削除</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>一度削除した内容は元には戻りません<br>よろしいですか？</p>
							<form action="/s1932058/BookshelfServlet" method="post" id="deleteForm">
								<input type="hidden" name="Action" value="delete">
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">閉じる</button>
							<button type="submit" form="deleteForm" class="btn btn-danger">削除</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>