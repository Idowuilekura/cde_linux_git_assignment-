**Parch and Posey**



**File Organizer Script**



A bash script that recursively searches through directories and organizes CSV and JSON files into a consolidated destination folder.



Recursive Search: Automatically explores all subdirectories

Multi-format Support: Handles both CSV and JSON files

Error Handling: Comprehensive validation and logging

Auto-directory Creation: Builds destination folder structure automatically

Cross-Platform: Works on Linux, WSL, and macOS environments



Quick Start



Prerequisites

\- Bash shell

\- Read/write permissions in target directories



Installation

```bash

\# Clone or download the script

git clone <your-repo-url>

cd file-organizer



\# Make the script executable

chmod +x organize-files.sh



Basic Usage

bash

./organize-files.sh

Directory Structure

text

assignment/

├── json\_and\_csv/                 # Created by script (destination)

]│   ├── data1.csv

│   ├── config.json

│   └── processed\_data.json

├── subfolder1/

│   ├── data.csv

│   └── config.json

├── subfolder2/

│   └── records.csv

└── organize-files.sh            # Main script

&nbsp;Configuration

Edit these variables in the script for customization:



bash

source\_dir="/mnt/c/Users/Kenechukwu/Documents/assignment"  # Source directory

destination\_dir="json\_and\_csv"                            # Destination folder

Usage Examples

Standard Execution

bash

./organize-files.sh



**Process Flow**

Initialization: Set source and destination paths

Directory Setup: Create destination folder if missing

Recursive Search: Enable deep directory traversal

File Processing: Move CSV files, then JSON files

Validation: Check file existence before moving

Logging: Report success/failure for each operatio

Error Handling

Validates file existence before moving operations

Provides clear success/failure messages

Handles permission issues gracefully



&nbsp;Output Example

bash

✅ Files successfully moved to folder

✅ Files successfully moved to folder

✅ Files successfully moved to folder

✅ All files moved successfully to json\_and\_csv/



To restore files to original locations:



bash

\# Check moved files

ls -la json\_and\_csv/



\# Restore to original location (example)

find json\_and\_csv/ -name "\*.csv" -exec mv {} /original/path/ \\;

Contributing

Fork the repository



Create a feature branch (git checkout -b feature/amazing-feature)



Commit changes (git commit -m 'Add amazing feature')



Push to branch (git push origin feature/amazing-feature)



Open a Pull Request



License

This project is licensed under the MIT License - see the LICENSE.md file for details.





