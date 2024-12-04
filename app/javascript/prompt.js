document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('travel-plan-form');
  const generateButton = document.getElementById('generate-prompt');
  const generatedPrompt = document.getElementById('generated-prompt');

  generateButton.addEventListener('click', () => {
    // 行き先
    const destinations = document
      .getElementById('destinations')
      .value.split(',')
      .map((dest) => dest.trim())
      .filter((dest) => dest)
      .join('\n・');

    // 1. 旅行の目的
    const purposes = Array.from(
      form.querySelectorAll('input[name="purpose"]:checked')
    )
      .map((input) => input.value)
      .join(', ');
    const otherPurpose = document.getElementById('other-purpose').value.trim();
    const purposeText = otherPurpose
      ? `${purposes}, ${otherPurpose}`
      : purposes;

    // 2. 旅行の期間
    const startDate = document.getElementById('start-date').value;
    const endDate = document.getElementById('end-date').value;

    // 3. ご同行者
    const companions = document.getElementById('companions').value.trim();

    // 4. 予算
    const budget = document.getElementById('budget').value.trim();

    // 5. 旅行のスタイル
    const styleElements = form.querySelectorAll('input[name="style"]:checked');
    const styles = Array.from(styleElements).map((input) => input.value);
    const otherStyle = document.getElementById('other-style').value.trim();
    const styleText = otherStyle
      ? [...styles, otherStyle].join(', ')
      : styles.join(', ');

    // 6. 交通手段
    const transportation = document
      .getElementById('transportation')
      .value.trim();

    // 7. 特別なリクエスト
    const specialRequests = document
      .getElementById('special-requests')
      .value.trim();

    // プロンプト生成
    const prompt = `
旅行プランを立てています。
行きたい場所:
${destinations || '未記入'}
目的: ${purposeText || '未選択'}
期間: ${startDate || '未設定'} ～ ${endDate || '未設定'}
同行者: ${companions || '未記入'}
予算: ${budget || '未記入'}
スタイル: ${styleText || '未選択'}
交通手段: ${transportation || '未記入'}
特別なリクエスト: ${specialRequests || '未記入'}

この情報を基に、最適な旅行プランをテーブル表記で作成してください。
    `.trim();

    // テキストエリアに表示
    generatedPrompt.value = prompt;
  });
});
