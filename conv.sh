#!/bin/bash

if [[ "$DOCVERTER_API_URL" == "" ]]; then
    export DOCVERTER_API_URL=http://c.docverter.com/convert
fi

curl --form from=markdown \
     --form to=$1 \
     --form smart=true \
     --form input_files[]=@$2 \
     $DOCVERTER_API_URL > $3

echo $3
