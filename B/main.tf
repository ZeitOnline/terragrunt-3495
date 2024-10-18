
variable "state_file" {
  type = string
}

terraform {
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
