terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.21.0"
    }
  }
}

# Configure the GitHub Provider

provider "github" {
  #owner = "spunkandgritt"
  token = "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"
}


# resource "github_repository" "tf-repo" {
#   name        = "tf-repo"

#   visibility = "public"
# }


resource "github_repository_environment" "tf-repo" {
  environment  = "mainnet"
  repository   = "tf-repo"
  reviewers {
    users = [
        100330365,
        ]
  }
  deployment_branch_policy {
    protected_branches          = true
    custom_branch_policies = false
  }
}

resource "github_repository_environment" "testnet" {
  environment  = "testnet"
  repository   = "tf-repo"
  reviewers {
  }
}

resource "github_actions_environment_secret" "API_KEY" {
environment = "mainnet"
repository   = "tf-repo"
secret_name      = "API_KEY"
encrypted_value = "M4oFPIJ+C32DX2s142W/JhGhgKLa4IniOQz6iRFPzRHdB1QA//tGY1ootReii0zU8mltyLzQVrW6FQ=="
}
