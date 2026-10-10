terraform {
  required_version = ">= 1.7.0"
}

module "compute-virtualmachine" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  virtual_machines = {} # see README Inputs table / upstream module docs for the per-entry schema
}
