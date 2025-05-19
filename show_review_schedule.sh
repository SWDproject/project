#!/bin/bash
# Define a function to show the review schedule for a subject
show_review_schedule(){
  # Prompt the user to enter the subject name
  echo "enter the subject name: "

  # Read the input and store it in the variable 'subject'
  read subject
  # Create the file name using the subject, e.g., review_math.txt
  file="review_${subject}.txt"
  # Check if the file does not exist
  if [ ! -f "$file" ]; then
    # Print an error message if the file is not found
    echo "No review schedule found for subject $subject"
    return
  fi
  # Print the header for the review schedule
  echo "review schedule for subject: $subject"
  echo "--------------------------------------"
  # Use awk to print the content of the file with formatting
  awk '
  BEGIN { 
    RS="";    # Set record separator to an empty line (paragraph mode)
    FS="\n"   # Set field separator to newline (each line is a field)
  }
  {
    # Loop through each line in the paragraph
    for (i=1; i<=NF; i++) {
      print $i  # Print the current line
    }
    # Print a separator line after each paragraph
    print "--------------------------------------"
  }
  ' "$file"  # Pass the file to awk for processing
}

