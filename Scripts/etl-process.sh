#!/bin/bash

echo "==== Starting extraction process ===="
cd ..
echo "==== Making raw directory ===="
mkdir raw
echo "==== Starting curl process ===="
cd raw && { curl -O https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv ; cd -; }


echo "==== End of extraction process ===="



echo "==== Starting transformation process ===="
echo "==== End of transformation process ===="



echo "==== Starting load process ===="
echo "==== End of load process ===="