const select = document.getElementById("buttonselect");
const bulb = document.querySelector('bulb')

const light = document.getElementById("light");


//select.addEventListener(click, (event) => {
  //light.classList.add('bulb');
  // Do something (callback)
//});

document.querySelectorAll("bulb").forEach((bulb) => {
  select.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("bulb");
  });
});
