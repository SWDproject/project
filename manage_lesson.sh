#!/bin/bash

manage_lesson() {
    echo "Enter subject name:"
    read subject
    file="review_${subject}.txt"

    # Check if the file exists
    if [ ! -f "$file" ]; then
        echo "No lessons found for this subject."
        return
    fi

    echo "Enter lesson title:"
    read lesson

    # Check if the lesson exists
    if ! grep -q "Lesson: $lesson" "$file"; then
        echo "Lesson not found."
        return
    fi

    echo "What do you want to do?"
    echo "1. Mark as completed"
    echo "2. Delete lesson"
    read choice

    # If user chooses to mark as completed
    if [ "$choice" = "1" ]; then
        # Replace "Status: pending" with "Status: completed" for the matching lesson
        sed -i "/Lesson: $lesson/,/---/s/Status: pending/Status: completed/" "$file"
        echo "Lesson marked as completed."

    # If user chooses to delete the lesson
    elif [ "$choice" = "2" ]; then
        # Delete the lines from the lesson title until the separator line (---)
        sed -i "/Lesson: $lesson/,/---/d" "$file"
        echo "Lesson deleted."

    # If user enters something else
    else
        echo "Invalid choice."
    fi
}

manage_lesson
