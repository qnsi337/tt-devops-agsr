from flask import Flask

app = Flask(__name__)

def get_configmap_message():
    with open('conf/message.txt') as f:
        message = f.read()
    return message

@app.route('/message')
def get_message():
    message = get_configmap_message()
    return message if message else 'No message found in config'

@app.route('/health')
def health_check():
    return '200 Ok'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9091)