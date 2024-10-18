terraform {
  source = "./"
}

inputs = {
  state_file = "${get_repo_root()}/state/B.tfstate"
}
