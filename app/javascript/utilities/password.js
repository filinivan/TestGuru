document.addEventListener('turbolinks:load', function(){
  var check = document.querySelector('.confirmation-checka')
  if (check) {check.addEventListener('input', checkPasswordConfirmation)}
})

function checkPasswordConfirmation() {
  console.log('Обработка сравнения запущена')
  var password = document.getElementById("input[id=user_password")
  var confirmation = document.querySelector("input[id=user_password_confirmation]")

  console.log(password)
  console.log(password.textContent)
  // if  (password <> confirmation) {
  //   password.classList.add('danger')
  // }

}


// document.addEventListener('turbolinks:load', function(){
//   var control = document.querySelector('.sort-by-title')
//   if (control) {control.addEventListener('click', sortRowByTitle)}
// })


// function sortRowByTitle() {
//   var table = document.querySelector('table')

//   //Nodelist
//   //https://developer.mozilla.org/ru/docs/Web/API/NodeList
//   var rows = table.querySelectorAll('tr')
//   var sortedRows = []

//   for (var i = 1; i < rows.length; i++) {
//     sortedRows.push(rows[i])
//   }

//   //var arrowUp = this.querySelector('.octicon-arrow-up')

//   if(this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
//     sortedRows.sort(compareRowsAsc)
//     this.querySelector('.octicon-arrow-up').classList.remove('hide')
//     this.querySelector('.octicon-arrow-down').classList.add('hide')
//   } else {
//     sortedRows.sort(compareRowsDesc)
//     this.querySelector('.octicon-arrow-up').classList.add('hide')
//     this.querySelector('.octicon-arrow-down').classList.remove('hide')
//   }
  
//   var sortedTable = document.createElement('table')

//   sortedTable.classList.add('table')
//   sortedTable.classList.add('table-striped')
//   sortedTable.appendChild(rows[0]) // Добавление строки с заголовком

//   for (var i = 0; i < sortedRows.length; i++) {
//     sortedTable.appendChild(sortedRows[i])
//   }

//   table.parentNode.replaceChild(sortedTable, table) //Заменяем таблицу на отсортированную. Физическая вставка
// }

// function compareRowsAsc(row1, row2) {
//   var testTitle1 = row1.querySelector('td').textContent
//   var testTitle2 = row2.querySelector('td').textContent

//   if (testTitle1 < testTitle2) {return -1}
//   if (testTitle1 > testTitle2) {return 1}
//   return 0
// }

// function compareRowsDesc(row1, row2) {
//   var testTitle1 = row1.querySelector('td').textContent
//   var testTitle2 = row2.querySelector('td').textContent

//   if (testTitle1 < testTitle2) {return 1}
//   if (testTitle1 > testTitle2) {return -1}
//   return 0
// }