const pay = () => {
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("購入ボタンを押した際にイベント発火")
  });
};

window.addEventListener("load", pay);