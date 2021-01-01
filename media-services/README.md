# Media Services
A series of media services running in docker are described to create an automated pipeline to request and serve media. THe media is stored in an redundant NAS which is then mounted by the server under /mnt/media. All configuration files in the docker container should be stored and mounted under /docker. Directories that need to be mounted and shared by containers should also be under /docker. The permissions for the containers should correspond to the docker:docker. The docker userid and groupid should be in the example.env file as well as any other required configuration needed to run these services

## Jackett
Indexer for hundreds of torrent websites. Currently it's only set up to use public torrents but private trackers will eventually be added too.

## Ombi
Publically available website to request media. It uses the plex oath for users to login. 

## Sonarr
Private website that will automate the tv show request pipeline and save everything under /mnt/media/tv

## Radarr
Private website that will automate the movie request pipeline and save everything under /mnt/media/movies

## Sabnzbd
Download clients for usenet .nzb. Sonarr and Radarr will try to make request here first. 

## Deluge
Torrenting program configured to run in a docker container behind a vpn