from app import create_app

app = create_app()
app.secret_key = '188993120220374'

if __name__ == "__main__":

    #Change this befor run
    app.run(debug=True, port= 8000)
    #To this
    #app.run(debug=True, port=8000)

