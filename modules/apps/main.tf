resource "azurerm_application_insights" "appins" {
  name                = format("appins-%s-999",var.resource_group_name)
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}