function calc(){
  
  let price = document.getElementById("item-price")
  let priceFee = document.getElementById("add-tax-price")
  let profit = document.getElementById("profit")

  price.addEventListener('keyup', function(){
    fee = Math.floor( price.value / 10 )
    gains = Math.floor( price.value - fee )
    priceFee.innerHTML = fee.toLocaleString('ja-JP')
    profit.innerHTML = gains.toLocaleString('ja-JP')

  });

}

window.addEventListener('load', calc)