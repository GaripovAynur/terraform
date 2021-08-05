#!/bin/bash
now=$(date +"%m-%d-%y")
 git add .
 git commit -am "$now"
 git push
