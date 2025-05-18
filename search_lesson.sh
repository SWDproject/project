#!/bin/bash

# Function to search lessons
search_lesson() {

  # Ask the user to enter the subject name
  echo "Enter subject name:"
  read subject
  file="review_${subject}.txt"  # File name based on subject

  # Check if the file exists
  if [ ! -f "$file" ]; then
    echo "No lessons found for this subject."
    return
  fi

  # Ask the user to enter the lesson title
  echo "Enter lesson title:"
  read lesson

  # Check if the lesson exists in the file
  if ! grep -q "Lesson: $lesson" "$file"; then
    echo "Lesson not found."
    return
  fi

  # Ask the user to enter a keyword or question to search for
  read -p "Enter keyword or question to search: " keyword 

  # Use grep to search for the keyword in the lesson file (case-insensitive search)
  matches=$(grep -i "$keyword" "$file")

  # If no matches are found, inform the user
  if [ -z "$matches" ]; then
    echo "No lessons found containing \"$keyword\"."  # If no matches are found
  else
    # If matches are found, display them
    echo "Lessons matching \"$keyword\":"
    echo "$matches"  # Show the matched lessons
  fi
}


