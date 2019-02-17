document.addEventListener('turbolinks:load', function() {
  var progress = document.getElementById('progress');
  if (progress) {
    percent = progress.dataset.progressPercent
    progress.style.width = percent.toString() + "%";
  }
})
