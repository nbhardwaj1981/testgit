resource "azurerm_virtual_network" "vnet" {
  name                = format("vnet1-%s-999",var.resource_group_name)
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space #["10.0.0.0/16"]
  
    subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

dynamic "subnet" {
    for_each = var.subnets
    content {
        name = subnet.value.name
        address_prefix = subnet.value.address_prefix
    }
}
  

   tags = var.tags
    
}