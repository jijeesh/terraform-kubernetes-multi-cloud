# terraform {
#   backend "azurerm" {
#   }
# }



# terraform {
#   backend "gcs" {
#     bucket  = "tf-state-prod"
#     prefix  = "terraform/state"
#   }
# }

# provider "azurerm" {
#   version = ">=2.0"
#   # The "feature" block is required for AzureRM provider 2.x.
#   features {}
# }
# variable "myList" {
#     type = "list"
#     default = ["a", "b", "c"]
# }

# terraform {
#   backend "azurerm" {
#     storage_account_name  = "acemesa"
#     container_name        = "tfstate"
#     key                   = "aceme-management.tfstate"
#   }
# }
