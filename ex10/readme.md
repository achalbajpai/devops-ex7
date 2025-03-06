# Exercise 10: Deploying a Website Using Ansible

## Overview
This exercise builds upon Exercise 9 by showing how to use Ansible to deploy a complete website. We'll not only install and configure Apache but also deploy actual web content.

## Prerequisites
1. Completion of Exercise 9 (understanding basic Ansible concepts)
2. A remote server (AWS EC2 instance)
3. SSH key pair for authentication
4. Basic understanding of HTML and web servers

## Files in this Directory

### 1. ansible_inventory
```ini
[web]
13.201.189.241 ansible_user=ec2-user ansible_ssh_private_key_file=/Users/achal/Downloads/ex9.pem ansible_python_interpreter=/usr/bin/python3.8
```

This inventory file is similar to Exercise 9's file. It contains:
- Server group definition (`[web]`)
- Server IP address
- Connection details (user, SSH key, Python interpreter)

### 2. index.html
```html
<!DOCTYPE html>
<html>
<head>
    <title>My Ansible Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            text-align: center;
            background-color: #f0f0f0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        h1 { color: #2c3e50; }
        p { color: #34495e; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to My Website!</h1>
        <p>Successfully deployed using Ansible automation.</p>
        <p>This demonstrates the power of Infrastructure as Code!</p>
    </div>
</body>
</html>
```

This is the actual web content we'll deploy. It includes:
- Basic HTML structure
- Embedded CSS for styling
- Responsive design elements
- Informative content about our deployment

### 3. deploy_website.yml
```yaml
---
- name: Deploy a Simple Website
  hosts: web
  become: yes
  tasks:
    - name: Install Apache
      command: yum install -y httpd
      args:
        creates: /usr/sbin/httpd

    - name: Start Apache service
      service:
        name: httpd
        state: started
        enabled: yes

    - name: Copy HTML file to server
      copy:
        src: index.html
        dest: /var/www/html/index.html
        mode: '0644'

    - name: Restart Apache to apply changes
      service:
        name: httpd
        state: restarted
```

This playbook is more advanced than Exercise 9's version:
- Installs Apache (httpd)
- Starts and enables the Apache service
- Copies our HTML file to the server
- Sets appropriate file permissions
- Restarts Apache to apply changes

## Step-by-Step Guide

1. **Prepare Your Files**
   - Ensure all files are in the same directory
   - Verify file permissions and content
   - Make sure paths in the inventory file are correct

2. **Test Connection**
   ```bash
   ansible all -i ansible_inventory -m ping
   ```
   This verifies your server is reachable.

3. **Run the Playbook**
   ```bash
   ansible-playbook -i ansible_inventory deploy_website.yml
   ```
   This will:
   - Install Apache if not present
   - Configure the service
   - Deploy your website

4. **Verify Deployment**
   - Open a web browser
   - Navigate to http://your-server-ip
   - You should see your styled website

## Understanding the Process

1. **Web Server Setup**
   - Apache is installed using yum (Amazon Linux 2's package manager)
   - The service is configured to start automatically
   - Proper permissions are set

2. **Content Deployment**
   - Your HTML file is copied to `/var/www/html/`
   - This is Apache's default web root directory
   - File permissions are set to 644 (readable by all, writable by owner)

3. **Service Management**
   - Apache is restarted to ensure it picks up new content
   - The service is enabled to start on boot

## Common Issues and Solutions

1. **Website Not Accessible**
   - Check EC2 security group allows port 80 (HTTP)
   - Verify Apache is running (`systemctl status httpd`)
   - Check file permissions in `/var/www/html/`

2. **Playbook Failures**
   - Ensure all paths in the playbook are correct
   - Verify the inventory file is properly formatted
   - Check for syntax errors in the YAML file

3. **Content Issues**
   - Verify the HTML file is properly formatted
   - Check file ownership and permissions
   - Look for errors in Apache's error log

## Expected Outcome
After successful execution:
1. Apache web server will be running
2. Your website will be accessible via HTTP
3. The content will be styled and responsive

## Testing and Verification
1. **Server Status**
   ```bash
   ssh -i your-key.pem ec2-user@your-ip
   systemctl status httpd
   ```

2. **Content Verification**
   ```bash
   curl http://localhost
   ```
   Should show your HTML content

3. **Browser Testing**
   - Open http://your-server-ip in different browsers
   - Check if styling is applied correctly
   - Verify all content is visible

## Next Steps
Consider enhancing your deployment by:
1. Adding more web pages
2. Implementing SSL/HTTPS
3. Adding server-side functionality
4. Setting up monitoring
5. Implementing backup procedures

