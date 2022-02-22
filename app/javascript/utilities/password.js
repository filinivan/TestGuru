document.addEventListener('turbolinks:load', function(){
  var check = document.querySelector('#user_password_confirmation')
  if (check) {check.addEventListener('input', checkPasswordConfirmation)}
})

function checkPasswordConfirmation() {
  var password = document.getElementById('user_password')
  var confirmation = document.getElementById('user_password_confirmation')

  if (password.value == confirmation.value) {
    password.classList.add('bg-success')
    confirmation.classList.add('bg-success')
    password.classList.remove('bg-danger')
    confirmation.classList.remove('bg-danger')
  } else if (password.value != confirmation.value){
    password.classList.remove('bg-success')
    confirmation.classList.remove('bg-success')
    password.classList.add('bg-danger')
    confirmation.classList.add('bg-danger')
  }
}