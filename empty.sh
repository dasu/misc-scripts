#echo "path/to/folder"|awk -f/ '{ print NF -1}'

find . -exec bash ~/trans.sh '{}' \;
