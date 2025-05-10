#!/bin/bash

calculate_review_schedule() {
    # Ask the user for the subject name
    echo "Enter the subject name:"
    read subject
    file="review_${subject}.txt"  # Set the file name based on the subject

    # Ask the user for the lecture date
    echo "Enter the date of the lecture (yyyy-mm-dd):"
    read lecture_date  # The lecture date entered by the user

    # Define the intervals for spaced repetition
    interval1="1 day"  # Review 1 day after the lecture
    interval2="3 days" # Review 3 days after the lecture
    interval3="7 days" # Review 7 days after the lecture
    interval4="14 days" # Review 14 days after the lecture
    interval5="30 days" # Review 30 days after the lecture

    # Convert the lecture date to a timestamp for easy calculation
    lecture_timestamp=$(date -d "$lecture_date" +%s)

    # Calculate the review dates based on the defined intervals
    review1_date=$(date -d "@$(($lecture_timestamp + 86400))" +%Y-%m-%d)  # 1 day after the lecture
    review2_date=$(date -d "@$(($lecture_timestamp + 259200))" +%Y-%m-%d)  # 3 days after the lecture
    review3_date=$(date -d "@$(($lecture_timestamp + 604800))" +%Y-%m-%d)  # 7 days after the lecture
    review4_date=$(date -d "@$(($lecture_timestamp + 1209600))" +%Y-%m-%d) # 14 days after the lecture
    review5_date=$(date -d "@$(($lecture_timestamp + 2592000))" +%Y-%m-%d) # 30 days after the lecture

    # If the file doesn't exist, create it and add an initial message
    if [ ! -f "$file" ]; then
        echo "No existing lessons found for $subject. Creating new file." > "$file"
    fi

    # Append the review schedule to the subject's file
    echo "Review Schedule for $lecture_date:" >> "$file"
    echo "1. $review1_date" >> "$file"
    echo "2. $review2_date" >> "$file"
    echo "3. $review3_date" >> "$file"
    echo "4. $review4_date" >> "$file"
    echo "5. $review5_date" >> "$file"

    # Inform the user that the schedule has been added to the file
    echo "Review schedule for $subject has been added to '$file'."
}
