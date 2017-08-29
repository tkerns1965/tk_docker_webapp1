docker run -d \
  --name tkdw1_db1 \
  --mount src=tkdw1_db_data,dst=/var/lib/mysql \
  --mount src=tkdw1_db_socket,dst=/db/socket \
  tkdw1_db
