# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "cloud_id"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "folder_id"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "centos-7-base" {
  default = "fd8b9ag5cev7kgmm1adf"
}
variable "grey_ip" {
  type    = string
  default = "192.168.101.5"
}

variable "ubuntu" {
  default = "fd826dalmbcl81eo5nig"
}
