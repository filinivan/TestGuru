document.addEventListener('turbolinks:load', function(){
  var elem = document.getElementById("myBar")
  var i =  elem.dataset.percent

  var width = i
  elem.style.width = "#{i}%"
  console.log(elem.style.width = "#{i}%")
})