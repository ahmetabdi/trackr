# Trackr

`docker-compose build`

`docker-compose run web bin/setup`

`docker-compose up`

## Windows Development

By default the EOF for windows is set to CRLF but we need to use LF as the files are run under Docker which use linux.

`git config --global core.autocrlf false`
`git config --global core.eol lf`
