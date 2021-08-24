# Configure the Microsoft Azure Provider
provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}
    ARM_CLIENT_SECRET = 'QZV=A]JAMtzQ.WUQi.bwXnuedYjl3973'
    ARM_CLIENT_ID = '33764c29-a12d-44f7-8c8c-e871dab11de6'
    ARM_TENANT_ID = '513294a0-3e20-41b2-a970-6d30bf1546fa'
    ARM_SUBSCRIPTION_ID = '2c7688d7-92df-4b63-bc3f-e91ed4b6d4af'
}

# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "hostterraformgroup" {
    name     = var.rg_name
    location = "Central India"

    tags = {
        environment = "Terraform Host"
    }
}

# Create virtual network
resource "azurerm_virtual_network" "hostterraformnetwork" {
    name                = var.vnet_name
    address_space       = ["10.0.0.0/16"]
    location            = "Central India"
    resource_group_name = azurerm_resource_group.hostterraformgroup.name

    tags = {
        environment = "Terraform Host"
    }
}

# Create subnet
resource "azurerm_subnet" "hostterraformsubnet" {
    name                 = var.subnet_name
    resource_group_name  = azurerm_resource_group.hostterraformgroup.name
    virtual_network_name = azurerm_virtual_network.hostterraformnetwork.name
    address_prefixes       = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "hostterraformpublicip" {
    name                         = var.public_ip_name
    location                     = "Central India"
    resource_group_name          = azurerm_resource_group.hostterraformgroup.name
    allocation_method            = "Dynamic"

    tags = {
        environment = "Terraform Host"
    }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "hostterraformnsg" {
    name                = var.nsg_name
    location            = "Central India"
    resource_group_name = azurerm_resource_group.hostterraformgroup.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    
    tags = {
        environment = "Terraform Host"
    }
}

# Create network interface
resource "azurerm_network_interface" "hostterraformnic" {
    name                      = var.nic_name
    location                  = "Central India"
    resource_group_name       = azurerm_resource_group.hostterraformgroup.name

    ip_configuration {
        name                          = var.ipconfig_name
        subnet_id                     = azurerm_subnet.hostterraformsubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.hostterraformpublicip.id
    }

    tags = {
        environment = "Terraform Host"
    }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "terraformnisga" {
    network_interface_id      = azurerm_network_interface.hostterraformnic.id
    network_security_group_id = azurerm_network_security_group.hostterraformnsg.id
}



# Create virtual machine
resource "azurerm_linux_virtual_machine" "hostterraformvm" {
    name                  = var.vm_name
    location              = "Central India"
    resource_group_name   = azurerm_resource_group.hostterraformgroup.name
    network_interface_ids = [azurerm_network_interface.hostterraformnic.id]
    size                  = var.vm_size

    os_disk {
        name              = var.os_disk
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }
    computer_name  = var.computer_name
    admin_username = var.admin_username
    disable_password_authentication = false
    admin_password = var.admin_password

    

    tags = {
        environment = "Terraform Host"
    }
}





