document.addEventListener('turbolinks:load', function(){
  var controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineClickHandler)
    }
  }
})

function formInlineClickHandler(event) {
  event.preventDefault()
  console.log('Handle from inline links')
}