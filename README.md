# Soon R.I.P.

This is the software behind the soon.rip website. See the [github wiki](https://github.com/aocole/epitaph/wiki) for background information.

## Development
You can run this app for development purposes in Docker Compose.

### Prerequisites
Install Docker and Docker Compose. On MacOS, use [Docker for Mac](https://docs.docker.com/docker-for-mac/install/) and install docker-compose with Brew.

### Running the app
* Copy `.env.web.sample` to `.env.web`
* Edit `.env.web` to add your settings. Ask if unsure of what to put in here.
* `docker-compose up` in the same directory as docker-compose.yml to run the server
* The app can be accessed at http://localhost:3000
* The project files are mounted in to the container so any changes to the host filesystem should be reflected in the container.


### Thanks!
This site was developed during [SUSE Hack Week Feb 2017](https://hackweek.suse.com/projects/my-epitaph)

