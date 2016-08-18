#!/bin/bash

o=$(grep -En ' (M|m)an( |;|:|\.|$)' $1 | grep -Ec "^[0-9]{3}:" | tr -d '\n')
c=1
while [  $c -lt 13  ]; do
    n=$(grep -En ' (M|m)an( |:|;|\.|$)' $1 | grep -Ec "^$c[0-9]{3}:" | tr -d '\n')
    o="$o,$n"
    let c=c+1
done
echo 'man <- c('$o')' > temp.R
echo 'png(filename = "figs/man.png", height = 300, width = 600, bg = "white")' >> temp.R
echo 'plot(man, type = "o", ann = FALSE)' >> temp.R
echo 'title(xlab = "Lines (000s)", ylab = "Appearances")' >> temp.R
echo 'dev.off()' >> temp.R
Rscript temp.R
rm temp.R
