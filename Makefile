build: build-reloader
.PHONY: build

build-reloader: Dockerfile bird-reloader.sh .inotify.built
	@docker build -t pskamruk/bird-reloader:latest .

build-inotify: Dockerfile.inotify
	@docker build -t pskamruk/inotify:latest -f Dockerfile.inotify .
	@touch .inotify.built

publish: publish-reloader
.PHONY: publish

publish-reloader:
	docker push pskamruk/bird-reloader:latest
