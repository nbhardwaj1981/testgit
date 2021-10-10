variable "location"{
    type = string
    #default = "eastus"
}
variable "resource_group_name" {
    type = string
    description = "name of resource group"
    #default = "demo99"
    }

variable "storage_account_name" {
    type = string
}

variable "account_tier" {
    type = string
}

variable "account_replication_type"{
    type = string
}

variable "tags" {

}