FROM ruby:2.4.0

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir /myapp

WORKDIR /tmp
COPY Gemfile* ./
RUN bundle install

ADD . /myapp
WORKDIR /myapp

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

