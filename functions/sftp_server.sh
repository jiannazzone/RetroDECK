#!/bin/bash

port=22
ip=$(hostname -I | awk '{print $1}')

# Check if the port is in use
if nc -z localhost $port; then
    zenity --error --no-wrap \
        --window-icon="/app/share/icons/hicolor/scalable/apps/net.retrodeck.retrodeck.svg" \
        --title "RetroDECK - SFTP Server" \
        --text="Port $port is already in use. Please stop any services on that port and try again."
    exit 1
fi

# Create a temporary directory for SFTP chroot
mkdir -p /tmp/sftp_home/retrodeck
echo "retrodeck:$(openssl passwd -1 retrodeck)" >> /tmp/sftp_home/retrodeck/etc/passwd

# Set rdhome as the home directory for retrodeck user
echo "Match User retrodeck\n    ChrootDirectory $rdhome" >> /etc/ssh/sshd_config

# Restart SSHD to apply the new configuration
service ssh restart

# Start SSHD with SFTP support and specific user and password
nohup /usr/sbin/sshd -p $port -o PasswordAuthentication=yes -o PubkeyAuthentication=no -o AuthorizedKeysFile=/dev/null -o UsePAM=no -o AllowTcpForwarding=no -o PermitRootLogin=no -o ChrootDirectory=/tmp/sftp_home/retrodeck &

# Get the PID of the SSH/SFTP server process
ssh_pid=$!

# Function to stop the SSH/SFTP server
stop_ssh_server() {
    kill -9 $ssh_pid
    rm -rf /tmp/sftp_home
    exit 0
}

# Create a Zenity window with only the "Stop" button
zenity --icon-name=net.retrodeck.retrodeck --info --no-wrap \
      --window-icon="/app/share/icons/hicolor/scalable/apps/net.retrodeck.retrodeck.svg" \
      --title "RetroDECK - SFTP Server" \
      --text="SFTP server started.\n\nAddress: $ip\nport: $port\nID:\tretrodeck\nPassword:\tretrodeck\npointing to:\n$rdhome\n\nPress Stop to terminate the server." --ok-label="Stop" || stop_ssh_server

# If the user clicks "Stop", call the function to stop the SSH/SFTP server
stop_ssh_server
