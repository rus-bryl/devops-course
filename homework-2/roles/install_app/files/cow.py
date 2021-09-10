from flask import Flask, request
from emoji import emojize
app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def result():
    if request.method == 'POST':
        request_data = request.get_json(force=True)
        animal = request_data['animal']
        sound = request_data['sound']
        count = request_data['count']
        return (emojize(":" + animal + ":") + "     " + animal + " says " + sound + "\n") * count
    if request.method == 'GET':
        return "Hi there!"

if __name__ == '__main__':
    app.run(debug=True)
