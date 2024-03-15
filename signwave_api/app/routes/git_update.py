from flask import Blueprint, request
import git

git_update_bp = Blueprint("git-update", __name__)


@git_update_bp.route("/git-update", methods=["POST"])
def git_update():
    if request.method == "POST":
        repo = git.Repo("../SDGP")
        origin = repo.remotes.origin
        repo.create_head("main", origin.refs.main).set_tracking_branch(
            origin.refs.main
        ).checkout()
        origin.pull()
        return "", 200
    else:
        return "", 400
