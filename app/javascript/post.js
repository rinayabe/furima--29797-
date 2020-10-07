function post (){
  const articleText  = document.getElementById("item-price");
  articleText.addEventListener("keyup", () => {
    const countVal = articleText.value * 0.1;
    const charNum  = document.getElementById("add-tax-price");
    charNum.innerHTML = `${countVal}`;
    
  });
}
window.addEventListener('load', post);

