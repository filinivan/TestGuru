document.addEventListener('turbolinks:load', function(){
  var elem = document.getElementById("myBar")
  
  if (elem) {
    var i =  elem.dataset.percent
    var width = i
    elem.style.width = i + '%'
  }
})

