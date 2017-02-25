# Soon R.I.P. [![Build Status](https://travis-ci.org/aocole/epitaph.svg?branch=develop)](https://travis-ci.org/aocole/epitaph)

This is the software behind the soon.rip website. See the [github wiki](https://github.com/aocole/epitaph/wiki) for background information.

## Development
You can run this app for development purposes in Docker Compose.

### Prerequisites
Install Docker and Docker Compose. On MacOS, use [Docker for Mac](https://docs.docker.com/docker-for-mac/install/).

### Running the app
* Copy `.env.web.sample` to `.env.web`
* Edit `.env.web` to add your settings. Ask if unsure of what to put in here.
* `docker-compose build` to download and build the images. This will take a couple minutes and downloads ~600MB, but you should only have to do it once. Re-build is necessary when new gems are installed, but that will only need to download the new gems.
* `docker-compose run web rake db:create` to create the database (one-time)
* `docker-compose run web rake db:migrate` to migrate the database (re-do whenever there are new db migrations)
* `docker-compose up` in the same directory as docker-compose.yml to run the server (ctrl-c to stop. run command again to restart the server)
* The app can be accessed at http://localhost:3000
* The project files are mounted in to the container so any changes to the host filesystem should be reflected in the container.
* [This article](http://blog.carbonfive.com/2015/03/17/docker-rails-docker-compose-together-in-your-development-workflow/) provides good info about the setup/workflow

### Thanks!
This site was developed during [SUSE Hack Week Feb 2017](https://hackweek.suse.com/projects/my-epitaph)

