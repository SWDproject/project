#!/bin/bash

# This function creates a new user account by saving the hashed password in a separate file named after the username inside the 'users' directory.

create_account() {
  USERS_DIR="users"
  
  # Create 'users' directory if it doesn't exist
  mkdir -p "$USERS_DIR"
  
  echo "  Create New Account  "
  
  # Ask the user to enter a username and password
  read -p "Enter username: " username
  read -s -p "Enter password: " password
  echo
  
  USER_FILE="$USERS_DIR/$username.txt"
  

  # Check if the username already exists
  if [  -f "$USER_FILE" ]; then
    echo "Username already exists. Please choose another one."
    return 1
  fi

 
  # Hash the password using SHA-256
  hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')

  # Save the hashed password in the user's file
  echo "password:$hashed_password" > "$USER_FILE"
  echo "Account created successfully"
}

create_account
