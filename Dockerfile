FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /toy_robot
WORKDIR /toy_robot
COPY Gemfile /toy_robot/Gemfile
COPY Gemfile.lock /toy_robot/Gemfile.lock
RUN bundle install
COPY . /toy_robot
