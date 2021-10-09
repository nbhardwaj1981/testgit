resource "azurerm_resource_group" "name" {
    name = local.rg_name
    location = var.location
}

resource "azurerm_application_insights" "ins" {
count = 3
name = format("%s-ins-%s", local.rg_name, count.index)
location = var.location
resource_group_name = azurerm_resource_group.name.name
application_type    = "web"
}

locals {
    rg_name = format("rg-%s", var.resource_group_name)
    }

