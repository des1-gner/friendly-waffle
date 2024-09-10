# Update the system
sudo yum update -y

# Install MySQL
sudo yum install mysql mysql-server -y

# Start MySQL service
sudo systemctl start mysqld

# Enable MySQL to start on boot
sudo systemctl enable mysqld

# Secure MySQL installation
sudo mysql_secure_installation

# Access MySQL (you'll be prompted for the password you set)
mysql -u root -p

# Create a new database (run this command inside MySQL shell)
CREATE DATABASE mydb;

# Exit MySQL shell
EXIT;

# (Optional) Allow remote connections by editing my.cnf
# sudo nano /etc/my.cnf
# Add under [mysqld]: bind-address = 0.0.0.0

# Restart MySQL after making changes
sudo systemctl restart mysqld