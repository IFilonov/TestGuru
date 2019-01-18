document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.check_password_field')

  if (control) {
    control.addEventListener('keyup', checkPasswordsEquals)
  }
})

function checkPasswordsEquals() {
  var password = document.getElementById('user_password')
  var password_confirmation = document.getElementById('user_password_confirmation')

  if( password.value.length == 0 || password_confirmation.value.length == 0)
  {
    this.querySelector('.octicon-alert').classList.add('hide')
    this.querySelector('.octicon-thumbsup').classList.add('hide')
  }
  else if ( password.value != password_confirmation.value)
  {
    this.querySelector('.octicon-alert').classList.remove('hide')
    this.querySelector('.octicon-alert').classList.add('red')
    this.querySelector('.octicon-thumbsup').classList.add('hide')
  }
  else {
    this.querySelector('.octicon-alert').classList.add('hide')
    this.querySelector('.octicon-thumbsup').classList.remove('hide')
  }
}
