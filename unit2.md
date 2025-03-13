# AWS & Bash Notes

## 1. Dynamic Configuration

### **EC2 Setup**
#### **Setting Up EC2 and Network Configuration**
1. **Launch EC2 instance** and connect via SSH.
2. Open terminal and edit network settings:
   ```bash
   sudo nano /etc/network/interfaces
   ```
3. Configure:
   - **IP address**
   - **Subnet mask**
   - **Gateway**
   - **DNS**
4. **Save and restart networking**:
   ```bash
   sudo systemctl restart networking
   ```

#### **Setting Up Hostname Resolution**
1. Open and edit the **hosts file**:
   ```bash
   sudo nano /etc/hosts
   ```
2. Add:
   ```
   192.168.1.100 myserver
   ```
3. Save the file.

#### **Verify Configuration**
- Test by running:
  ```bash
  ping myserver
  ```

#### **Auto-start Services**
- Enable a service to start on boot:
  ```bash
  sudo systemctl enable [service]
  ```
- Check status:
  ```bash
  sudo systemctl status [service]
  ```

#### **Restart System**
```bash
sudo reboot
```

---

## 2. Configure Apache Logs
1. **Connect to EC2**.
2. Navigate to the Apache config folder:
   ```bash
   cd /etc/httpd/conf/
   ```
3. Edit the Apache config file:
   ```bash
   sudo nano httpd.conf
   ```
4. Find the `<VirtualHost>` section and **uncomment** the custom log line:
   ```
   CustomLog /var/log/httpd/access.log combined
   ```
5. Save and **restart Apache**:
   ```bash
   sudo systemctl restart httpd
   ```

---

## 3. Bash Basics

### **Key Features of Bash**
1. Command-Line Interface (CLI)
2. Scripting
3. Variables
4. Control Structures
5. Functions

#### **Advantages:**
- Simple & easy to use
- Automates tasks

#### **Disadvantages:**
- Creates a new process for each shell
- Slower than compiled programs

---

## 4. How to Create a Bash Script
1. Create a `.sh` file:
   ```bash
   touch achal.sh
   ```
2. Write a simple script:
   ```bash
   echo "hi"
   ```
3. Give execution permissions:
   ```bash
   chmod +x achal.sh
   ```
4. Run the script:
   ```bash
   ./achal.sh
   ```

---

## 5. Useful Linux Commands
- **Navigation & File Management**  
  `ls`, `cd`, `pwd`, `cp`, `mv`, `rm`, `mkdir`, `rmdir`, `touch`, `cat`
- **Searching & Filtering**  
  `echo`, `grep` (find word), `find`
- **Permissions**  
  `chmod`, `chown`
- **Process Management**  
  `ps`, `kill`
- **Storage Management**  
  `df`, `du`
- **System Info**  
  `man`, `who`, `cal`, `clear`, `history`

---

## 6. Input/Output Redirection
| Symbol | Meaning |
|--------|---------|
| `>` | Redirect output to a file (overwrite) |
| `>>` | Append output to a file |
| `<` | Read input from a file |
| `|` | Pipe output to another command |
| `2>` | Redirect errors to a file |
| `&>` | Redirect both output and errors |

Example:
```bash
command > output.txt   # Save output to a file
command 2> error.txt   # Save errors to a file
command &> all_output.txt   # Save both
```

---

## 7. Bash Variables
- **User-defined variable:**
  ```bash
  my_Variable="value"
  echo $my_Variable
  ```
- **Positional parameters:** `$1, $2, $3`
- **Environment variable:** `$HOME`

---

## 8. Text Processing Tools
| Command | Purpose | Example |
|---------|---------|---------|
| `grep` | Search text | `grep "hello" file.txt` |
| `cut` | Extract specific parts | `cut -d ',' -f1,3 filename.csv` |
| `awk` | Advanced filtering | `awk -F',' '{print $1, $3}' data.csv` |

---

## 9. Crontab (Task Automation)
**Definition**: Automates tasks at specific times/intervals.

**Syntax:**
```
minute hour day month day_of_week command
```

**Example:** Run script on the 15th of every month at 4:15 AM:
```bash
15 4 15 * * /path/to/monthly_script.sh
```
---

```
