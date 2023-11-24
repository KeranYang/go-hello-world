# Docker image settings
IMAGE_NAME := go-hello-world
QUAY_REPO := quay.io/keranyang/go-hello-world
TAG := v1.0.1

# Build the Docker image
build:
	docker build -t $(QUAY_REPO):$(TAG) .

# Push the Docker image to Quay.io
push:
	docker push $(QUAY_REPO):$(TAG)

# All-in-one command to build and push
all: build push

# Login to Quay.io (Optional - can be done manually)
login:
	docker login -u $(QUAY_USERNAME) -p $(QUAY_PASSWORD) quay.io

