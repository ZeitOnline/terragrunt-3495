#!/bin/bash

cat <<EOT > encryption.tf
terraform {
encryption {
    key_provider "pbkdf2" "this" {
      passphrase = "correct-horse-battery-staple"
    }
    method "aes_gcm" "this" {
      keys = key_provider.pbkdf2.this
    }
    state {
      method = method.aes_gcm.this
      enforced = true
    }
    plan {
      method = method.aes_gcm.this
      enforced = true
    }
  }
}
EOT
