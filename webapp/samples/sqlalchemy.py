from sqlalchemy import create_engine
engine = create_engine('mysql+pymysql://tony:2hard4u@localhost/tkdw1?unix_socket=/db/socket/mysqld.sock', echo=True)
conn = engine.connect()
from sqlalchemy.sql import text
s = text("select * from tblCompany")
conn.execute(s).fetchall()
