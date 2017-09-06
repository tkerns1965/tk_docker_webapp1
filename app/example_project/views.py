from app import app
from flask import render_template
from auth import auth
from models import User

@app.route('/')
def homepage():
    return render_template('foo.html')

@app.route('/private/')
@auth.login_required
def private_view():
    user = auth.get_logged_in_user()
    return render_tempate(...)
