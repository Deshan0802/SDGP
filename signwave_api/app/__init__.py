from flask import Flask
from config import Config
from app.models import db


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    db.init_app(app)

    from app.routes.sign_up import sign_up_bp
    from app.routes.login import login_bp

    app.register_blueprint(sign_up_bp)
    app.register_blueprint(login_bp)

    return app
