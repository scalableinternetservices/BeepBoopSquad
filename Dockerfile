FROM ruby:2.6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
&& apt-get update && apt-get install -y nodejs yarn --no-install-recommends \
&& gem install rails && gem install rake

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install

CMD ["/bin/bash"]
