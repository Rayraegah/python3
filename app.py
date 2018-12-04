import responder


app = responder.API()


@app.route("/")
def hello_world(req, resp):
    resp.text = "hello, world!!"
