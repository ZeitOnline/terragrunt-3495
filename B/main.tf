
variable "state_file" {
  type = string
}

terraform {
  backend "local" {
    path = var.state_file
  }
  encryption {
    key_provider "pbkdf2" "this" {
      passphrase = "correct-horse-battery-staple"
    }
    method "unencrypted" "migrate" {}
    method "aes_gcm" "this" {
      keys = key_provider.pbkdf2.this
    }
    state {
      method = method.aes_gcm.this
      enforced = true

      # fallback {
      #   method = method.unencrypted.migrate
      # }
    }
    plan {
      method = method.aes_gcm.this
      enforced = true

      # fallback {
      #   method = method.unencrypted.migrate
      # }
    }
  }
}

output "out" {
  value = "test"
}
