#!/bin/bash
username=$(id -u -n 1000)

# api: https://api.open-meteo.com/v1/forecast?latitude=44.2017&longitude=17.904&current=temperature_2m,is_day,precipitation,rain,showers,snowfall,weather_code&timezone=Europe%2FBerlin&forecast_days=1
# json='{"latitude":44.1875,"longitude":17.9375,"generationtime_ms":0.07796287536621094,"utc_offset_seconds":7200,"timezone":"Europe/Berlin","timezone_abbreviation":"CEST","elevation":326.0,"current_units":{"time":"iso8601","interval":"seconds","temperature_2m":"°C","is_day":"","precipitation":"mm","rain":"mm","showers":"mm","snowfall":"cm","weather_code":"wmo code"},"current":{"time":"2024-05-18T23:15","interval":900,"temperature_2m":15.1,"is_day":0,"precipitation":0.00,"rain":0.00,"showers":0.00,"snowfall":0.00,"weather_code":3}}'

file=/home/"$username"/MyScripts/open-meteo/response.json

######################
# get data from API
curl --request GET -sL \
     --url 'https://api.open-meteo.com/v1/forecast?latitude=44.2017&longitude=17.904&current=temperature_2m,is_day,precipitation,rain,showers,snowfall,weather_code&timezone=Europe%2FBerlin&forecast_days=1'\
     --output $file

sleep 2
##############


# temperature
temp=$(cat $file | jq -r .current | jq -r .temperature_2m)
rounded_temperature=$(printf "%.0f\n" "$temp")

# weather_code
code=$(cat $file | jq -r .current | jq -r .weather_code)

# is_day
day=$(cat $file | jq -r .current | jq -r .is_day)

# time
time=$(cat $file | jq -r .current | jq -r .time)


########
# icon
# code=0
class="unknown"

case $code in
      0)
        icon='Clear'
        class="clear" ;;

      1|2)
        icon='Cloudy'
        class="cloudy" ;;

      3)
        icon='Overcast'
        class="overcast";;

      45|48)
        icon='Fog'
        class="fog" ;;

      51|53|55|56|57)
        icon='Drizzle'
        class="drizzle" ;;

      61|63|65|66|67)
        icon='Rain'
        class="rain" ;;

      71|73|75|77)
        icon='Snow'
        class="snow" ;;

      80|81|82)
        icon='Rain showers'
        class="rain-showers" ;;

      85|86)
        icon='Snow showers'
        class="snow-showers";;

      95|96|99)
        icon='T-Storm'
        class="t-storm" ;;

      *)
        icon=" "
        class="unknown"
esac

#############
# final data
data="$icon $rounded_temperature°"
printf '{"text": "%s", "tooltip": "%s", "class": "%s"}' "$data" "$time" "$class"



# WMO Weather interpretation codes (WW)
# Code 		  Description
#
# 0 		      Clear sky
# 1, 2, 3 	  Mainly clear, partly cloudy, and overcast
# 45, 48 	    Fog and depositing rime fog
# 51, 53, 55 	Drizzle: Light, moderate, and dense intensity
# 56, 57 	    Freezing Drizzle: Light and dense intensity
# 61, 63, 65 	Rain: Slight, moderate and heavy intensity
# 66, 67 	    Freezing Rain: Light and heavy intensity
# 71, 73, 75 	Snow fall: Slight, moderate, and heavy intensity
# 77 		      Snow grains
# 80, 81, 82 	Rain showers: Slight, moderate, and violent
# 85, 86 	    Snow showers slight and heavy
# 95 * 		    Thunderstorm: Slight or moderate
# 96, 99 * 	  Thunderstorm with slight and heavy hail
