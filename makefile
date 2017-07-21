
build: 
	$(eval DOCKER_NAME := $(shell cat config.yml |  python -c 'import yaml; import sys; print yaml.load(sys.stdin)["docker"]["name"]'))
	$(eval TERRAFORM_VERSION := $(shell cat config.yml |  python -c 'import yaml; import sys; print yaml.load(sys.stdin)["docker"]["terraform-version"]'))
	$(eval SHA256SUM := $(shell cat config.yml |  python -c 'import yaml; import sys; print yaml.load(sys.stdin)["docker"]["sha"]'))
	@echo "Configure Dockerfile"; sed -i.bck -e 's/<TERRAFORM_VERSION>/$(TERRAFORM_VERSION)/g' -e 's/<SHA256SUM>/$(SHA256SUM)/g' Dockerfile; rm -rf Dockerfile.bck 
	@docker build -t $(DOCKER_NAME) . | tee -a build.log 

