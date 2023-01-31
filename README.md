# Sense-Tidbyt

These directions are for a Mac.

INSTALL Pixlet (https://tidbyt.dev/docs/build/installing-pixlet) on a computer that runs 24/7.

DOWNLOAD the files from this repo to your computer.

UPDATE sense.star with the IP of your Home Assistant instance on lines 18-22.

Update sense.star with your Long Lived Access Token from Home Assistant on line 25. (https://developers.home-assistant.io/docs/auth_api/#long-lived-access-token)

UPDATE updateTidbyt2min.sh with the directory of the sense.star file on line 5.

UPDATE updateTidbyt2min.sh with the API-Token and Device ID you get from the Tidbyt app on line 6.

RUN this command in terminal "sh LOCATION/OF/FILE/updateTidbyt2min.sh" being sure to change the command to the directory of your file.
