
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

variable "out_str" {
  type = string
}

output "out" {
  value = var.out_str
}
