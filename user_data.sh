#!/bin/bash
apt update -y
apt install -y python3 python3-pip python3-venv

cat <<EOT > /home/ubuntu/health_check.py
from flask import Flask

app = Flask(__name__)

@app.route('/health')
def health_check():
    return "OK", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
EOT

python3 -m venv venv
source venv/bin/activate

pip3 install flask
nohup python3 /home/ubuntu/health_check.py &

# Start server on reboot
(crontab -l 2>/dev/null; echo "@reboot nohup python3 /home/ubuntu/health_check.py &") | crontab -