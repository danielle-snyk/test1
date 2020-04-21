IMAGE := snyk/snyk-container-demo

all: build

test:
	snyk test --docker $(IMAGE) --file=Dockerfile

check-buildkit:
ifndef DOCKER_BUILDKIT
        $(error You must enable Buildkit for Docker, by setting DOCKER_BUILDKIT=1)
endif

build: check-buildkit
	docker build --pull -t $(IMAGE) .


.PHONY: check-buildkit all build test
