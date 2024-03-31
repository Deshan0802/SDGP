import pytest
from flask import Flask
from app.routes.sign_up import sign_up_bp


@pytest.fixture
def app():
    app = Flask(__name__)
    app.register_blueprint(sign_up_bp)
    return app


@pytest.fixture
def client(app):
    return app.test_client()


def test_sign_up_invalid_json(client):
    response = client.post("/sign-up", data="not json")
    assert response.status_code == 400
    assert "Request must be JSON" in response.json["message"]


def test_sign_up_empty_fields(client):
    json_data = {}
    response = client.post("/sign-up", json=json_data)
    assert response.status_code == 400
    assert "One or more fields are empty." in response.json["message"]


def test_sign_up_mismatched_password(client):
    json_data = {
        "username": "username",
        "first_name": "first_name",
        "last_name": "last_name",
        "email": "email",
        "password": "password",
        "password_confirmed": "password_confirmed",
    }
    response = client.post("/sign-up", json=json_data)
    assert response.status_code == 400
    assert "Passwords do not match." in response.json["message"]
