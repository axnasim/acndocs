import os

def remove_whitespace_from_names(directory):
    # Traverse through the given directory
    for root, dirs, files in os.walk(directory):
        # Remove whitespace from directory names
        for dir_name in dirs:
            new_dir_name = dir_name.replace(' ', '_')
            if new_dir_name != dir_name:
                os.rename(os.path.join(root, dir_name), os.path.join(root, new_dir_name))
        
        # Remove whitespace from file names
        for file_name in files:
            new_file_name = file_name.replace(' ', '_')
            if new_file_name != file_name:
                os.rename(os.path.join(root, file_name), os.path.join(root, new_file_name))

# Set the current directory as the starting point
current_directory = os.getcwd()
remove_whitespace_from_names(current_directory)
print("Whitespaces have been removed from filenames and directory names.")
