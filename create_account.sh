#!/bin/bash

# This script creates a new user account by saving the username and password to a text file

USER_FILE="users.txt"

echo "=== Create New Account ==="
read -p "Enter username: " username
read -s -p "Enter password: " password
echo

# Check if users.txt exists, if not create it
if [ ! -f "$USER_FILE" ]; then
  touch "$USER_FILE"
fi

# Check if the username already exists
if grep -q "^$username:" "$USER_FILE"; then
  echo "Username already exists. Please choose another one."
  exit 1
fi

# Save the username and password (in plain text)
echo "$username:$password" >> "$USER_FILE"
echo "Account created successfully!"

