document.addEventListener('DOMContentLoaded', function() {
  const logoSpans = document.querySelectorAll('.logo span');
  let delay = 0.1;

  logoSpans.forEach(function(span) {
    span.style.animation = `appear 0.5s ease ${delay}s forwards`;
    delay += 0.1;
  });
});