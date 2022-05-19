
document.addEventListener('turbolinks:load', function() {
  var timerSeconds = document.querySelector('#myTimer');
  if (timerSeconds) {
    var time = timerSeconds.dataset.time;
    setInterval(function () {
      if (time > 0) {
        time -= 1;
      } else {
        alert('Время теста окончено');
        document.querySelector('form').submit();
      }
      result = parseInt(time / 60) + ':' + time % 60;
      timerSeconds.innerHTML = result;
    }, 1000)
  };
});
