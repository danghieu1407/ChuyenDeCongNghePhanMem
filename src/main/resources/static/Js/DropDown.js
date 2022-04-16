document.querySelectorAll('.dropdown-toggle').forEach(item => {
  item.addEventListener('click', event => {
 
    if(event.target.classList.contains('dropdown-toggle') ){
      event.target.classList.toggle('toggle-change');
    }
    else if(event.target.parentElement.classList.contains('dropdown-toggle')){
      event.target.parentElement.classList.toggle('toggle-change');
    }
  })
});

    
    /* Preloader after 3second adding none class and removing preloader*/
setTimeout(function(){ 
  document.getElementById("loading").classList.add("none");
}, 3000);
