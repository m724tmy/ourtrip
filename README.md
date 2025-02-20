# アプリケーション名

**OUR TRIP**

みんなで作る旅のしおり

https://ourtrip.onrender.com/

---

---

## テスト用アカウント

- **Basic 認証 ID**: admin
- **Basic 認証 Pass**: 0000

### ログインユーザーアカウント

- **メールアドレス**: test@test
- **パスワード**: Test000

---

## アプリケーション概要

複数人で旅行の計画を立て、宿泊施設や行きたい場所を整理することができます。  
AI を活用して、旅行先のアイデアやスケジュール案を簡単に生成できる機能も備えています。

---

## アプリケーションを作成した背景

海外旅行の際、行きたい場所が不明確でスケジュールの調整が難しいと感じた経験をきっかけに開発しました。複数のユーザーが共同でプランを立てることで、宿泊施設や行きたい場所を整理しやすくなります。特に、AI などを活用してスケジュールや場所を簡単に管理できるようにしたいと考えました。

また、身近な母親に ChatGPT の存在を尋ねたところ「知らない」と言われ、生成 AI に触れたことがない方が多いことに改めて気づきました。そこで、初心者ユーザーが簡単な設問を入力するだけで、希望する旅行先の提案や旅程の自動生成を行えるプロンプト作成フォームを実装しました。生成 AI 技術を使うことで、技術に不慣れなユーザーにも手軽にサービスを利用してもらえる方法を探求しています。

---

## 利用方法

### 1. サインインまたは新規登録を行います。

[![Image from Gyazo](https://i.gyazo.com/530fe89c0c8f246dc5067362beb09335.png)](https://gyazo.com/530fe89c0c8f246dc5067362beb09335)

- **メールアドレス**: test@test
- **パスワード**: Test000

### 2. 【しおり作成する】で新しい旅行プランを作成します。

[![Image from Gyazo](https://i.gyazo.com/3011115066135cb0200e07cf58e36b0b.png)](https://gyazo.com/3011115066135cb0200e07cf58e36b0b)

[![Image from Gyazo](https://i.gyazo.com/231e4101997a77caa353d2a6aff61819.png)](https://gyazo.com/231e4101997a77caa353d2a6aff61819)

### 3. 行きたい場所の候補を挙げる

メンバー同士でそれぞれ行きたい場所の候補を登録していきます。  
[![Image from Gyazo](https://i.gyazo.com/678074d3feea44ce8eeeed7739db52fb.png)](https://gyazo.com/678074d3feea44ce8eeeed7739db52fb)

#### 3-2. ChatGPT を使って行きたい場所やスケジュールを生成

左側のフォームに希望日時や行きたい場所などを入力し「作成」すると、旅行スケジュールや訪問先の候補を探すための **プロンプト**（AI を動かす指示文）を自動生成します。  
[![Image from Gyazo](https://i.gyazo.com/6bce34edddca0d13b4c12c1742b0c8eb.gif)](https://gyazo.com/6bce34edddca0d13b4c12c1742b0c8eb)

### 4. 行きたい場所を基に旅行プランを調整しながらスケジュール一覧に追加します。

[![Image from Gyazo](https://i.gyazo.com/8acfa2ef1c59f730957bf1ab0328bb5c.gif)](https://gyazo.com/8acfa2ef1c59f730957bf1ab0328bb5c)

※直接スケジュール一覧に追加することも可能です。  
[![Image from Gyazo](https://i.gyazo.com/50fc80c5fa7a7ff17edb3e173fe90da0.gif)](https://gyazo.com/50fc80c5fa7a7ff17edb3e173fe90da0)

---

## 機能一覧

### ユーザー管理機能 (devise)

- 新規登録
- ログイン
- ログアウト

### ルーム（旅行グループ）作成機能

- 複数ユーザーが参加できる「ルーム」を作成し、共同で旅行計画を立てられる
- ルームには名前、説明文、開始日時、終了日時を設定可能
- ユーザーはいつでもルームから退出可能。参加者が 0 人になったルームは自動的に削除される

### スケジュール作成・管理機能

- 各ルーム内で旅行スケジュールを作成・管理
- スケジュールにはタイトル、説明、開始時間、終了時間、予算、参考 URL などを登録可能
- スケジュール一覧は開始時間順に表示

### 行きたい場所管理機能

- 訪れたい場所を候補として登録可能
- 登録した場所をスケジュールに追加し、旅行プランを組み立てる機能
- 一覧は開始時間順に表示

### ChatGPT 機能 & プロンプト生成機能

- OpenAI の API を活用し、視覚的で分かりやすい旅程案を生成
- ユーザーが訪問したい場所や希望条件を入力すると、旅行プランを自動生成するテンプレート（プロンプト）を提供
- 希望日時・訪問場所・移動手段・人数などを指定し、具体的な旅行計画を策定可能

---

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/a7ce1a944933fe4d99fe9331c3d51d4e.png)](https://gyazo.com/a7ce1a944933fe4d99fe9331c3d51d4e)

---

## 開発環境

- **フロントエンド**

  - HTML
  - CSS
  - JavaScript
  - Bootstrap

- **バックエンド**

  - Ruby 3.2.0
  - Ruby on Rails 7.0.0

- **インフラ**

  - Render.com

- **データベース**
  - PostgreSQL

---

## 工夫したポイント

ユーザー視点に立ち、「使いやすくわかりやすい」シンプルな UI を常に意識しました。

### ユーザー体験のシンプルさ

- レイアウトやボタン配置を直感的にし、旅行計画に不慣れな方でもスムーズに利用できるよう配慮しました。

### 共同編集

- 複数人で旅行を計画する際に「行きたい場所」を候補として提案し合い、スケジュールに即座に反映できる設計を重視しました。

### ChatGPT の活用

- プロンプトフォームから生成されたレスポンスを活用し、スケジュールを効率的に作成。
- 生成されたスケジュールはテーブル形式でわかりやすく表示されます。

  [![Image from Gyazo](https://i.gyazo.com/690d323cd703bd4ad6ac26ca0ffcc1b7.png)](https://gyazo.com/690d323cd703bd4ad6ac26ca0ffcc1b7)

---

## 実装予定の機能や処理

- カレンダー表示機能
- 旅行プランの PDF 化
- ユーザー同士のメッセージ機能
- 地図上で場所をピンポイントで選択する機能
- 多機能な検索・フィルター機能

---

## 改善点

- デザインが少し堅い印象のため、よりモダンで直感的な UI に改良したい
- JavaScript をさらに活用して、スケジュール調整・編集をスムーズにし、ユーザー体験を向上させたい

---

## 制作時間

このアプリケーションの制作にはおよそ **130 時間** を要しました。

---
