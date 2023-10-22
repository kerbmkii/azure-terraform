terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.77"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "satfstatenk"
    container_name       = "tf-state"
    key                  = "core.tfstate"
  }
}

provider "azurerm" {
  features {}
}
