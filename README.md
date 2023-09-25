# デモ
https://moneta3-5.onrender.com

# 改修の目的
- 初学者を想定し期間が短いことから、バッドプラクティスであってもコードの追いやすさ、理解しやすさを重視

# 3.0からの修正点
- ネーミングは日本語読みのヘボン式ローマ字とする。ただし外来語として定着しているもの（ユーザなど）は英単語の利用を可とする
- htmlを使用（slim使わず、formタグ含めヘルパ使わず）
- パーシャルによる画面や部品の共通化を使用しない
- CSSファイルによるデザインの共通化は行わない。tailwind cssの標準項目のみ使用し、タグに直接記載する。
- ルーティングはベタ書き（resource等、ヘルパ使わず）
- モデルにコードを書かない
- フォームオブジェクトを使用しない
- コントローラに処理を全部書く
- コントローラのライフサイクル系、バリデーション系のヘルパを使用しない
- フロント処理のjavascriptは利用しない

# Render.comへのデプロイ
- freeプランでアカウント作成
- New+ボタンからWebServiceを選択
- Repositoryに本リポジトリのurlを設定
- Branchにmainを設定
- Build Commandは以下の通りとする
  |bundle install; bundle exec rake assets:precompile; bundle exec rake assets:clean; bundle exec rails db:migrate:reset;
- EnvironmentタブからSECRET_KEY_BASEを設定
- ManualDeployボタンからDeploy latest commitを選択

# デザイン
tailwind cssを利用

https://tailwindcomponents.com/cheatsheet/