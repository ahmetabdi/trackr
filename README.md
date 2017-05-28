# Trackr

[![CircleCI](https://circleci.com/gh/ahmetabdi/trackr.svg?style=svg&circle-token=213c08110a5d5f498458dfc3f47e8e4fba1bbf52)](https://circleci.com/gh/ahmetabdi/trackr)
[![Code Climate](https://codeclimate.com/github/ahmetabdi/trackr/badges/gpa.svg)](https://codeclimate.com/github/ahmetabdi/trackr)
[![Test Coverage](https://codeclimate.com/github/ahmetabdi/trackr/badges/coverage.svg)](https://codeclimate.com/github/ahmetabdi/trackr/coverage)
[![Issue Count](https://codeclimate.com/github/ahmetabdi/trackr/badges/issue_count.svg)](https://codeclimate.com/github/ahmetabdi/trackr)

`docker-compose build`

`docker-compose run web bin/setup`

`docker-compose up`

## Windows Development

By default the EOF for windows is set to CRLF but we need to use LF as the files are run under Docker which use linux.

`git config --global core.autocrlf false`

`git config --global core.eol lf`

## Load database dump into docker database

`docker-compose exec database sh`

`pg_restore --verbose --clean --no-acl --no-owner -h database -U postgres -d trackr_development latest.dump`
