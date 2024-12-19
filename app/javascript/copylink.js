document.getElementById('copy-link').addEventListener('click', function () {
  const link = this.getAttribute('data-link');
  navigator.clipboard.writeText(link).then(() => {
    alert('招待リンクをコピーしました！');
  });
});
