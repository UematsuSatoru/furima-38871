window.onload = function() {
 // 入力された金額を取得する
const priceInput = document.getElementById("item-price");
// 販売手数料を表示する場所を取得する
const addTaxDom = document.getElementById("add-tax-price");
// 販売利益を表示する場所を取得する
const profitDom = document.getElementById("profit");
// 入力された金額に変化があったらイベントを発火させる
priceInput.addEventListener("input", () => {
  // 入力された金額を数値に変換する
  const inputValue = Number(priceInput.value);
  // 販売手数料を計算する（例：10%とする）
  const addTaxPrice = Math.floor(inputValue * 0.1);
   // 販売利益を計算する（価格から販売手数料を引く）
   const profit = inputValue - addTaxPrice;
  // 販売手数料を表示する場所に計算結果を代入する
  addTaxDom.innerHTML = addTaxPrice;
  // 販売利益を表示する場所に計算結果を代入する
  profitDom.innerHTML = profit;
});

};
