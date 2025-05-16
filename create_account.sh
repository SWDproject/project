#!/bin/bash

# This script creates a new user account and stores the username with a hashed password

USER_FILE="users.txt"

echo "  Create New Account  "
read -p "Enter username: " username
read -s -p "Enter password: " password
echo

# Check if the users.txt exists, if not create it
if [ ! -f "$USER_FILE" ]; then
  touch "$USER_FILE"
fi

# Check if the username already exists
if grep -q "^$username:" "$USER_FILE"; then
  echo "Username already exists. Please choose another one."
  exit 1
fi

# Hash the password using SHA-256
hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')

# Save the username and hashed password
echo "$username:$hashed_password" >> "$USER_FILE"
echo "Account created successfully"

