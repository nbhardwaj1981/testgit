
terraform {
    backend "azurerm" {
        resource_group_name = "nbrg01"
        storage_account_name = "tfstateblob01"
        container_name = "tfstatecontainer"
        key =  "tf_practice.tfstate"
    }
}