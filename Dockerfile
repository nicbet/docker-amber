FROM nicbet/crystal:0.28.0

# Install Required Dependencies
RUN apt-get update \
 && apt-get install -y wget curl libreadline-dev libsqlite3-dev libpq-dev libmysqlclient-dev libssl-dev libyaml-dev

# Install NodeJS 10.x and Yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y build-essential libssl-dev libreadline-dev libxml2-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# Install Postgres Client Libraries
RUN apt-get install -y postgresql-common libpq-dev postgresql-client

# Heroku
RUN curl https://cli-assets.heroku.com/install.sh | sh

# Install amber 
RUN curl -L https://github.com/amberframework/amber/archive/stable.tar.gz | tar xz \
 && cd amber-stable \
 && shards install \
 && make install

WORKDIR /app

EXPOSE 3000
CMD ["amber", "-v"]
