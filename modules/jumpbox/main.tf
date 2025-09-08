resource "azurerm_network_interface" "this" {
  name                = "${var.jumpbox_env}-jumpbox-nic"
  location            = var.jumpbox_location
  resource_group_name = var.jumpbox_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                = "${var.jumpbox_env}-jumpbox"
  location            = var.jumpbox_location
  resource_group_name = var.jumpbox_resource_group_name
  size                = var.jumpbox_vm_size

  admin_username      = var.jumpbox_admin_username

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  admin_ssh_key {
    username   = var.jumpbox_admin_username
    public_key = file(var.jumpbox_ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = filebase64(var.jumpbox_cloud_init_file)
}
