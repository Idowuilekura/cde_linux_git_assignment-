#!/bin/bash

# automatically export all variables
set -a
source .env
set +a

echo $RAW_FOLDER
echo $GOLD_FOLDER
echo $TRANSFORMED_FOLDER
echo $REMOTE_FILE
echo $DOWNLOADED_FILE
echo $TRANSFORMED_FILE

echo "checking if folder for raw files exist"
if [ -d "$RAW_FOLDER" ]; then
    echo "Folder exists, removing..."
    rm -rf "$RAW_FOLDER"
    echo "folder removed"
else
    echo "folder does not exist"
fi

echo "create a folder named, 'raw' "
mkdir $RAW_FOLDER && cd $RAW_FOLDER

#---data extraction
echo "Downloading to $RAW_FOLDER ..."
curl --ssl-no-revoke -fSL -o $DOWNLOADED_FILE $REMOTE_FILE

echo "checking the downloaded CSVs actually exist"
if ls *.csv 1> /dev/null 2>&1; then
    echo "CSV file exists."
    echo "file downloaded into the raw folder"
else
    echo "No CSV file found $RAW_FOLDER"
    set -e   # stop the script immediately if any command fails
fi

#----transformation
echo "checking if $TRANSFORMED_FOLDER exists"
if [ -d "$TRANSFORMED_FOLDER" ]; then
    echo "Folder exists, removing..."
    rm -rf "$TRANSFORMED_FOLDER"
    echo "$TRANSFORMED_FOLDER Existing folder removed"
else
    echo "$TRANSFORMED_FOLDER folder does not exist"
fi

echo "create a folder named, $TRANSFORMED_FOLDER"
cd .. && mkdir $TRANSFORMED_FOLDER

pip install csvkit

echo "filter columns and save the result as output.csv into TRANSFORMED folder"
csvcut -c Year,Value,Units,Variable_code $RAW_FOLDER/$DOWNLOADED_FILE > $TRANSFORMED_FOLDER/$TRANSFORMED_FILE

#----load
echo "checking if $GOLD_FOLDER exists"
if [ -d "$GOLD_FOLDER" ]; then
    echo "$GOLD_FOLDER Folder exists, removing..."
    rm -rf "$GOLD_FOLDER"
    echo "$GOLD_FOLDER folder removed"
else
    echo "$GOLD_FOLDER folder does not exist"
    echo "create a folder named, $GOLD_FOLDER"
    mkdir $GOLD_FOLDER
fi

echo "creating $GOLD_FOLDER folder"
mkdir $GOLD_FOLDER
echo "Moving processed file from TRANSFORMED folder to Gold folder"
mv $TRANSFORMED_FOLDER/$TRANSFORMED_FILE $GOLD_FOLDER

echo "checking if file exists in the $GOLD_FOLDER folder"
cd $GOLD_FOLDER
if ls *.csv 1> /dev/null 2>&1; then
    echo "CSV file exists."
else
    echo "No CSV file found $GOLD_FOLDER"
    set -e   # stop the script immediately if any command fails
fi