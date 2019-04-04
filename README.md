# ownCloud Multi-instance With Reverse Proxy

This is a multi-instance setup of ownCloud where both instances sit behind [a reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy).
The intent of the project is to make is easier to test functionality of ownCloud that requires interaction between multiple instances, as well as a, potential, template for building multi-instance setups (that's a latter thought that is perhaps a coincidental benefit, rather than a stated aim).

**NOTE:** Currently the project will not build if you run `docker-compose up`, as some essential files are missing. These may be included shortly. Alternatively, instructions may be given for creating these files manually.
