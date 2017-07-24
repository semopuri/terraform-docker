# terraform-docker
Dockerfile for Terraform

## Syntax
- docker run -v {dir}:/data -e AWS_ACCESS_KEY_ID=<acces-key> -e AWS_SECRET_ACCESS_KEY=<secret-key> terraform-docker plan

#### Example
- docker run -v $PWD:/data -e AWS_ACCESS_KEY_ID=<acces-key> -e AWS_SECRET_ACCESS_KEY=<secret-key> terraform-docker plan
