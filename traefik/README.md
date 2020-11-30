Traefik is an Edge Router which means it intercepts and routes every incoming request to its desired destination.

Traefik does the edge routing by reading the desired configuartion from the services themselves
It also handles any https configuration for us

To https routing to your container add the following labels to your containers and traefik will automatically pick it up
    labels:
      - traefik.enable=true
      - traefik.port=PORT_NUMBER
      - traefik.http.routers.ombi.rule=Host(`example.com`)
      - traefik.http.routers.ombi.tls.certresolver=le
      - traefik.http.routers.ombi.entrypoints=websecure
      - traefik.docker.network=web
Add the following network as well
    networks:
      - web

networks:
  web:
    external: true