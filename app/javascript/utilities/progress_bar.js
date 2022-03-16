document.addEventListener('turbolinks:load', function(){
  var elem = document.getElementById("myBar")
  
  if (elem) {
    elem.style.width = elem.dataset.percent + '%'
  }
})

