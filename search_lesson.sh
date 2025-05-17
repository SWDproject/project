#!/bin/bash

# Function to search lessons
search_lesson() {

  # Define the path to the user's lessons file
  lesson_file="$HOME/Desktop/workspace/project/review_SWDT.txt"

  # Check if the lessons file exists and has content
  if [ ! -f "$lesson_file" ] || [ $(wc -l < "$lesson_file") -eq 0 ]; then
    echo "You have no lessons saved."  # If the file doesn't exist or is empty
    return
  fi

  # Ask the user to enter a keyword or question to search for
  read -p "Enter keyword or question to search: " keyword 
  

  # Use grep to search for the keyword in the lessons file (case-insensitive search)
  matches=$(grep -i "$keyword" "$lesson_file")

  # If no matches are found, inform the user
  if [ "$matches" = "" ]; then
    echo "No lessons found containing \"$keyword\"."  # If no matches are found
  else
    # If matches are found, display them
    echo "Lessons matching \"$keyword\":"
    echo "$matches"  # Show the matched lessons
  fi
}


