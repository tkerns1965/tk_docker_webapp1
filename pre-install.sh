# explicitly create new volume(s)
# if omitted, volume(s) will be implicitly created
#   by the 'docker run' statement below
docker volume create vol_tkdw1_db_data
docker volume create vol_tkdw1_db_socket
docker volume create vol_tkdw1_app_socket

# connect a busybox container to the volume(s)
docker run -di \
  --name bb_temp \
  --mount src=vol_tkdw1_db_data,dst=/db/data \
  --mount src=vol_tkdw1_db_socket,dst=/db/socket \
  --mount src=vol_tkdw1_app_socket,dst=/app/socket \
  busybox:1.27.2

# change ownership of the folder(s) on the volume(s)
docker exec bb_temp \
  sh -c " \
    chown 999:999 /db/socket && \
    chown www-data:www-data /app/socket \
    "

# stop the busybox container
docker stop bb_temp

# remove the busybox container
docker rm bb_temp
