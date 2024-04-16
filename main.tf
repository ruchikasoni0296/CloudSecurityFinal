provider "aws" {
  region = "us-east-1"
}

# Vault provider configuration
provider "vault" {
  address = "http://localhost:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"
    method = "approle"

    parameters = {
      role_id = "bd08720e-ebaa-5223-79e5-c245fd8b53e7"
      secret_id = "ad9d81da-7e21-8f6e-eb8e-fdd003997b85"
    }
  }
}

# Vault KV secret data source
data "vault_kv_secret_v2" "example_vault" {
  mount = "secret"
  name  = "test-secret"
}

# AWS instance resource
resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name   = "vault-test-instance"
    Secret = data.vault_kv_secret_v2.example_vault.data["username"]
  }
}	
