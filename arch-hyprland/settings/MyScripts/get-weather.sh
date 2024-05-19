#!/bin/bash
username=$(id -u -n 1000)

# api: https://api.open-meteo.com/v1/forecast?latitude=44.2017&longitude=17.904&current=temperature_2m,is_day,precipitation,rain,showers,snowfall,weather_code&timezone=Europe%2FBerlin&forecast_days=1
# json='{"latitude":44.1875,"longitude":17.9375,"generationtime_ms":0.07796287536621094,"utc_offset_seconds":7200,"timezone":"Europe/Berlin","timezone_abbreviation":"CEST","elevation":326.0,"current_units":{"time":"iso8601","interval":"seconds","temperature_2m":"°C","is_day":"","precipitation":"mm","rain":"mm","showers":"mm","snowfall":"cm","weather_code":"wmo code"},"current":{"time":"2024-05-18T23:15","interval":900,"temperature_2m":15.1,"is_day":0,"precipitation":0.00,"rain":0.00,"showers":0.00,"snowfall":0.00,"weather_code":3}}'

file=/home/"$username"/MyScripts/response.json

######################
# get data from API
curl --request GET -sL \
     --url 'https://api.open-meteo.com/v1/forecast?latitude=44.2017&longitude=17.904&current=temperature_2m,is_day,precipitation,rain,showers,snowfall,weather_code&timezone=Europe%2FBerlin&forecast_days=1'\
     --output $file

sleep 5
##############
# temperature
temp=$(cat $file | jq -r .current | jq -r .temperature_2m)
rounded_temperature=$(printf "%.0f\n" "$temp")

#echo $rounded_temperature
########
# icon
icon=" "

#############
# final data
data="$icon $rounded_temperature°"
printf '{"text": "%s", "tooltip": "ttt", "class": "my-weather"}' "$data"