#!/bin/bash

#Print the first name of all the Tooks followed by their total contribution.
awk -F: '$1 ~ /Took/ {split($1, name, " "); total = $3 + $4 + $5; print name[1], total}' ./AwkLab.data

#Print the full names and contributions for anyone whose last contribution is between 10 and 200
awk -F: '$3 >= 10 && $3 <= 200 {split($1, name, " "); total = $3 + $4 + $5; print $1, total}' ./AwkLab.data

#Print the full names and average contribution of those whose initial average is less than 300
awk -F: '{average = ($3 + $4 + $5) / 3; if (average < 300) print $1, average}' ./AwkLab.data
