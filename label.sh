#!/bin/bash

while getopts s:d:l:f:b: flag
do
    case "${flag}" in
        s) srcip=${OPTARG};;
        d) dstip=${OPTARG};;
        l) label=${OPTARG};;
        f) filename=${OPTARG};;
	b) bi=${OPTARG};;
    esac
done
#echo "Source IP: $srcip";
#echo "Destination IP: $dstip";
#echo "Label: $label";
#echo "filename: $filename";
#echo "bi: $bi";

awk 'BEGIN{OFS=FS=","} {if ($1  == "'"$srcip"'" && $3 == "'"$dstip"'") sub($76,"'"$label"'"); print $0; }' $filename > tmp.csv
mv -f tmp.csv $filename
if [ "$bi" == "true" ]; then
	#echo "yes bi"
	awk 'BEGIN{OFS=FS=","} {if ($1  == "'"$dstip"'" && $3 == "'"$srcip"'") sub($76,"'"$label"'"); print $0; }' $filename > tmp.csv
	mv -f tmp.csv $filename 
fi