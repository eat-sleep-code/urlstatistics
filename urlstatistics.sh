url=$1
outputFile=$2
interval=$3
echo ''
echo ' URLStatistics 2020.07.30     <eat-sleep-code />'
echo ' -----------------------------------------------'


if [ -z "$url" ]; then
	echo ''
	echo ' -----------------------------------------------'
	echo ''
	echo ' Usage: ./urlstatistics.sh url [output file] [interval in seconds]'
	echo ''
	echo ' Example: ./urlstatistics.sh https://example.com output.json 30' 
	echo ''
	echo ' -----------------------------------------------'
	echo ' You may modify the body of the "urlstatistics.template" file to add or remove Curl variables from the output.'
	echo ''
else
	trap ctrl_c INT
	function ctrl_c() {
		truncate -s-2 $outputFile
		echo '' >> $outputFile
		echo ']' >> $outputFile 
		echo ''
		echo ' -----------------------------------------------'
		echo ' Thank you for using URLStatistics...'
		echo ''
		exit 0
	}
	
	if [ -z "$outputFile" ]; then
		outputFile="urlstatistics.json"
	fi

	if [ -z "$interval" ]; then
		interval=60
	fi
	echo ' Press CTRL-C to end statistics gathering...'
	echo ' -----------------------------------------------'
	echo ''
	echo '[' > $outputFile 
	while true; do
		timestamp=$(date +"%Y%m%d%H%M%S")
		echo '{' >> $outputFile
		echo '	"url": "'$url'",' >> $outputFile
		echo '	"timestamp": "'$timestamp'",' >> $outputFile
		curl --output /dev/null --write-out "@urlstatistics.template" --silent $url >> $outputFile
		echo '},' >> $outputFile
		echo ' '$timestamp ':' $url
		sleep $interval
	done
fi;
