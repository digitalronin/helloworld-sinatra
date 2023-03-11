TAG := sinatra-helloworld

Gemfile.lock: Gemfile
	docker run --rm \
		-v $$(pwd):/app \
		-w /app \
		ruby:3.1-alpine sh -c "apk add --update --no-cache build-base; bundle install"

build:
	docker build -t $(TAG) .

server: Gemfile.lock
	make build
	docker run --rm \
		-p 8000:80 \
		$(TAG)


