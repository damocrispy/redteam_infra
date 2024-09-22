#!/bin/bash
sudo apt update -y
sudo apt install -y python3 python3-pip python3-venv make

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

# Install Mythic
# Copied from here: https://medium.com/@jacobdiamond/command-control-infrastructure-using-aws-cloudflare-and-mythic-part-1-d9b02354f7b2
cd /home/ubuntu
git clone https://github.com/its-a-feature/Mythic.git
cd Mythic
sudo ./install_docker_ubuntu.sh
sudo make 
sudo -E ./mythic-cli install github https://github.com/MythicAgents/Apollo.git
sudo -E ./mythic-cli install github https://github.com/MythicC2Profiles/http.git
sudo ./mythic-cli start
