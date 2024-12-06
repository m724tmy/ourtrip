// adjustHeight 関数をグローバルスコープに定義
const adjustHeight = (element) => {
  element.style.height = 'auto';
  element.style.height = `${element.scrollHeight}px`;
};

document.getElementById('generate-schedule').addEventListener('click', () => {
  const date = document.getElementById('schedule-date').value;
  const transport = Array.from(
    document.querySelectorAll('#schedule-form input[type=checkbox]:checked')
  )
    .map((cb) => cb.value)
    .join(', ');
  const requests = document.getElementById('schedule-requests').value;
  const people =
    document.querySelector('#schedule-form input[name=schedule-people]:checked')
      ?.value || document.getElementById('schedule-people-other').value;
  const locations = document.getElementById('locations-data').value.trim();

  const prompt = `旅行計画を作成しています。以下の情報を基に旅行プランのスケジュール作成をしてください。作成するスケジュールは見やすいようにテーブル形式でお願いします。\n
  【テーブルカラム】\n・時間:各アクティビティの開始時間\n・場所: 訪れる場所や観光地\n・移動方法:各地点間の移動手段\n・詳細:アクティビティ内容やその場所についての簡単な説明\n
  【必要情報】\n・行きたい場所・エリア:\n${locations}\n・日にち: ${date}\n・移動手段: ${transport}\n・人数: ${people}\n・その他希望リクエスト: ${requests}`;

  const chatTextarea = document.querySelector('#chat-form textarea');
  if (chatTextarea) {
    chatTextarea.value = prompt;

    // 高さを調整
    adjustHeight(chatTextarea);
  }
});

document.getElementById('generate-places').addEventListener('click', () => {
  const date = document.getElementById('places-date').value;
  const budget = document.getElementById('places-budget').value;
  const transport = Array.from(
    document.querySelectorAll('#find-places-form input[type=checkbox]:checked')
  )
    .map((cb) => cb.value)
    .join(', ');
  const requests = document.getElementById('places-requests').value;
  const people =
    document.querySelector(
      '#find-places-form input[name=location-people]:checked'
    )?.value || document.getElementById('location-people-other').value;
  const locations = document.getElementById('places-location').value.trim();

  const prompt = `旅行計画を作成しています。以下の情報を基に行きたい場所。わたしにぴったりの近くのおすすめスポットを教えてください。提案するスポットは見やすいようにテーブル形式でお願いします。\n
  【テーブルカラム】\n・場所:おすすめの観光地やスポット名\n・移動方法:各スポットまでの移動手段\n・詳細:各スポットの特徴や簡単な説明\n・掛かる費用（目安）:各スポットでの概算費用（入場料や交通費など）\n
  【必要情報】\n・行きたい場所・エリア:\n${locations}\n・日にち: ${date}\n・移動手段: ${transport}\n・人数: ${people}\n予算: ${budget}\n・その他希望リクエスト: ${requests}`;

  const chatTextarea = document.querySelector('#chat-form textarea');
  if (chatTextarea) {
    chatTextarea.value = prompt;

    // 高さを調整
    adjustHeight(chatTextarea);
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const textarea = document.getElementById('autoResize');

  if (textarea) {
    textarea.addEventListener('input', () => adjustHeight(textarea));
    // 初期表示時にも高さを調整
    adjustHeight(textarea);
  }
});
