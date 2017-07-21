
build: 
	$(eval DOCKER_NAME := $(shell cat config.yml |  python -c 'import yaml; import sys; print yaml.load(sys.stdin)["docker"]["name"]'))
	$(eval TERRAFORM_VERSION := $(shell cat config.yml |  python -c 'import yaml; import sys; print yaml.load(sys.stdin)["docker"]["terraform-version"]'))
	$(eval SHA256SUM := $(shell cat config.yml |  python -c 'import yaml; import sys; print yaml.load(sys.stdin)["docker"]["sha"]'))
	$(eval TAG_NAME := $(shell cat config.yml |  python -c 'import yaml; import sys; print yaml.load(sys.stdin)["docker"]["tag"]'))
	$(eval ALPHINE_VER := $(shell cat config.yml |  python -c 'import yaml; import sys; print yaml.load(sys.stdin)["docker"]["alphine-version"]'))
	@echo "Configuring Dockerfile.....!!!!"; sed -i.bck -e 's/<ALPHINE_VER>/$(ALPHINE_VER)/g' -e 's/<TERRAFORM_VERSION>/$(TERRAFORM_VERSION)/g' -e 's/<SHA256SUM>/$(SHA256SUM)/g' Dockerfile;
	@docker build --no-cache -q -t  $(DOCKER_NAME):latest -t $(DOCKER_NAME):$(TAG_NAME) .
	@mv Dockerfile.bck Dockerfile
	@echo "Done...!!!"
 

