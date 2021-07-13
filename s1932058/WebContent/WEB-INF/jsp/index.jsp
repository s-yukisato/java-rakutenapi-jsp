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
	<main>
		<div>
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<% for(int i = 0; i < items.getItems().size(); i++) { %>
					<div class="col">
						<div class="card shadow-sm">
							<p class="text-center">ランキング第<%= i + 1 %>位</p>
							<img id="img<%= i %>" class="d-block mx-auto" src="<%= items.getItems().get(i).getImageUrl() %>" width="177" height="200">
							<div class="card-body">
								<h4 id="title<%= i %>" class="card-title text-success"><u><%= items.getItems().get(i).getTitle() %></u></h4>
								<p id="author<%= i %>">著者：<%= items.getItems().get(i).getAuthor() %></p>
								<p id="publisher<%= i %>">出版社：<%= items.getItems().get(i).getPublisherName() %></p>
								<p id="price<%= i %>">¥<%= items.getItems().get(i).getItemPrice() %></p>
								<p>発売日：<%= items.getItems().get(i).getSalesDate() %></p>
								<p>レビュー評価：<%= items.getItems().get(i).getReviewAverage() %></p>
								<button id="<%= i %>" class="btn btn-outline-secondary" onclick="register(this.id)">登録する</button>
							</div>
						</div>
					</div>
					<% } %>
				</div>
			</div>
			<div id="form-area" class="bg-secondary text-center m-3 p-3">
				<h2>登録内容記入フォーム</h2>
				<p>※記載された内容は後から変更可能です</p>
				<form class="row g-3" action="/s1932058/MainServlet" method="post" id="registerForm">
				  <div class="col-12 form-floating mb-3">
				    <input type="text" name="title" class="form-control" id="inputTitle" placeholder="Title">
				    <label for="inputTitle" class="form-label">Title</label>
				  </div>
				  <div class="col-12 form-floating">
					  <textarea class="form-control" name="comment" placeholder="Leave a comment here" id="inputComment" style="height: 100px"></textarea>
					  <label for="inputComment">Comments</label>
					</div>
					<div class="col-md-5 form-floating mb-3">
				    <input type="text" name="author" class="form-control" id="inputAuthor" placeholder="Author">
				    <label for="inputAuthor" class="form-label">Author</label>
				  </div>
				  <div class="col-md-5 form-floating">
				    <input type="text" name="publisher" class="form-control" id="inputPublisher" placeholder="publisher">
				    <label for="inputPublisher" class="form-label">Publisher</label>
				  </div>
				  <div class="col-md-2 form-floating">
				    <input type="text" name="price" class="form-control" id="inputPrice" placeholder="Price">
				    <label for="inputPrice" class="form-label">Price</label>
				  </div>
				  <div class="col-md-3 form-floating">
				    <input type="text" name="purchaseStore" class="form-control" id="inputPurchaseStore" placeholder="PurchaseStore">
				    <label for="inputPurchaseStore" class="form-label">PurchaseStore</label>
				  </div>
				  <div class="col-md-3 form-floating">
				    <input type="date" name="purchaseDate" class="form-control" id="inputPurchaseDate" placeholder="PurchaseDate">
				    <label for="inputPurchaseDate" class="form-label">PurchaseDate</label>
				  </div>
				  <div class="col-md-3 form-floating">
				    <select id="inputState" class="form-select">
				      <option selected>読みたい！</option>
				      <option>読んでいる！</option>
				      <option>読み終わった！</option>
				    </select>
				    <label for="inputState" class="form-label">State</label>
				  </div>
				  <div class="col-md-2 form-floating">
				    <input type="number" class="form-control" id="inputEvaluation" min="1" max="5">
				    <label for="inputEvaluation" class="form-label">Evaluation</label>
				  </div>
				    <div class="col-md-1">
						<input type="button" value="back" class="btn btn-outline-warning" onclick="resetForm()">
				    </div>
				  <div class="col-12">
				    <button type="submit" class="btn btn-outline-primary">登録する</button>
				  </div>
				</form>
			</div>
		</div>
	</main>
	<footer class="text-muted py-5">
        <div class="container">
            <p class="float-end mb-1">
                <a href="#">Back to top</a>
            </p>
        </div>
    </footer>
	<script>
		ScrollReveal().reveal('.card');
		function register(id){
			// 登録内容の反映
			const inputTitle = document.getElementById("inputTitle");
			// 「登録する」を押された要素のタイトルを取得し、フォームに代入
			const targetTitle = document.getElementById("title" + id);
			inputTitle.setAttribute("value", targetTitle.innerText);
			inputTitle.setAttribute("readonly", true);

			const inputAuthor = document.getElementById("inputAuthor");
			// 「登録する」を押された要素の著者を取得し、フォームに代入
			const targetAuthor = document.getElementById("author" + id);
			inputAuthor.setAttribute("value", targetAuthor.innerText.substring(3));
			inputAuthor.setAttribute("readonly", true);

			const inputPublisher = document.getElementById("inputPublisher");
			// 「登録する」を押された要素の出版社を取得し、フォームに代入
			const targetPublisher = document.getElementById("publisher" + id);
			inputPublisher.setAttribute("value", targetPublisher.innerText.substring(4));
			inputPublisher.setAttribute("readonly", true);

			const inputPrice = document.getElementById("inputPrice");
			// 「登録する」を押された要素の値段を取得し、フォームに代入
			const targetPrice = document.getElementById("price" + id);
			inputPrice.setAttribute("value", targetPrice.innerText.substring(1));
			inputPrice.setAttribute("readonly", true);

			const targetImage = document.getElementById("img" + id);
			const imageUrl = document.createElement("input");
			imageUrl.setAttribute("type","hidden");
			imageUrl.setAttribute("name","imageUrl");
			imageUrl.setAttribute("value", targetImage.src);

			const form = document.getElementById("registerForm");
			form.appendChild(imageUrl);

			document.getElementById("inputComment").focus()
		}

		function resetForm() {
			const inputTitle = document.getElementById("inputTitle");
			inputTitle.readOnly = false;
			inputTitle.setAttribute("value", "");

			const inputAuthor = document.getElementById("inputAuthor");
			inputAuthor.setAttribute("value", "");
			inputAuthor.removeAttribute("readonly");

			const inputPublisher = document.getElementById("inputPublisher");
			inputPublisher.setAttribute("value", "");
			inputPublisher.removeAttribute("readonly");

			const inputPrice = document.getElementById("inputPrice");
			inputPrice.setAttribute("value", "");
			inputPrice.removeAttribute("readonly");

			alert("リセットしてよろしいですか");
		}
	</script>
</body>
</html>