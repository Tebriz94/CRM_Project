resource "azurerm_public_ip" "this" {
  name                = "${var.bastion_env}-bastion-publicip"
  location            = var.bastion_location
  resource_group_name = var.bastion_resource_group_name
  allocation_method   = var.bastion_allocation_method            #"Static"
  sku                 = var.bastion_sku                          #"Standard"
}

resource "azurerm_bastion_host" "this" {
  name                = "${var.bastion_env}-bastion"
  location            = var.bastion_location
  resource_group_name = var.bastion_resource_group_name

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = azurerm_public_ip.this.id
  }
}
