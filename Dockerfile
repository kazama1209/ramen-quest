FROM ruby:2.6.3
  
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      mariadb-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler \
  && bundle install --path vendor/bundle