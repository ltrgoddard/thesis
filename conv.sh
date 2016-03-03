#!/bin/bash

if [[ "$DOCVERTER_API_URL" == "" ]]; then
    export DOCVERTER_API_URL=http://c.docverter.com/convert
fi

curl --form from=markdown \
     --form to=$2 \
     --form test_mode=true \
     --form input_files[]=@$3 \
     $DOCVERTER_API_URL > $3

echo $3
