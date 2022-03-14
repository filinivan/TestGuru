document.addEventListener('turbolinks:load', function(){
  var elem = document.getElementById("myBar")
  var i =  elem.dataset.progress_percent

  var width = i
  elem.style.width = width
    
})