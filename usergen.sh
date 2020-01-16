#!/bin/bash

# Generator function
generator () {
    # Create user account
    echo "Creating user $1..."
    
    # Generate password for user
    PASSWORD="os"
    PASSWORD+="$1"
    ENCRYPTED_PWD=$(perl -e 'print crypt($ARGV[0], "password")' $PASSWORD)
    
    # Add user with given user name
    useradd -m -p "$ENCRYPTED_PWD" "$1"
    
    # Create .ssh directory
    mkdir "/home/$1/.ssh"
    chown "$1" "/home/$1/.ssh"
    chmod 700 "/home/$1/.ssh"
    
    # Generate key pair for user
    echo "Start generating $1 key pair..."
    ssh-keygen -b 4096 -N "" -f "$1" -t rsa > "$1.info"
    mv "$1" keypairs/"$1.pem"
    mv "$1.pub" keypairs/"$1.pub"
    mv "$1.info" keypairs/"$1.info"
    echo "$1 key pair is generated."
    
    # Copy public key to user's home directory
    cp "keypairs/$1.pub" "/home/$1/.ssh/authorized_keys"
    chown "$1" "/home/$1/.ssh/authorized_keys"
    chmod 600 "/home/$1/.ssh/authorized_keys"
    echo "$1's public key is copied."

}

echo "Start generating users..."

USER_NAME="group"

for i in {1..40}
do
    if [ "$i" -le 9 ];then
        USER_NAME+="0$i"
        generator "$USER_NAME"
        echo "$USER_NAME is all set!"
    else
        USER_NAME+="$i"
        generator "$USER_NAME"
        echo "$USER_NAME is all set!"
    fi
USER_NAME="group"
done
