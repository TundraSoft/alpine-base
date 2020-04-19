# TundraSoft - AlpineBase

This is a base docker image used throughout all docker builds. Common
utils like S6overlay etc have been pre-installed for benifit.

## Installed Components

### [`S6`]([!https://github.com/just-containers/s6-overlay#the-docker-way "S6 Github link")

The s6-overlay-builder project is a series of init scripts and utilities to ease creating Docker images using s6 as a process supervisor.

### Time Zone

Timezone is available pre-packaged. To set timezone, pass environment variable TZ, example TZ=Asia/Kolkata
