function bindRegisterData(data) {
	const id = data.substring(0, 1);
	const action = data.substring(1);
	// 登録内容の反映
	const targetTitle = document.getElementById("title" + id);
	if(action == "detail") {
		const detailTitle = document.getElementById("detailTitle");
		detailTitle.innerText = "タイトル　：" + targetTitle.innerText;
	} else if(action == "update") {
		const inputTitle = document.getElementById("inputTitle");
		inputTitle.setAttribute("value", targetTitle.innerText);
	}

	const targetAuthor = document.getElementById("author" + id);
	if(action == "detail") {
		const detailAuthor = document.getElementById("detailAuthor");
		detailAuthor.innerText = "著者　　　：" +  targetAuthor.innerText;
	} else if(action == "update") {
		const inputAuthor = document.getElementById("inputAuthor");
		inputAuthor.setAttribute("value", targetAuthor.innerText);
	}

	const targetPublisher = document.getElementById("publisher" + id);
	if(action == "detail") {
		const detailPublisher = document.getElementById("detailPublisher");
		detailPublisher.innerText = "出版社　　：" + targetPublisher.innerText;
	} else if(action == "update") {
		const inputPublisher = document.getElementById("inputPublisher");
		inputPublisher.setAttribute("value", targetPublisher.innerText);
	}

	const targetPrice = document.getElementById("price" + id);
	if(action == "detail") {
		const detailPrice = document.getElementById("detailPrice");
		detailPrice.innerText = "値段　　　：" + targetPrice.innerText;
	} else if(action == "update") {
		const inputPrice = document.getElementById("inputPrice");
		inputPrice.setAttribute("value", targetPrice.innerText);
	}

	const targetComment = document.getElementById("comment" + id);
	if(action == "detail") {
		const detailComment = document.getElementById("detailPrice");
		detailComment.innerText = "コメント　：" + targetComment.innerText;
	} else if(action == "update") {
		const inputComment = document.getElementById("inputComment");
		inputComment.setAttribute("value", targetComment.innerText);
	}

	const targetEvaluation = document.getElementById("evaluation" + id);
	if(action == "detail") {
		const detailEvaluation = document.getElementById("detailEvaluation");
		detailEvaluation.innerText = "評価　　　：" + targetEvaluation.innerText;
	} else if(action == "update") {
		const inputEvaluation = document.getElementById("inputEvaluation");
		inputEvaluation.setAttribute("value", targetEvaluation.innerText);
	}

	const targetState = document.getElementById("state" + id);
	if(action == "detail") {
		const detailState = document.getElementById("detailState");
		detailState.innerText = "状態　　　：" + targetState.innerText;
	} else if(action == "update") {
		const inputState = document.getElementById("inputState");
		inputState.setAttribute("value", targetState.innerText);
	}

	const targetPurchaseStore = document.getElementById("purchaseStore" + id);
	if(action == "detail") {
		const detailPurchaseStore = document.getElementById("detailPurchaseStore");
		detailPurchaseStore.innerText = "購入店舗名：" + targetPurchaseStore.innerText;
	} else if(action == "update") {
		const inputPurchaseStore = document.getElementById("inputPurchaseStore");
		inputPurchaseStore.setAttribute("value", targetTitle.innerText);
	}

	const targetPurchaseDate = document.getElementById("purchaseDate" + id);
	if(action == "detail") {
		const detailPurchaseDate = document.getElementById("detailPurchaseDate");
		detailPurchaseDate.innerText = "購入日" + targetPurchaseDate.innerText;
	} else if(action == "update") {
		const inputPurchaseDate = document.getElementById("inputPurchaseDate");
		inputPurchaseDate.setAttribute("value", targetPurchaseDate.innerText);
	}

	if(action == "detail") {

	} else if(action == "update") {
		document.getElementById("inputComment").focus()
	}
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