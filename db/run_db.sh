docker run -d \
  --name tkdw_db1 \
  --mount src=tkdw_db_socket,dst=/db/socket \
  tkdw_db