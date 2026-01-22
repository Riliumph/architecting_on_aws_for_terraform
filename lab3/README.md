# lab2

## インフラの作成

`env`配下の環境まで移動すること。

### terraform初期化

```console
$ envsubst < backend.template > backend.hcl
$ terraform init -backend-config=backend.hcl
Terraform has been successfully initialized!
```

### terraform dryrun

```console
$ terraform plan
```

### デプロイ

```console
$ terraform apply -auto-approve
```

### リソースの削除

```console
$ terraform destroy
```
