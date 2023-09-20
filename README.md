# デモ
https://moneta3-5.onrender.com

# 3.0からの修正点
- htmlを使用（formタグ含めヘルパ使わず）
- ルーティングはベタ書き（ヘルパ使わず）
- モデルにコードを書かない
- フォームオブジェクトを使用しない
- コントローラに処理を全部書く
- コントローラのライフサイクル系、バリデーション系のヘルパを使用しない

# Render.comへのデプロイ
- freeプランでアカウント作成
- New+ボタンからWebServiceを選択
- Repositoryに本リポジトリのurlを設定
- Branchにmainを設定
- Build Commandは以下の通りとする
  |bundle install; bundle exec rake assets:precompile; bundle exec rake assets:clean; bundle exec rails db:migrate:reset;
- EnvironmentタブからSECRET_KEY_BASEを設定
- ManualDeployボタンからDeploy latest commitを選択
