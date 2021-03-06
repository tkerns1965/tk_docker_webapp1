docker volume create vol_tkdw1_db_data
docker volume create vol_tkdw1_db_socket

docker run -di \
  --name bb_temp \
  --mount src=vol_tkdw1_db_data,dst=/var/lib/mysql \
  --mount src=vol_tkdw1_db_socket,dst=/db/socket \
  busybox:1.27.2

docker exec bb_temp \
  sh -c "chown -R 999:999 db"

docker stop bb_temp
docker rm bb_temp
