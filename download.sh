#!/usr/bin/env bash
#
# Download images

# Config - global
DIR_SCRIPT=$( dirname $0 )
source "$DIR_SCRIPT/config.sh"

# Create dirs if required
[ ! -d $DIR_ORIG_1024 ] && mkdir -p $DIR_ORIG_1024
[ ! -d $DIR_ORIG_250 ] && mkdir -p $DIR_ORIG_250
[ ! -d $DIR_ORIG_150 ] && mkdir -p $DIR_ORIG_150

# Check arguments
if [ -z $1 ]
then
    echo "Usage: ./$( basename $0 ) hashes.txt"
    exit 1
fi

# Go!
# File in $1 is a list of hashes separated by newline
cat $1 | while read line
do
    HASH=$line
    DIR=${line:0:3}

    URL_1024="http://im9.cz/iR/importprodukt-orig/$DIR/$HASH.jpg"
    URL_250="http://im9.cz/iR/importprodukt-orig/$DIR/$HASH--mmf250x250.jpg"
    URL_150="http://im9.cz/iR/importprodukt-orig/$DIR/$HASH--mmf150x150.jpg"

    curl "$URL_1024" -o "$DIR_ORIG_1024/$HASH.jpg"
    curl "$URL_250" -o "$DIR_ORIG_250/$HASH.jpg"
    curl "$URL_150" -o "$DIR_ORIG_150/$HASH.jpg"
done
