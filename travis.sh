#!/bin/bash

mvn install -Dci -DskipDistro 2>&1 | cut -c -80

if [ ${PIPESTATUS[0]} -ne "0" ];
then
    echo "Build failed with Error: ${PIPESTATUS[0]}";
    exit 1;
else
    echo "Build completed successfully!";
fi