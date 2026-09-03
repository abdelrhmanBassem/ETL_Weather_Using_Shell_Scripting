city_name="Casablanca"
curl -s wttr.in/$city_name?T --output weather_report
obs_temp=$(curl -s wttr.in/$city_name?T|grep -m 1  '°.' |grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city_name: $obs_temp"
fc_temp=$(curl -s wttr.in/$city_name?T|head -23|tail -1 |grep '°.'| cut -d 'F' -f2 | grep -Eo -e '-?[[:digit:]].*' )
echo "The forecasted temperature for noon tomorrow for $city : $fc_temp F"
TZ='Moroco/Casablanca'
day=$(TZ='Morocco/Casablanca' date  +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)
record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp")
echo "$record">>rx_poc.log
