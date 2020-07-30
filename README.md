# URLStatistics
This script can be used to check a web server's performance at a regular interval and log those results to JSON.

## Installation

## Usage

```./urlstatistics.sh url [output file] [interval in seconds]```

### Example 

  `./urlstatistics.sh https://example.com output.json 30`
	
## Customization

You may modify the body of the "urlstatistics.template" file to add or remove Curl variables from the JSON output. 

For a list of available variables, please see the [Curl documentation](https://ec.haxx.se/usingcurl/usingcurl-verbose/usingcurl-writeout).
