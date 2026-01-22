# `terraform`は実行パスの`.tf`ファイルのみを認識する。
# 勝手にディレクトリを辿ったりはしない。
# そのため、この`main.tf`にはモジュールの呼び出しコードを書く。

module "network" {
  source = "./network"

  pj       = var.pj
  region   = var.region
  vpc_cidr = var.vpc_cidr
  subnet   = var.subnet
}

module "app" {
  source = "./app"

  pj     = var.pj
  region = var.region
  vpc_id = module.network.vpc_id
  subnet = module.network.private_subnet_ids

}

module "bastion" {
  source = "./bastion"

  pj = var.pj
  # bastion配置NWの設定
  region = var.region
  vpc_id = module.network.vpc_id
  subnet = module.network.public_subnet_ids
  # 接続先の設定
  allowed_sg_id = module.app.allowed_sg_id
}
