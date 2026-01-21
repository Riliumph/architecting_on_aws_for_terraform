# architecting_on_aws_for_terraform

terraformを用いたAWSのサンプル

## awsのアクセスキーについて

【IAM】-【ユーザー】からユーザー一覧を表示する。  
ユーザー一覧から任意のユーザーを選択する。  
【セキュリティ認証情報】タブから【アクセスキーを作成】を選択する。

> 企業の場合`AWS IAM Identify Center（旧SSO）`を使うべきである

## アクセスキーの仮想環境への共有について

アクセスキーはゲスト専用ではなく、ホストの設定を共有する。  
ホストの`${USER}/.aws`とゲストの`${USER}/.aws`に共有が張られている。

> `.devcontainer/docker-compose.yml`にて共有ボリュームの設定を行っている。

## 権限を付与する

AWSにterraformの実行を許可するユーザーグループを作成する必要がある。  
`terraformers`を実行すること。
