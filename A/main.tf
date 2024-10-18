include "root" {
  path   = find_in_parent_folders()
}

variable "state_file" {
  type = string
}

variable "out_str" {
  type = string
}

output "out" {
  value = var.out_str
}
