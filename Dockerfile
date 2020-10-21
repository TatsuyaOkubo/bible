FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       nodejs \
                       vim

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

RUN mkdir /bible
WORKDIR /bible 

ADD Gemfile /bible/Gemfile
ADD Gemfile.lock /bible/Gemfile.lock

RUN gem install bundler 
RUN bundle install
ADD . /bible
RUN mkdir -p tmp/sockets