function item (){
  const itemPrice = document.getElementById('item-price');
  itemPrice.addEventListener('keyup', () => {
    const addPriceArea = document.getElementById('add-tax-price');
    const profitArea = document.getElementById('profit');
    const price = itemPrice.value;
    const addPrice = price * 0.1;
    const profit = price - addPrice;
    addPriceArea.innerHTML = Math.floor(`${addPrice}`);
    profitArea.innerHTML = Math.floor(`${profit}`);
  })
}
window.addEventListener('load', item);