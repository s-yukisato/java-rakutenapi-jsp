function bindData(id) {
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
	inputPublisher
			.setAttribute("value", targetPublisher.innerText.substring(4));
	inputPublisher.setAttribute("readonly", true);

	const inputPrice = document.getElementById("inputPrice");
	// 「登録する」を押された要素の値段を取得し、フォームに代入
	const targetPrice = document.getElementById("price" + id);
	inputPrice.setAttribute("value", targetPrice.innerText.substring(1));
	inputPrice.setAttribute("readonly", true);

	// 日付の初期値を今日にする
	settingDate();

	const targetImage = document.getElementById("img" + id);
	const imageUrl = document.createElement("input");
	imageUrl.setAttribute("type", "hidden");
	imageUrl.setAttribute("name", "imageUrl");
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

	settingDate();
}

function settingDate() {
	var d = new Date();
	var yyyy = d.getFullYear();
	var mm = ("0" + (d.getMonth() + 1)).slice(-2);
	var dd = ("0" + d.getDate()).slice(-2);
	document.getElementById("inputPurchaseDate").value = yyyy + '-' + mm + '-'
			+ dd;
}