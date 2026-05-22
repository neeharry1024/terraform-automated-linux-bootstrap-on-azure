locals {
  custom_html = indent(6, file("${path.module}/cloud-init/custom-index.html"))

  health_script = indent(6, file("${path.module}/cloud-init/health-check.sh"))

  startup_script = indent(6, file("${path.module}/scripts/startup.sh"))
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size

  admin_username = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  disable_password_authentication = true

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

  custom_data = base64encode(templatefile(
    "${path.module}/cloud-init/cloud-init.tpl",
    {
      custom_html    = local.custom_html
      health_script  = local.health_script
      startup_script = local.startup_script
    }
  ))
}
