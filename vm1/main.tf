##ESSE MODULO IREI CRIAR UMA MAQUINA VIRTUAL NA REGIAO EASTUS, SOMENTE PARA TESTE DE CONEXÃO ENTRE REGIÕES
resource "azurerm_virtual_network" "mod_vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.rg_location
  resource_group_name = var.rg_name

  
}

resource "azurerm_subnet" "mod_snet" {
  name                 = var.snet_name
  resource_group_name = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [ azurerm_virtual_network.mod_vnet ]
   
}

resource "azurerm_network_interface" "mod_nic" {
  name                = var.nic_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_vm1
    subnet_id                     = azurerm_subnet.mod_snet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "mod_vm_win1" {
  name                = var.vm1_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [ azurerm_network_interface.mod_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
