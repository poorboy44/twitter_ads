#!/bin/bash
twurl /1.1/followers/ids.json?screen_name=s1nelson > ./out/s1nelson_followers.txt
twurl /1.1/followers/ids.json?screen_name=jrmontag > ./out/jrmontag_followers.txt
twurl /1.1/followers/ids.json?screen_name=kolb > ./out/kolb_followers.txt
twurl /1.1/followers/ids.json?screen_name=drskippy > ./out/drskippy_followers.txt

find ./out -name "*followers*" | xargs -I {} cat {} | jq .ids[] | sort | uniq > ta.txt
shuf ta.txt | head -n2000 | split -l1000 
mv xaa group_a.txt
mv xab group_b.txt

