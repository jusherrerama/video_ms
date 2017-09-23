
FROM ruby:2.3
RUN mkdir /videos_ms
WORKDIR /videos_ms
ADD Gemfile /videos_ms/Gemfile
ADD Gemfile.lock /videos_ms/Gemfile.lock
RUN bundle install
ADD . /videos_ms
