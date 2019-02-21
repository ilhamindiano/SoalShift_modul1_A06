#!/bin/bash

for i in *.jpg
do
 base64 -d $i | xxd -r > hex/$i
done
