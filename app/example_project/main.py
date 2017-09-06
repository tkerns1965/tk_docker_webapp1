from app import app, db
from auth import *
from admin import admin
from api import api
from models import *
from views import *

admin.setup()
api.setup()

def create_tables():
    db.database.create_tables([User], safe=True)

if __name__ == '__main__':
    create_tables()
    app.run()
