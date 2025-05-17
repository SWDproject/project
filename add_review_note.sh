#!/bin/bash
add_review_note() {
  echo "  Add Note After Review  "
  # Prompt user for the subject name
  echo -n "Enter subject name: "
  read subject
  
  # Prompt for the lesson title
  echo -n "Enter lesson title: "
  read lesson
  
  #Prompt for which review this note applies to (1-5 or general)
  echo -n "Which review is this? (1-5 or general): "
  read review_num
  
  #Prompt for the note content
  echo -n "Enter your note: "
  read note

  #Build the file name based on the subject
  FILE="review_${subject}.txt"
  
  #Check if the review file exists
  if [ ! -f "$FILE" ]; then
    echo "No review file found for this subject."
    return 1
  fi
  
  #Verify that the lesson exists in the file
  if ! grep -q "$lesson" "$FILE"; then
    echo "Lesson not found."
    return 1
  fi
  
  #Define the note label depending on the review number
  if [ "$review_num" = "general" ]; then
    note_label="General Note"
    return 0
  else
    note_label="Review ${review_num}  Note"
    return 1
  fi

  #Insert the note before the separator line (---) in the lesson block
  awk -v lesson="$lesson" -v label="$note_label" -v note="$note" '
  BEGIN {found=0}
  {
    print $0
    if ($0 ~ lesson && found==0) {
      found=1
    } else if (found==1 && $0 ~ /^---$/) {
      print label ": " note
      found=0
    }
  }' "$FILE" > temp && mv temp "$FILE"

  echo "Note added Successfully."
}
  
