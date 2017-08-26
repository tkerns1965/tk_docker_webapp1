# explicitly create a new volume
# if omitted, volume will be implicitly created by the 'docker run' statement below
docker volume create tkdw_webapp_socket

# connect a temporary container to the new volume and change ownership
docker run --mount src=tkdw_webapp_socket,dst=/app/socket debian:jessie-slim --name tmp-chown-skt \
  sh -c "chown -R www-data:www-data app"

# remove the temporary container
docker rm tmp-chown-skt
