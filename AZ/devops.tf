
resource "azuredevops_project" "az-devops-project" {
    name = "InfraDevOps"
    description = "Project deployed using Terraform"
}


resource "azuredevops_variable_group" "variablegroup" {
  project_id   = azuredevops_project.az-devops-project.id
  name         = "VG-${var.env}"
  description  = "This variable group is created using Terraform"
  allow_access = true

  variable {
    name  = "buildPlatform"
    value = "Any CPU"
  }

  variable {
    name      = "buildConfiguration"
    value     = "Release"
  }

   variable {
    name         = "Account Password"
    secret_value = "p@ssword123"
    is_secret    = true
  }
}