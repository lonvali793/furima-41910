
const price = () => {

  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price")
  const itemprofit = document.getElementById("profit")

  

  priceInput.addEventListener("input", () => {
    const inputValue = Number(priceInput.value);
    const addTaxDom = Math.floor(inputValue * 0.1)
    taxPrice.innerHTML =  addTaxDom
    const addProfit = inputValue - addTaxDom
    itemprofit.innerHTML = addProfit

    })

};

document.addEventListener("turbo:load", price);
document.addEventListener("turbo:render", price);