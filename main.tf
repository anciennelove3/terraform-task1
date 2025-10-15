module "iam" {
  source = "./modules/iam"
  
  project_name = var.project_name
  folder_id    = var.yc_folder_id
}

# Создаем сетевую инфраструктуру
module "network" {
  source = "./modules/network"
  
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  folder_id    = var.yc_folder_id
}

# Создаем S3-совместимые бакеты в Yandex Object Storage
module "object_storage" {
  source = "./modules/object_storage"
  
  project_name    = var.project_name
  bucket_configs  = var.bucket_configs
  common_tags     = var.common_tags
  folder_id       = var.yc_folder_id
}

# Создаем Container Registry
module "container_registry" {
  source = "./modules/container_registry"
  
  project_name    = var.project_name
  common_tags     = var.common_tags
  folder_id       = var.yc_folder_id
}

# Создаем Managed Kubernetes кластер
module "kubernetes" {
  source = "./modules/kubernetes"
  
  project_name          = var.project_name
  vpc_id                = module.network.vpc_id
  subnet_ids            = module.network.subnet_ids
  k8s_service_account_id = module.iam.k8s_service_account_id
  node_count            = var.k8s_node_count
  node_type             = var.k8s_node_type
  common_tags           = var.common_tags
  folder_id             = var.yc_folder_id
}

# Создаем DNS записи
module "dns" {
  source = "./modules/dns"
  
  project_name      = var.project_name
  domain_name       = var.domain_name
  subdomain         = var.subdomain
  load_balancer_ip  = module.kubernetes.load_balancer_ip
  folder_id         = var.yc_folder_id
}