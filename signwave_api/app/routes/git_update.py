from flask import Blueprint
import git

git_update_bp = Blueprint("git-update", __name__)


@git_update_bp.route("/git-update", methods=["POST"])
def git_update():
    repo = git.Repo("./SDGP")
    origin = repo.remotes.origin
    repo.create_head("main", origin.refs.main).set_tracking_branch(
        origin.refs.main
    ).checkout()
    origin.pull()
    return "", 200
