document.addEventListener('turbolinks:load', function() {
    var my_timer = document.getElementById("my_timer");
    if (my_timer) {
      time_limit = my_timer.dataset.timeLimit
      if (time_limit > 0) startTimer(time_limit);
    };

    function startTimer(time) {
    var h = Math.floor(time / 60 / 60);
    var m = Math.floor(time / 60 - h * 60);
    var s = time % 60;
    if (time <= 0) {
      alert("Время вышло");
      window.location.replace(window.location + '/result')
      return;
    }
    if (m < 10) m = "0" + m;
    if (h < 10) h = "0" + h;
    if (s < 10) s = "0" + s;
    if (time > 0) time--;
    var my_timer = document.getElementById("my_timer");
    if (my_timer && time > 0) {
      my_timer.innerHTML = h+":"+m+":"+s;
      setTimeout(startTimer, 1000, time);
    }
  }
})
