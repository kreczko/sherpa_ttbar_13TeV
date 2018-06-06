DOCKER=docker

build:
	@echo ">> Building ${DOCKERHUB_USER}/sherpa:ttbar_13TeV"
	$(DOCKER) build -t ${DOCKERHUB_USER}/sherpa:ttbar_13TeV .

push:
	@echo ">> Pushing ${DOCKERHUB_USER}/sherpa:ttbar_13TeV to https://hub.docker.com/"
	docker push ${DOCKERHUB_USER}/sherpa:ttbar_13TeV

.PHONY : build
