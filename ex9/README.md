# Exercise 9: Setting Up and Running Ansible Playbook

## Overview
This exercise demonstrates how to use Ansible to automate server configuration. We'll install and configure Apache web server on a remote machine using Ansible.

## Prerequisites
1. A Unix-like operating system (macOS, Linux, etc.)
2. Access to a remote server (in this case, an AWS EC2 instance)
3. SSH key pair for authentication
4. Basic understanding of command line operations

## Files in this Directory

### 1. ansible_inventory
```ini
[web]
13.201.189.241 ansible_user=ec2-user ansible_ssh_private_key_file=/Users/achal/Downloads/ex9.pem ansible_python_interpreter=/usr/bin/python3.8
```

This file tells Ansible about your remote servers. Let's break down each part:
- `[web]`: This is a group name. You can group multiple servers under different names
- `13.201.189.241`: The IP address of your remote server
- `ansible_user=ec2-user`: The username to use when connecting
- `ansible_ssh_private_key_file=...`: Path to your SSH key file
- `ansible_python_interpreter=...`: Path to Python on the remote server

### 2. basic_playbook.yml
```yaml
---
- name: Basic Ansible Playbook
  hosts: web
  become: yes
  tasks:
     - name: Install Apache
       command: yum install -y httpd
       args:
          creates: /usr/sbin/httpd

     - name: Start Apache service
       command: systemctl start httpd

     - name: Enable Apache service
       command: systemctl enable httpd
```

This is your Ansible playbook. Let's understand each section:
- `name`: A description of what this playbook does
- `hosts: web`: Specifies which servers to run on (matches the group in inventory)
- `become: yes`: Tells Ansible to use sudo privileges
- `tasks`: List of actions to perform
  - First task installs Apache (httpd)
  - Second task starts the Apache service
  - Third task enables Apache to start on boot

## Step-by-Step Guide

1. **Install Ansible**
   ```bash
   # On macOS
   brew install ansible

   # On Ubuntu/Debian
   sudo apt update && sudo apt install ansible -y

   # Verify installation
   ansible --version
   ```

2. **Verify Inventory File**
   - Make sure your inventory file has the correct:
     - IP address of your server
     - Path to your .pem file
     - Username (ec2-user for Amazon Linux)

3. **Test Connection**
   ```bash
   ansible all -i ansible_inventory -m ping
   ```
   You should see a "pong" response if successful.

4. **Run the Playbook**
   ```bash
   ansible-playbook -i ansible_inventory basic_playbook.yml
   ```

5. **Verify Installation**
   ```bash
   # SSH into your server and check Apache status
   ssh -i /path/to/your.pem ec2-user@your-ip-address
   systemctl status httpd
   ```

## Common Issues and Solutions

1. **Connection Failures**
   - Check if your .pem file has correct permissions (chmod 400)
   - Verify your security group allows SSH (port 22)
   - Ensure the IP address is correct

2. **Python Issues**
   - If you see Python-related errors, verify the python interpreter path
   - You might need to install Python on the remote server

3. **Permission Issues**
   - Make sure 'become: yes' is in your playbook for tasks requiring sudo
   - Verify your user has sudo privileges on the remote server

## Expected Outcome
After successful execution:
1. Apache will be installed on your remote server
2. The service will be running
3. Apache will be configured to start automatically on server reboot

## Testing Success
You can verify success by:
1. Checking Apache status on the remote server
2. Opening http://your-server-ip in a web browser
3. Checking the service is enabled for automatic startup 