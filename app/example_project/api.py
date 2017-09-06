from flask_peewee.rest import UserAuthentication, RestAPI, RestResource
from app import app
from auth import auth
from models import User

user_auth = UserAuthentication(auth)

api = RestAPI(app, default_auth=user_auth)

class UserResource(RestResource):
    exclude = ('password', 'email',)

api.register(User, UserResource, auth=user_auth)
