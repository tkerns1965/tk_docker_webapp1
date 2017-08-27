# explicitly create new volume(s)
# if omitted, volume(s) will be implicitly created by the 'docker run' statement below
docker volume create tkdw_db_socket
docker volume create tkdw_webapp_socket

# connect a busybox container to the new volume(s) and change ownership
docker run --rm \
  --mount src=tkdw_db_socket,dst=/db/socket \
  --mount src=tkdw_webapp_socket,dst=/app/socket \
  busybox:1.27.2 \
  sh -c " \
    chown -R 999:999 db && \
    chown -R www-data:www-data app\
    "
