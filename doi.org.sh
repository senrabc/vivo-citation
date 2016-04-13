#!/bin/bash

url="dx.doi.org/"
for i in $(cat vivo-doi.txt); do
    sleep .5
    content="$(curl -LH "Accept: text/bibliography; style=apa" "$url/$i")"
    echo "$content" >> apa-output.txt
done