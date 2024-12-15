// adjustHeight 関数: テキストエリアの高さを自動調整
const adjustHeight = (element) => {
  if (!element) return;
  element.style.height = 'auto';
  element.style.height = `${element.scrollHeight}px`;
};

// 共通プロンプト生成関数
const generatePrompt = (type) => {
  const formPrefix = type === 'schedule' ? 'schedule' : 'places';

  const getValue = (id) => document.getElementById(id)?.value.trim() || '';
  const getCheckedValues = (selector) =>
    Array.from(document.querySelectorAll(selector))
      .filter((el) => el.checked)
      .map((el) => el.value);

  const start_date = getValue(`${formPrefix}-start-date`);
  const end_date = getValue(`${formPrefix}-end-date`);
  const checkboxTransport = getCheckedValues(
    `#${formPrefix}-form input[type=checkbox]:checked`
  );
  const otherTransport = getValue(`${formPrefix}-transportation-other`);
  if (otherTransport) checkboxTransport.push(otherTransport);

  const transport = checkboxTransport.join(', ');
  const requests = getValue(`${formPrefix}-requests`);
  const people =
    document.querySelector(
      `#${formPrefix}-form input[name=${formPrefix}-people]:checked`
    )?.value || getValue(`${formPrefix}-people-other`);
  const scheduleLocations = getValue('locations-data');
  const findLocations = getValue('find-places-location');

  let prompt;
  if (type === 'schedule') {
    prompt = `旅行計画を作成しています。以下の情報を基に旅行プランのスケジュール作成をしてください。\n
    【テーブルカラム】\n・時間:各アクティビティの開始時間\n・場所: 訪れる場所や観光地\n・移動方法:各地点間の移動手段\n・詳細:アクティビティ内容やその場所についての簡単な説明\n
    【必要情報】\n・行きたい場所・エリア:\n${scheduleLocations}\n・日にち: ${start_date}~${end_date}\n・移動手段: ${transport}\n・人数: ${people}\n・その他希望リクエスト: ${requests}`;
  } else {
    const budget = getValue('places-budget');
    prompt = `旅行計画を作成しています。以下の情報を基におすすめスポットを提案してください。\n
    【テーブルカラム】\n・場所:おすすめの観光地やスポット名\n・移動方法:各スポットまでの移動手段\n・詳細:各スポットの特徴や簡単な説明\n・掛かる費用（目安）:各スポットでの概算費用（入場料や交通費など）\n
    【必要情報】\n・行きたい場所・エリア:\n${findLocations}\n・日にち: ${start_date}~${end_date}\n・移動手段: ${transport}\n・人数: ${people}\n予算: ${budget}\n・その他希望リクエスト: ${requests}`;
  }

  const chatTextarea = document.querySelector('#chat-form textarea');
  if (chatTextarea) {
    chatTextarea.value = prompt;
    adjustHeight(chatTextarea);
  }
};

// Turbo.jsによるページ読み込み後の処理
document.addEventListener('turbo:load', () => {
  // スケジュール生成ボタン
  document
    .getElementById('generate-schedule')
    ?.addEventListener('click', () => generatePrompt('schedule'));

  // おすすめ場所生成ボタン
  document
    .getElementById('generate-places')
    ?.addEventListener('click', () => generatePrompt('places'));

  // テキストエリアの自動高さ調整
  document.querySelectorAll('.text_height').forEach((textarea) => {
    textarea.addEventListener('input', () => adjustHeight(textarea));
    adjustHeight(textarea); // 初期化時の高さ調整
  });
});
