variable "state_file" {
  type = string
}

variable "out_str" {
  type = string
}

output "out" {
  value = var.out_str
}
