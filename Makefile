DOCKER=docker

build:
	$(DOCKER) build -t ${DOCKERHUB_USER}/sherpa:ttbar_13TeV .

push:
	docker push ${DOCKERHUB_USER}/sherpa:ttbar_13TeV

.PHONY : build
