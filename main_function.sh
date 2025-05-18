#!/bin/bash

# Source individual function files to load their definitions
source ./create_account.sh
source ./login.sh
source ./calculate_review_schedule.sh
source ./manage_lesson.sh
source ./show_review_schedule.sh
source ./add_review_note.sh
source ./search_lesson.sh

# Variable to hold the currently logged-in user
current_user=""

# Main menu function
main_menu() {
  while true; do
    echo ""
    echo "==== Main Menu ===="

    # If no user is logged in, show limited options
    if [ -z "$current_user" ]; then
      echo "1) Create Account"
      echo "2) Login"
      echo "-1) Exit"
      echo "===================="
      echo -n "Choose an option: "
      read choice

      # Handle user choice before login
      case $choice in
        1) 
          create_account  # Call function to create a new account
          ;;
        2) 
          login          # Call login function
          if [ $? -eq 0 ]; then
            current_user="some_user"  # Set current_user after successful login (can be updated later)
            echo "Welcome! Please choose an option from the menu below."
          else
            echo 
          fi
          ;;
        -1) 
          echo "Exiting..." 
          exit 0          # Exit program normally
          ;;
        *) 
          echo "Invalid choice."  # Handle invalid input
          ;;
      esac

    else
      # If user is logged in, show full menu options logically ordered
      echo "1) Calculate Review Schedule"   # Calculate review schedule
      echo "2) Manage Lesson"               # Manage lessons (edit/delete)
      echo "3) Add Review Note"             # Add new review notes
      echo "4) View Review Schedule"        # Show current review schedule
      echo "5) Search Lesson"               # Search for lessons
      echo "6) Log Out"                    # Log out current user
      echo "===================="
      echo -n "Choose an option: "
      read choice

      # Handle user choice after login
      case $choice in
        1) 
          calculate_review_schedule  # Call schedule calculation function
          ;;
        2) 
          manage_lesson              # Call lesson management function
          ;;
        3) 
          add_review_note            # Call function to add review note
          ;;
        4) 
          show_review_schedule       # Call function to display review schedule
          ;;
        5) 
          search_lesson              # Call lesson search function
          ;;
        6) 
          current_user=""            # Clear current user to log out
          echo "Logged out."
          ;;
        *) 
          echo "Invalid choice."     # Handle invalid input
          ;;
      esac
    fi
  done
}

# Start the main menu loop
main_menu
