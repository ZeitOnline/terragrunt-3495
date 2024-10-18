terraform {
  source = "./"
}

dependency "B" {
  config_path = "../B"
}

inputs = {
  state_file = "${get_repo_root()}/state/A.tfstate"
  out_str = dependency.B.outputs.out
}
