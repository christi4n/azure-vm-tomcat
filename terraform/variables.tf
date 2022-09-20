variable "tf_backend_resource_group_name" {
  default     = "rg-terraform-state-cb002"
  description = "Location of the resource group for Terraform backend state"
}

variable "tf_backend_storage_account_name" {
  default     = "tfstate5686"
  description = "Storage accont name inside the dedicated RG for Terraform"
}

variable "resource_group_location" {
  default     = "francecentral"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}