#!/bin/bash

# This function verifies user login by checking the username and matchig the hashed password stored in a separate file created for eche user inside the 'users' directory.

login() {
  USERS_DIR="users"

  echo "  Login  "
  
  # Ask the user to enter a username and password
  read -p "Enter username: " username
  read -s -p "Enter password: " password
  echo
  
  USER_FILE="$USERS_DIR/$username.txt"

  # Check if the user file exists (i.e. account exists)
  if [ ! -f "$USER_FILE" ]; then
    echo "No account found. Please create an account first."
    return 1
  fi

  # Hash the entered password 
  hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')
  
  # Extract the stored hashed password from the user file
  stored_password=$(grep "^password:" "$USER_FILE" | cut -d':' -f2)
  
  # Compare the stored hashed password from the user file 
  if [ "$hashed_password" == "$stored_password" ]; then
    echo "Login successful"
  else
    echo "Invalid username or password."
  fi
}


