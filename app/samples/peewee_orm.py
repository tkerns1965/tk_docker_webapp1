from peewee import *

db = MySQLDatabase(user='tony', password='2hard4u', database='tkdw1', unix_socket=/db/socket/mysqld.sock)

class BaseModel(Model):
    class Meta:
        database = db
        
class Company(BaseModel):
    company_no = IntegerField()
