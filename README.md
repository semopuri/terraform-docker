### Build Status [![Build Status](https://travis-ci.org/semopuri/terraform-docker.svg?branch=master)](https://travis-ci.org/)

# terraform-docker
Dockerfile for Terraform

## Create Docker Image
- Step 1 : Config.yml with required fields 
  #### Fields
  - name*
  - tag*
  - registry
  - alpine-version *
  - terraform-version *
  - sha*
  
- Step 2: Run make command 
  - make docker
          
note : working directory is /data

## Run Docker
### Syntax
- docker run -v {dir}:/data -e AWS_ACCESS_KEY_ID={access-key} -e AWS_SECRET_ACCESS_KEY={secret-key} terraform-docker plan

#### Example
- docker run -v $PWD:/data -e AWS_ACCESS_KEY_ID={access-key} -e AWS_SECRET_ACCESS_KEY={secret-key} terraform-docker plan
