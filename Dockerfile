FROM mediawiki:1.41.1

RUN apt-get update \
	&& apt-get install --yes --no-install-recommends libldap2-dev libpq-dev \
	&& docker-php-ext-install ldap pgsql pdo pdo_pgsql \
	&& rm -rf /var/lib/apt/lists \
	&& curl https://extdist.wmflabs.org/dist/extensions/LDAPGroups-REL1_41-bfcb641.tar.gz --output /tmp/ldapprovider.tar.gz \
	&& tar --extract --file=/tmp/ldapprovider.tar.gz --directory=/var/www/html/extensions
