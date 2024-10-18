generate "encryption" {
  path      = "encryption.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
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
EOF
}

remote_state {
  backend = "gcs"
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = <MY_BUCKET>
    prefix = "${path_relative_to_include()}"

    skip_bucket_creation = true
  }
}
