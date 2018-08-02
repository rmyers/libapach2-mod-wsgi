# Debian packages for libapache2-mod-wsgi on trusty (14.04)

Pull down the lastest version of mod_wsgi and build a debian
package to replace the hopelessly out of date version.

## Build It

1) Install docker and docker-compose on your local machine.
2) Run the build:

		make build
		or
		MOD_WSGI_VERSION=X.X.X make build

3) Verify the files are correct in the `debian` subfolder.

## Debugging the container

You can run the docker container like:

	make dev
    dpkg --info libapache2-mod-wsgi*

## Using the package repo

You need to add the repo key:

	$ wget -qO - https://rmyers.github.io/libapache2-mod-wsgi/debian/PUBLIC.KEY | sudo apt-key add -

Next add a `mod_wsgi.list` file in `/etc/apt/sources.list.d/`:

	$ sudo echo "deb https://rmyers.github.io/libapache2-mod-wsgi/debian trusty main" > /etc/apt/sources.list.d/mod_wsgi.list

Then run `apt-get update` and install:

	$ sudo apt-get update
	$ sudo apt-get install libapache2-mod-wsgi

## How does this work?

I based this repo off of the work done by Matt Polnik. You can see his
[blog post](https://pmateusz.github.io/linux/2017/06/30/linux-secure-apt-repository.html)
for more details.
