FROM ruby:3.1-alpine

RUN apk add --update --no-cache build-base

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

ENV RACK_ENV=production \
    PORT=80

EXPOSE 80

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "80"]
