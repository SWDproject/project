#!/bin/bash

# This script allows the user to log in by checking the username and hashed password

USER_FILE="users.txt"

echo "  Login  "
read -p "Enter username: " username
read -s -p "Enter password: " password
echo

# Check if the users.txt exists
if [ ! -f "$USER_FILE" ]; then
  echo "No account found. Please create an account first."
  exit 1
fi

# Hash the entered password 
hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')

# Check if the combination exists in users.txt
if grep -q "^$username:$hashed_password$" "$USER_FILE"; then
  echo "Login successful"
else
  echo "Invalid username or password."
fi
