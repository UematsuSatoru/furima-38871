const pay = () => {

  const payjp = Payjp('pk_test_a9fbc092502597a9059c3478')
  const elements = payjp.elements();
  const NumberElement = elements.create('cardNumber');
  const ExpMonthElement = elements.create('cardExpiry');
  const ExpYearElement = elements.create('cardExpiry');
  const CvcElement = elements.create('cardCvc');

  NumberElement.mount('#number-form');
  ExpMonthElement.mount('#exp-month-form');
  ExpYearElement.mount('#exp-year-form');
  CvcElement.mount('#cvc-form');

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    payjp.createToken(NumberElement).then(function(response)  {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);
