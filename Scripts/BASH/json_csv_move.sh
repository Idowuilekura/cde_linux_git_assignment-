source_dir="/mnt/c/Users/Kenechukwu/Documents/assignment"
destination_dir="json_and_csv"

##  Create the json_csv_directory in my assignment folder
mkdir -p json_and_csv

## Enable recursive search because my csv files are in subfolders inside my directory
shopt -s globstar

##Move CSV files to folder
for file in "$source_dir"/**/*.csv;do
    if [ -f "$file" ];then
        mv "$file" "$destination_dir/"
        echo "Files successfully moved to folder"
    else
        echo "File movement failed"    
    fi 
done       

##Move JSON files
for file in "$source_dir"/**/*.json;do
    if [ -f "$file" ];then
        mv "$file" "$destination_dir/"
        echo "Files successfully moved to folder"
    else
        echo "File movement failed"    
    fi 
done       
echo "All files moved successfully to $destination_dir/"


