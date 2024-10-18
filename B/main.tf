
variable "state_file" {
  type = string
}

terraform {
  backend "local" {
    path = var.state_file
  }
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

provider "null" {}

output "out" {
  value = "test"
}
