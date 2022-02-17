document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.sort-by-title')
  if (control) {control.addEventListener('click', sortRowByTitle)}
})

function sortRowByTitle() {
  var table = document.querySelector('table')

  //Nodelist
  //https://developer.mozilla.org/ru/docs/Web/API/NodeList
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  var arrowUp = this.querySelector('.octicon-arrow-up')

  // if() {
  //   sortedRows.sort(compareRowsAsc)
  // } else {
  //   sortedRows.sort(compareRowsDesc)
  // }
  console.log(arrowUp)
  
 

  var sortedTable = document.createElement('table')

  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return -1}
  if (testTitle1 > testTitle2) {return 1}
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return 1}
  if (testTitle1 > testTitle2) {return -1}
  return 0
}