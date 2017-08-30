docker run -d \
  --name cnt_tkdw1_db \
  --mount src=vol_tkdw1_db_data,dst=/var/lib/mysql \
  --mount src=vol_tkdw1_db_socket,dst=/db/socket \
  img_tkdw1_db
