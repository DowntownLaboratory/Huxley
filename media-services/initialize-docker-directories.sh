#!/bin/bash

useradd -r -u 2000 -g 977 -s /usr/bin/nologin docker
mkdir /docker
cd /docker
mkdir ombi sonarr jackett radarr sabnzbd deluge
chown -R docker /docker
chgrp -R docker /docker
chmod -R 770 /docker