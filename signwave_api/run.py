from app import create_app

app = create_app()

if __name__ == "__main__":

    #Change this befor run
    app.run(debug=True)
    #To this
    #app.run(debug=True, port=8000)


