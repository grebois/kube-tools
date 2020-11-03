TAG?=v1

build:
	d -t stefanprodan/kube-tools:$(TAG) . -f Dockerfile

push:
	docker push stefanprodan/kube-tools:$(TAG)
