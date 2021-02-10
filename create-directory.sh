#!/bin/bash


echo welcome to the community bro!

mkdir -p /home/bob/countries/USA && cd /countries/USA && touch capital.txt && echo "Washington, D.C" > capital.txt
mkdir -p /home/bob/countries/UK  &&  cd /countries/UK && touch capital.txt && echo "London" > capital.txt
mkdir -p /home/bob/countries/India &&  cd /countries/India && touch capital.txt && echo "New Delhi" > capital.txt

uptime