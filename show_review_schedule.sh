#!/bin/bash
show_review_schedule(){
echo "enter the subject name: "
read subject
file="review_${subject}.txt"
if [ ! -f "$file" ]; then
echo "No review schedule found for subject $subject "
return
fi
echo "review schedule for subject: $subject"
echo "-------------------------------------"
awk '
BEGIN { RS"---"; FS="\n" }
{
for (i=1; i<=NF; i++) {
print $1
}
print "-------------------------------------"
}
' "$file"
}
show_review_schedule
