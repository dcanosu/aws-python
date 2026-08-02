#!/bin/bash
# cat /var/log/cloud-init-output.log

# 1. Update installed packages non-interactively
yum update -y

# 2. Install Python and Git
yum install -y python git

# 3. Navigate to workspace directory
cd /home/ec2-user

# 4. Clone your repository
git clone https://github.com/dcanosu/aws-python.git

# 5. Fix permissions so the default user owns the cloned files
chown -R ec2-user:ec2-user /home/ec2-user/aws-python
cd /home/ec2-user/aws-python

# 6. Create virtual environment and install packages as ec2-user
sudo -u ec2-user python -m venv .env

# 7. Upgrade pip and install packages DIRECTLY using the venv pip executable
sudo -u ec2-user ./.env/bin/pip install --upgrade pip
sudo -u ec2-user ./.env/bin/pip install -r requirements.txt

# 8. Start your Flask app in the background as ec2-user
sudo -u ec2-user nohup ./.env/bin/python app.py > /home/ec2-user/app.log 2>&1 &
