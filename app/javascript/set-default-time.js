document.addEventListener('turbo:load', () => {
  document.querySelectorAll('.time-input').forEach((input) => {
    input.value = '00:00';
  });
});
