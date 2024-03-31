from app import create_app

app = create_app()

if __name__ == "__main__":
    # Change this
    app.run(debug=True)

    # To this for developing and testing
    # app.run(debug=True, port=8000)
    # app.run(debug=True, host="0.0.0.0", port=8000)
