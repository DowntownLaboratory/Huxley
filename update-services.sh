cd universal-services/
docker-compose pull
docker-compose up -d --remove-orphans

cd ../media-services
docker-compose pull
docker-compose up -d --remove-orphans