mkdir -p /docker
chown docker:docker /docker
groupadd -g 5050 pgadmin
useradd -r -u 5050 -g 5050 -s /usr/bin/nologin pgadmin
mkdir -p /docker/pgadmin
chown pgadmin:pgadmin /docker/pgadmin
#possible improvement is to automate creation of .env file with user id and group id