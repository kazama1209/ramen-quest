FROM ruby:2.6.3
 
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      mysql-client \
      libmysqlclient-dev \
    && apt-get clean \
    && apt-get install -y build-essential libpq-dev nodejs \
    && rm -rf /var/lib/apt/lists/*
 
WORKDIR /usr/src/app
 
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
 
RUN gem install bundler \
  && bundle install --path vendor/bundle