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
								<p>出版社：<%= items.getItems().get(i).getPublisherName() %></p>
								<p>値段：<%= items.getItems().get(i).getItemPrice() %>円</p>
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
			const formArea = document.getElementById("form-area");

			const registerForm = document.getElementById("registerForm");
			if(registerForm !== null) registerForm.remove();

			// 登録データをpostするため
			const form = document.createElement("form");
			form.setAttribute("action", "/s1932058/MainServlet");
			form.setAttribute("method", "post");
			form.setAttribute("id", "registerForm");
			form.setAttribute("name", "registerForm");

			const br1 = document.createElement("br");

			const targetImage = document.getElementById("img" + id);
			const imageUrl = document.createElement("input");
			imageUrl.setAttribute("type","hidden");
			imageUrl.setAttribute("name","imageUrl");
			imageUrl.setAttribute("value", targetImage.src);
			form.appendChild(imageUrl);

			const targetTitle = document.getElementById("title" + id);
			const labelTitle = document.createElement("label");
			labelTitle.setAttribute("for","title");
			labelTitle.innerText = "タイトル";
			const title = document.createElement("input");
			title.setAttribute("type","text");
			title.setAttribute("id","title");
			title.setAttribute("name","title");
			title.setAttribute("value", targetTitle.innerText);
			form.appendChild(labelTitle);
			form.appendChild(title);
			form.appendChild(br1);

			const br2 = document.createElement("br");

			const targetAuthor = document.getElementById("author" + id);
			const labelAuthor = document.createElement("label");
			labelAuthor.setAttribute("for","author");
			labelAuthor.innerText = "著者";
			const author = document.createElement("input");
			author.setAttribute("type","text");
			author.setAttribute("id","author");
			author.setAttribute("name","author");
			author.setAttribute("value", targetAuthor.innerText.substring(3));
			form.appendChild(labelAuthor);
			form.appendChild(author);
			form.appendChild(br2);

			const br3 = document.createElement("br");

			const labelComment = document.createElement("label");
			labelComment.setAttribute("for","comment");
			const inputComment = document.createElement("input");
			inputComment.setAttribute("type","textarea");
			inputComment.setAttribute("size", 10);
			inputComment.setAttribute("id","comment");
			inputComment.setAttribute("name","comment");
			inputComment.setAttribute("placeholder", "面白い!!!");
			form.appendChild(labelComment);
			form.appendChild(inputComment);
			form.appendChild(br3);

			const br4 = document.createElement("br");

			const store = document.createElement("input");
			store.setAttribute("type","text");
			store.setAttribute("id","store");
			store.setAttribute("name","store");
			store.setAttribute("placeholder", "購入店舗名");
			form.appendChild(store);
			form.appendChild(br4);

			const br5 = document.createElement("br");

			const submit = document.createElement("input");
			submit.setAttribute("type","submit");
			submit.setAttribute("class","btn btn-outline-primary");
			submit.setAttribute("value","登録");
			form.appendChild(submit);
			form.appendChild(br5);

			formArea.appendChild(form);

			document.registerForm.comment.focus();
		}
	</script>
</body>
</html>