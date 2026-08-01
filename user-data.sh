#!/bin/bash
# 1. Update installed packages non-interactively
yum update -y

# 2. Install Python 3 and Git
yum install -y python3 git

# 3. Navigate to workspace directory
cd /home/ec2-user

# 4. Clone your repository
git clone https://github.com/dcanosu/aws-python.git

# 5. Fix permissions so the default user owns the cloned files
chown -R ec2-user:ec2-user /home/ec2-user/aws-python
cd /home/ec2-user/aws-python

# 6. Create virtual environment and install packages as ec2-user
sudo -u ec2-user python3 -m venv .env
sudo -u ec2-user ./.env/bin/pip install --upgrade pip
sudo -u ec2-user ./.env/bin/pip install -r requirements.txt
