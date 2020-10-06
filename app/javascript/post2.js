function post (){
  const articleText  = document.getElementById("item-price");
  articleText.addEventListener("keyup", () => {
    const countVal = articleText.value - (articleText.value * 0.1);
    const charNum  = document.getElementById("profit");
    charNum.innerHTML = `${countVal}`;
    
  });
}
window.addEventListener('load', post);