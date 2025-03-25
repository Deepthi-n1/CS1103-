#!/bin/bash
# Shell Script for Piping Commands
# Usage: ./piping_commands1.sh

# Function to display the contents of the current directory
list_directory_contents() {
    echo "Listing contents of the current directory:"
    ls -l
    echo ""
}

# Function to filter and sort directory contents
filter_and_sort_contents() {
    read -p "Enter a pattern to filter files (e.g., .txt for text files): " pattern
    echo "Filtering and sorting files with pattern '$pattern'..."
    # Use ls, grep, and sort in a pipeline
    ls -l | grep "$pattern" | sort
    echo ""
}

# Function to search for a specific file in the current directory
search_file() {
    read -p "Enter the name of the file to search for: " filename
    echo "Searching for file '$filename'..."
    # Use find command to search for the file
    result=$(find . -type f -name "$filename")
    if [[ -n $result ]]; then
        echo "File found:"
        echo "$result"
    else
        echo "File not found."
    fi
    echo ""
}

num_of_files_and_folders() {
    echo "Counting the number of files and folders in the current directory..."
    file_count=$(find . -type f | wc -l)
    folder_count=$(find . -type d | wc -l)

    echo "Number of files: $file_count"
    echo "Number of folders: $folder_count"
    echo ""
}
     
# Main menu for user interaction
echo "Piping Commands Manager"
echo "1. List contents of the current directory"
echo "2. Filter and sort directory contents"
echo "3. Search for a specific file"
echo "4. Count the number of files and folders"
echo "5. Exit"

# Loop until the user chooses to exit
while true; do
    read -p "Select an option (1-4): " option
    case $option in
        1) # List directory contents
            list_directory_contents
            ;;
        2) # Filter and sort directory contents
            filter_and_sort_contents
            ;;
        3) # Search for a specific file
            search_file
            ;;
        4) # Count the number of files and folders
            num_of_files_and_folders
            ;;
        5) # Exit the script
            echo "Exiting the Piping Commands Manager. Goodbye!"
            exit 0
            ;;
        *) # Invalid option
            echo "Invalid option. Please select 1-4."
            ;;
    esac
    echo "" 
done
