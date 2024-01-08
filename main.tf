terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"  # Specifying the source of the azurerm provider
            version = "3.86.0"  # Specifying the version of the azurerm provider
        }
    }
}

provider "azurerm" {
    features {}  # Enabling provider features, if any
}

resource "azurerm_resource_group" "myrg" {
  name     = "marks-rg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "myvnet" {
    name                = "marks-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_subnet" "mysubnet" {
    name                 = "marks-subnet"
    resource_group_name  = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.example.name
    address_prefixes     = ["10.0.1.0/24"]
}
