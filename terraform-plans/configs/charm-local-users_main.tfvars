repository             = "charm-local-users"
repository_description = "A subordinate charm for creating and managing local user accounts and groups on principal units."
branch                 = "main"
templates = {
  codeowners = {
    source      = "./templates/github/CODEOWNERS.tftpl"
    destination = ".github/CODEOWNERS"
    vars        = {}
  }
  check = {
    source      = "./templates/github/charm_check.yaml.tftpl"
    destination = ".github/workflows/check.yaml"
    vars        = {
      # github hosted runners are amd64
      # Ubuntu_ARM64_4C_16G_01 is the github-hosted arm64 runner we have access to.
      # We prefer the github runners because they are smaller machines and save resources.
      # If we have issues with it, we can switch to the larger and more numerous self-hosted options:
      # - runs-on: [self-hosted, jammy, ARM64]
      runs_on = "[[ubuntu-latest], [Ubuntu_ARM64_4C_16G_01]]",
      test_commands = "['make functional']",
    }
  }
  promote = {
    source      = "./templates/github/charm_promote.yaml.tftpl"
    destination = ".github/workflows/promote.yaml"
    vars        = {}
  }
  release = {
    source      = "./templates/github/charm_release.yaml.tftpl"
    destination = ".github/workflows/release.yaml"
    vars        = {
      # github hosted runners are amd64
      # Ubuntu_ARM64_4C_16G_01 is the github-hosted arm64 runner we have access to.
      # We prefer the github runners because they are smaller machines and save resources.
      runs_on = "[[ubuntu-latest], [Ubuntu_ARM64_4C_16G_01]]",
    }
  }
}
