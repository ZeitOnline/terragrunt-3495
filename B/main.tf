
terraform {
}

variable "state_file" {
  type = string
}

terraform {
  backend "local" {
    path = var.state_file
  }
}

output "out" {
  value = "test"
}
