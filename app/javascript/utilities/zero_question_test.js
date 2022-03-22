document.addEventListener('turbolinks:load', function(){

  var table = document.querySelector('.test-list')
  if (table) {
    var rows = table.querySelectorAll('tr')

    for (var i = 1; i < rows.length; i++) {
      x = rows[i].querySelector('.questions-quantity').innerText
      if (x) == 0 {
          rows[i].querySelector('.start-test').disabled = true
      }
    }
  }
}
