import pytest
from flask import Flask, jsonify
from flask.testing import FlaskClient
from unittest.mock import patch
from app.models import User  

from app.routes.login import login_bp 

@pytest.fixture
def app():
    app = Flask(__name__)
    app.register_blueprint(login_bp)
    return app

@pytest.fixture
def client(app):
    return app.test_client()

def test_login_missing_username(client):
    response = client.post('/login', json={"password": "test_password"})
    assert response.status_code == 400
    assert b'Username is required' in response.data

def test_login_missing_password(client):
    response = client.post('/login', json={"username": "test_user"})
    assert response.status_code == 400
    assert b'Password is required' in response.data
