output "s3_bucket_names" {
  description = "Имена созданных S3 бакетов"
  value       = module.object_storage.bucket_names
}

output "container_registry_id" {
  description = "ID Container Registry"
  value       = module.container_registry.registry_id
}

output "kubeconfig" {
  description = "Kubeconfig для доступа к кластеру"
  value       = module.kubernetes.kubeconfig
  sensitive   = true
}

output "dns_zone_id" {
  description = "ID DNS зоны"
  value       = module.dns.dns_zone_id
}

output "app_service_account_id" {
  description = "ID Service Account приложения"
  value       = module.iam.app_service_account_id
}

output "s3_access_keys" {
  description = "Ключи доступа к S3"
  value       = module.iam.s3_access_keys
  sensitive   = true
}