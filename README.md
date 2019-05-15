# docker-amber
Dockerized Development Environment for Crystal/Amber Framework

## Getting started
- Clone this repository
- Init a new app `./run /bin/bash -c "cd .. && amber new app -d pg -m granite"`
- Edit `./src/config/environments/development.yml` and change host in `database_url` to `db`
- Run `./run shards install`
- Init the database with `./amber db create migrate`
- Start your app with `docker-compose up` and access it at http://localhost:3000