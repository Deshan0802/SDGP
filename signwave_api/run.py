from app import create_app

app = create_app()

if __name__ == "__main__":

    # Change this
    app.run(debug=True)

    # To this for development and testing
    # app.run(debug=True, port=8000)
