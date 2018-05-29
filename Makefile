DOCKER=docker

build:
	$(DOCKER) build -t kreczko/sherpa:ttbar_13TeV .

push:
	docker push kreczko/sherpa:ttbar_13TeV

.PHONY : build
