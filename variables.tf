variable "yc_folder_id" {
  description = "ID папки в Яндекс.Облаке"
  type        = string
  sensitive   = true
}

variable "yc_cloud_id" {
  description = "ID облака в Яндекс.Облаке"
  type        = string
  sensitive   = true
}

variable "yc_token" {
  description = "OAuth-токен или IAM-токен для Яндекс.Облака"
  type        = string
  sensitive   = true
}

# DNS переменные
variable "domain_name" {
  description = "Доменное имя для приложения"
  type        = string
  default     = "example.com"
}

variable "subdomain" {
  description = "Субдомен для приложения"
  type        = string
  default     = "app"
}

variable "s3_access_key" {
  description = "Yandex Cloud S3 access key"
  type        = string
  sensitive   = true
}

variable "s3_secret_key" {
  description = "Yandex Cloud S3 secret key"
  type        = string
  sensitive   = true
}