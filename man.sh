#!/bin/bash

printf 'man <- c('
grep -En ' (M|m)an( |\. |$)' $1 | grep -Ec "^[0-9]{3}:" | tr -d '\n'
COUNTER=1
while [  $COUNTER -lt 13  ]; do
    printf ","
    grep -En ' (M|m)an( |\. |$)' $1 | grep -Ec "^$COUNTER[0-9]{3}:" | tr -d '\n'
    let COUNTER=COUNTER+1
done
printf ")\n"
