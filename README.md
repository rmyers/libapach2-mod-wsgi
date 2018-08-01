# Debian packages for libapache2-mod-wsgi on trusty (14.04)

Pull down the lastest version of mod_wsgi and build a debian
package to replace the hopelessly out of date version.

## Build It

1) Install docker and docker-compose on your local machine.
2) Run the build:

		make build
		or
		MOD_WSGI_VERSION=X.X.X make build

3) Inspect the files:

		make dev
        dpkg --info libapache2-mod-wsgi*
