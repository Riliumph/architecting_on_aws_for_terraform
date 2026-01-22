# TerraformのProviderの設定を記述する。

# AWS Providerの設定
# AWSの認証設定
# AWSのどのリージョンのAPIに接続するか
# などを記述する。
provider "aws" {
  region  = var.primary_region
  profile = "default" # .aws/credentialのdefaultを使用

  # 全リソースに強制的に付与するタグ
  default_tags {
    tags = {
      owner = var.owner_name
    }
  }
}


provider "aws" {
  alias   = "replica"
  region  = var.replica_region
  profile = "default" # .aws/credentialのdefaultを使用

  # 全リソースに強制的に付与するタグ
  default_tags {
    tags = {
      owner = var.owner_name
    }
  }
}

