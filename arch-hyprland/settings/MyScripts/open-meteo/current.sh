#!/bin/bash
username=$(id -u -n 1000)

file=/home/"$username"/MyScripts/open-meteo/response.json

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
# desc
# code=333
class="unknown"

case $code in
      0)
        desc='Clear'
        if [ "$day" == 0 ]; then
            desc='Clear'
        fi
        class="clear" ;;

      1|2)
        desc='Cloudy'
        if [ "$day" == 0 ]; then
            desc='Cloudy'
        fi
        class="cloudy" ;;

      3)
        desc='Overcast'
        class="overcast";;

      45|48)
        desc='Fog'
        class="fog" ;;

      51|53|55|56|57)
        desc='Drizzle'
        class="drizzle" ;;

      61|63|65|66|67)
        desc='Rain'
        class="rain" ;;

      71|73|75|77)
        desc='Snow'
        class="snow" ;;

      80|81|82)
        desc='Rain Showers'
        class="rain-showers" ;;

      85|86)
        desc='Snow Showers'
        class="snow-showers";;

      95|96|99)
        desc='T-Storm'
        class="t-storm" ;;

      *)
        desc="unknown"
        class="unknown"
esac

#############
# final data - format: Clear | 26°
data="$desc | $rounded_temperature°"
# printf '{"text": "%s", "tooltip": "%s", "class": "%s"}' "$data" "$time" "$class"
echo "$data"
