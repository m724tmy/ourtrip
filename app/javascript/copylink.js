document.addEventListener('click', function (event) {
  const target = event.target;
  if (target && target.id === 'copy-link') {
    const link = target.getAttribute('data-link');
    navigator.clipboard.writeText(link).then(() => {
      alert('招待リンクをコピーしました！');
    });
  }
});
