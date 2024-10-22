locals {
  encryption = run_cmd("${get_repo_root()}/encryption.sh")
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
