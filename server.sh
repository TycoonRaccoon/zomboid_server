#!/bin/sh

while getopts p:n: flag
do
    case "${flag}" in
        p) password=${OPTARG};;
        n) name=${OPTARG};;
    esac
done
printf "$password\n$password" | ./start-server.sh -servername $name