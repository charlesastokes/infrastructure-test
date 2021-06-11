# infrastructure-test
This is a repo created to house Terraform config for AWS resources.

The intention is to learn Terraform best practices

Some goals:
* Terraform locally
* Terraform with remote state
* Terraform integrated within Github with Codebuild Integration

# Local run
* Set up AWS CLI Locally: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

* Install Terraform with Choco `choco install terraform` on windows

* Follow initial Terraform AWS provider guide: https://learn.hashicorp.com/tutorials/terraform/aws-build

* See `learn-terraform-local-aws-example/main.tf` for an example created for this tutorial. Note after the terraform init with state created locally, the added .gitignore since terraform state can contain sensitive info. For more information: https://dev.to/loujaybee/should-you-commit-the-terraform-tfstate-file-to-git-5054

