from flask import Flask
from config import Config
from app.models import db


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    db.init_app(app)

    from app.routes.git_update import git_update_bp
    from app.routes.sign_up import sign_up_bp
    from app.routes.login import login_bp
    from app.routes.text_to_asl import text_to_asl_bp
    from app.routes.document_to_asl import document_to_asl_bp
    from app.routes.profile import profile_bp
  

    app.register_blueprint(git_update_bp)
    app.register_blueprint(sign_up_bp)
    app.register_blueprint(login_bp)
    app.register_blueprint(text_to_asl_bp)
    app.register_blueprint(document_to_asl_bp)
    app.register_blueprint(profile_bp)
   

    return app
