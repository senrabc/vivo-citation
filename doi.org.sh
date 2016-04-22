#!/bin/bash

url="dx.doi.org/"
for i in $(cat vivo-doi.txt); do
    sleep .5
    content="$(curl -LH "Accept: text/bibliography; style=apa" "$url/$i" || true)"
    echo "*********************************************************************"
    echo "$content"
    echo "*********************************************************************"
     # add logic here to catch exceptions to return from curl
    if  grep '<html>' $content 1> /dev/null; then
	echo "this doi has an error: $i" >> exception_log.txt 
    else
    	echo "$content" >> apa-output.txt
    fi
done
