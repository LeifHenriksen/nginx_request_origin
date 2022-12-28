#!/bin/bash

resource="index.html"
read_old_logs=false
log_location=/var/log/nginx

usage() {
       printf "Usage: $0 [-r <string>] [-l <path>] [-o]\n-r Resource name\n-o Read old logs\n-l Path to log files\n" 1>&2; exit 1;
}

while getopts ":r:l:o" option; do
	case "${option}" in
		r)
			resource=${OPTARG}
			;;
		o)
			read_old_logs=true
			;;
		l)
			log_location=${OPTARG}
			;;
		*)
			usage
			;;
	esac
done


{ cat $log_location/access.log{,.1} && $read_old_logs && zcat $log_location/access.log.*.gz ; } |\
       	grep $resource |\
       	awk '{ print $1 }' |\
	sort |\
       	uniq -c |\
       	awk '{getloc="geoiplookup "$2" | sed 's/.*,.//'"; getloc | getline loc; close(cmd); print $1 "," $2 "," loc}' |\
       	column -s , -t -N Hits,IP,Location

