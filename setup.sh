#!/bin/bash
set -e

ROOT_PATH=~
BUILD_PATH=group_project
VENV=code_clinic
filename=make_a_booking.py
help_file=help.txt
calendar_file=view_calender.py
book_slot=update_event.py


cd $BUILD_PATH

if [ -d "$VENV" ] 
then
    echo 
else
    python3 -m venv $VENV
fi

source $VENV/bin/activate

if pip search google-api-python-client --quiet
then
	echo 
else
	pip install google-api-python-client --quiet
fi

file=$(find ~ -name "credentials.json")

if [ -f "credentials.json" ] 
then
    echo  
else
    cp $file ~/$BUILD_PATH
fi

if [[ -f "$filename" && -f "start.py" && -f "$book_slot" && -f "$calendar_file" ]] 
then
    echo "Files exists." 
else
    echo "Error: $filename does not exists."
    echo "Fetching $filename"
    cd ; cd Group_16_code_clinic_booking_system
    cp $filename ~/$BUILD_PATH
    cp $calendar_file ~/$BUILD_PATH
    cp $book_slot ~/$BUILD_PATH
    cp start.py ~/$BUILD_PATH
    echo "Fetched files"
    cd ; cd $BUILD_PATH
fi

if pip search $pkg --quiet
then
    echo "$pkg installed"
else
    echo "$pkg NOT installed"
    pip install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib --quiet
    echo done
fi
clear
