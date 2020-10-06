FROM ruby:2.6.5
ENV LANG C.UTF-8

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

RUN mkdir -p /usr/local/bundle

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN sed -i '/jessie-updates/d' /etc/apt/sources.list \
    && apt-get update -qq \
    && apt-get install -y \
        build-essential \
        nodejs \
        yarn \
    && rm -rf /var/lib/apt/lists/* \
    && bundle install -j4

RUN bundle install