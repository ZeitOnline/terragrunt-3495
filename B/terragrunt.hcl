include "root" {
  path   = find_in_parent_folders()
}

terraform {
  source = "./"
}

inputs = {
  state_file = "${get_repo_root()}/state/B.tfstate"
}
