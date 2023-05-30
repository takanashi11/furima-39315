function calculateTaxPrice(price) {
  const tax = 0.1; 
  const taxPrice = Math.floor(price * tax);
  return taxPrice;
}

function calculateProfit(price) {
  const taxPrice = calculateTaxPrice(price);
  const profit = price - taxPrice; 
  return profit;

}
function updateTaxPrice() {
  const priceInput = document.getElementById('item-price');
  const addTaxDom = document.getElementById('add-tax-price');
  const profitDom = document.getElementById('profit');

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxPrice = calculateTaxPrice(inputValue);
    const profit = calculateProfit(inputValue);
    addTaxDom.innerHTML = `${taxPrice}`;
    profitDom.innerHTML = `${profit}`;
  });
}

window.addEventListener('load', updateTaxPrice);