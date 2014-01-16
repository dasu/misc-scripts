#!/bin/bash
#I honestly don't know what this does anymore.  Find...empty folders?
res=`echo -n "$1"|sed 's/^\.\///'`
echo -e \\n
i="0"
folder=`echo -n "$res"|sed 's/^.*\///'`
TABS=`echo -n "$res"|awk -F/ '{ print NF -1}'`
#TABS=`echo $TABS|sed 's/ .*//g'`
#echo $res $TABS
#echo $TABS
if [ $TABS -gt 0 ]
then
        while [ $i -lt $TABS ]
        do
                echo -n -e \\t
                i=$(( $i + 1 ))
        done
        echo -n $folder
else
        echo $folder
fi
