#!/bin/bash

while :
do
	pixlet render /Users/YOUR-USERNAME-HERE/Desktop/SenseTidbyt/sense.star
	pixlet push --api-token TIDBYT-API-KEY-HERE --installation-id Sense TIDBYT-DEVICE-ID-HERE /Users/Jay/Desktop/SenseTidbyt/sensePi.webp
    sleep 120
done