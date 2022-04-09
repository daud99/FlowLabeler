#!/bin/bash

while getopts s:d:l:f: flag
do
    case "${flag}" in
        s) srcip=${OPTARG};;
        d) dstip=${OPTARG};;
        l) label=${OPTARG};;
        f) filename=${OPTARG};;
    esac
done
#echo "Source IP: $srcip";
#echo "Destination IP: $dstip";
#echo "Label: $label";
#echo "filename: $filename";

awk 'BEGIN{OFS=FS=","} {if ($1  == "'"$srcip"'" && $3 == "'"$dstip"'") sub($76,"'"$label"'"); print $0; }' $filename > tmp.csv
mv -f tmp.csv $filename
