document.addEventListener('turbolinks:load', function(){
  var elem = document.getElementById("myTimer")

  if (elem) {
    elem.innerHTML = elem.dataset.time;
    // elem.style.width = elem.dataset.percent + '%'
  }
})
