resource "azurerm_resource_group" "this" {
    name = format("rg-%s",var.resource_group_name)
    location = var.location
    tags = var.tags
}

resource "azurerm_storage_account" "example" {
    name = var.storage_account_name
    resource_group_name = azurerm_resource_group.this.name
    location = azurerm_resource_group.this.location
    account_tier = var.account_tier
    account_replication_type = var.account_replication_type
}

data "azurerm_client_config" "current" {

}

resource "azurerm_key_vault" "kv" {
  name                        = format("kv-%s-999",var.resource_group_name)
  location                    = var.location
  resource_group_name         = azurerm_resource_group.this.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

module "apps" {
    source = "./modules/apps"
    resource_group_name = var.resource_group_name
    location = var.location
}

module "loganaly" {
    source = "./modules/loganaly"
    resource_group_name = var.resource_group_name
   location = var.location
}

module "network" {
    source = "./modules/network"
    resource_group_name = var.resource_group_name
   location = var.location
   address_space  = ["10.0.0.0/16"]
   tags = var.tags
}