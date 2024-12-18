provider "oci" {
  config_file_profile = "DEFAULT"
}

# Obter o namespace do Object Storage
data "oci_objectstorage_namespace" "namespace" {}

# Criar um Bucket no Object Storage
resource "oci_objectstorage_bucket" "example_bucket" {
  compartment_id = var.compartment_ocid
  name           = "exemplo-python-bucket"
  namespace      = data.oci_objectstorage_namespace.namespace.namespace
  storage_tier   = "Standard"
}

# Criar um MySQL Database
resource "oci_mysql_mysql_db_system" "example_db" {
  compartment_id = var.compartment_ocid
  availability_domain = var.availability_domain
  shape_name          = "MySQL.Free"
  configuration_id    = var.mysql_configuration_id

  admin_username = "admin"
  admin_password = var.db_admin_password

  subnet_id      = var.subnet_ocid
  hostname_label = "example-mysql"
  display_name   = "example-mysql-db"
  data_storage_size_in_gb = 50
}

# Criar um Bastion para SSH
resource "oci_bastion_bastion" "example_bastion" {
  compartment_id = var.compartment_ocid
  target_subnet_id = var.subnet_ocid
  bastion_type = "STANDARD"
  name = "example-bastion"
}

# Outputs
output "bucket_name" {
  value = oci_objectstorage_bucket.example_bucket.name
}

output "db_endpoints" {
  value = oci_mysql_mysql_db_system.example_db.endpoints
}

output "bastion_ocid" {
  value = oci_bastion_bastion.example_bastion.id
}
