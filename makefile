
build:
	@docker build --no-cache -t terraform-docker . | tee -a build.log 

