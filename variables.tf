variable "compartment_ocid" {
  description = "OCID do compartimento onde os recursos serão criados"
}

variable "availability_domain" {
  description = "Domínio de disponibilidade"
}

variable "mysql_configuration_id" {
  description = "ID da configuração do MySQL"
}

variable "db_admin_password" {
  description = "Senha do administrador do MySQL"
  sensitive = true
}

variable "subnet_ocid" {
  description = "OCID da subnet onde os recursos serão criados"
}
