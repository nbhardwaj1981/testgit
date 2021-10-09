terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = ">= 2.26"
                }
    }
}

# remote provider
provider "azurerm" {
    features {}
}
