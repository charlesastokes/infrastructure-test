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

*Note that I edited the EC2 Image IDs based on amazon images from within the current region, us-east-1, since the tutorial is based on us-west.

* Assuming graphviz is installed from: http://www.graphviz.org/ run the following command in the terraform director to output a graph representing the current plan using terraform graph, which produces graphviz .dot file output, redirecting via stdin to graphviz dot command, and create a png file of the current plan: `terraform graph | dot -Tpng -o graphvizplan.png`

# Local run with S3 Backend

* Looking at https://www.terraform.io/docs/language/settings/backends/s3.html to get a sense of using an S3 backend

* I'm starting by creating a terraform managed directory in `/remote-state-bucket-infra` to create an actual S3 bucket. This is not the Terraform which has an S3 backend, this is Terraform to create an S3 bucket that can be used in a future terraform setup.

