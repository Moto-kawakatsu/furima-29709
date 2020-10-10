function price(){
    const priceInput = document.getElementById("item-price");
    const add_tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    priceInput.addEventListener('keyup', () => {
      const value = priceInput.value;
      
      let fee = 0;
      let gains = 0; 

      if (value >= 300 && value <= 9999999){
        fee = value * 0.1
        gains = value - fee
      } else {
        fee = '-';
        gains = '-';
      }

      add_tax.textContent = fee;
      profit.textContent = gains;
       
    });
    
}
window.addEventListener('load', price);
    