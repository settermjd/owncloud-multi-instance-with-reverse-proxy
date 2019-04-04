# ownCloud Multi-instance With Reverse Proxy
[link-reverse-proxy-explanation]: https://en.wikipedia.org/wiki/Reverse_proxy
[link-tutorial-one]: https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/
[link-tutorial-wikihow]: https://www.wikihow.com/Be-Your-Own-Certificate-Authority
[link-owncloud-source]: https://github.com/owncloud/core

This is a multi-instance setup of ownCloud where both instances sit behind [a reverse proxy][link-reverse-proxy-explanation].
The intent of the project is to make is easier to test functionality of ownCloud that requires interaction between multiple instances, as well as a, potential, template for building multi-instance setups (_that's a latter thought that is perhaps a coincidental benefit, rather than a stated aim_).

## Building the Containers

When initially checked out, the project will not build if you run `docker-compose up`, as the following files are missing:

- The ownCloud source for both ownCloud instances
- The SSL certificates

### The ownCloud Source for Both ownCloud Instances

You need to clone two copies of [the ownCloud source][link-owncloud-source], which need to be placed in `owncloud/community/owncloud-server-1` and `owncloud/community/owncloud-server-2`, respectively.

### The SSL Certificates

You need to:

- Generate private keys for both servers
- Generate a root certificate
- Sign each server’s private keys using the root certificate

If you’re not familiar with doing all this, here are two tutorials that step you through how to do it:

- [How to Create Your Own SSL Certificate Authority for Local HTTPS Development][link-tutorial-one]
- [How to Be Your Own Certificate Authority][link-tutorial-wikihow]

After you’ve completed the setup, you then need to install the files in the relevant directories under `docker/files/etc/ssl`.
You can see the locations and names in `docker-compose.yml`.

### Starting the Containers

Once SSL certificates have been created, signed, and stored, then you can start the containers by running the following command:

```
docker-compose up -d --build
```

This should start them all in a few minutes.
You can check on progress using one of two commands: `ps` and `logs`.
There are examples of how to use both in the example below.

```
docker-compose ps
docker-compose logs --follow
```
