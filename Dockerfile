FROM ruby:2.4.0

RUN http_proxy=$HTTP_PROXY apt-get update -qq \
    && http_proxy=$HTTP_PROXY apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev \
        nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

