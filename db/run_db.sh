docker run -d \
  --name tkdw1_db \
  --mount src=tkdw_db_data,dst=/var/lib/mysql \
  --mount src=tkdw_db_socket,dst=/db/socket \
  tkdw_db
