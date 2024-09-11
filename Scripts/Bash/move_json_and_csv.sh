# Define the source and destination directories
SOURCE_DIR="$HOME/CoreDataEngineers/LinuxGitAssignment/raw"
DEST_DIR="$HOME/CoreDataEngineers/LinuxGitAssignment/json_and_CSV"

# Check if the destination directory exists, if not, create it
if [ ! -d "$DEST_DIR" ]; then
  echo "Destination directory does not exist. Creating now."
  mkdir -p "$DEST_DIR"
fi

# Move CSV files
echo "Moving CSV files..."
mv "$SOURCE_DIR"/*.csv "$DEST_DIR" 2>/dev/null

# Move JSON files
echo "Moving JSON files..."
mv "$SOURCE_DIR"/*.json "$DEST_DIR" 2>/dev/null

# Check if there were any errors
if [ $? -eq 0 ]; then
  echo "Files moved successfully."
else
  echo "There was an error moving the files."
fi
