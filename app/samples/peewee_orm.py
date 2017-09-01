from peewee import *

db = MySQLDatabase(user='tony', password='2hard4u', database='tkdw1', unix_socket=/db/socket/mysqld.sock)

class Company(Model):
    company_no = CharField()

    class Meta:
        database = db
