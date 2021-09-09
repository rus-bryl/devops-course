#!/bin/bash

# Default values
COMMAND='netstat'
PROCESS='firefox'
NUMBER=5
COLUMN=5
SELECTION='[Oo]rgani[zs]ation'

usage () {
    echo ""
    echo "Usage: "
    echo "$0 [-p <string>] [-n <numeric>] [-b] [-s <string]"
}
    
helpmessage () {
    echo ""
    echo "Options:"
    echo " -p <process>     process_name or process identificator (PID). Default process is 'firefox'."
    echo "                  you can also use this parameter to display another connection state, for example: ESTAB."
    echo " -n <number>      number of lines to display. Default value is 5."
    echo " -b               change backend to 'cc'. Default backend is 'netstat'. 'cc' is faster!"
    echo " -s <string>      select desired object from 'whois' output. Default object is 'Organization'."
    echo "                  ALL displayed allinformation from 'whois' output."
    echo " -h               display this help."
    exit 0
}

# Checking arguments for required keys
checkargs () {
    if [[ $OPTARG =~ ^-[p/n/s/b]$ ]]
    then
        echo "Unknown argument $OPTARG for this option $opt!"
        usage
        exit 1
    fi
}

while getopts ":p:n:hbs:" opt
do
    case $opt in
        h)
            usage
            helpmessage
            exit 1                  # Help message
            ;;
        p) checkargs
            PROCESS=${OPTARG}       # Process identyfier (name or PID). Default process is 'firefox'.
            ;;
        n) checkargs
            NUMBER=${OPTARG}        # Number lines to display. Default value is '5'.
            ;;
        b)
            COMMAND='ss'            # Changing backend ('ss' instead of 'netstat'). Default is 'netstat'.
            COLUMN=6                # Peer address column of 'ss' output
            ;;
        s)  checkargs
            SELECTION=${OPTARG}     # Object selection from 'whois' output.
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# 'netstat' availability check.
if [ -e /usr/bin/netstat ]
    then echo "netstat is available"
    else echo "netstat is not available, install net-tools or try to use -s option"
            usage
            exit 1
fi

echo ""
echo "Process: $PROCESS"
echo "Number: $NUMBER"
echo "Backend: $COMMAND"
echo "Selection: $SELECTION"
echo ""

$COMMAND -tunap 2>/dev/null|
awk -v col="$COLUMN" '/'$PROCESS'/ {print $col}'|
cut -d: -f1|
sort|
uniq -c|
sort|
tail -n$NUMBER|
while read IP
do
    awk '{system("echo connections: "$1); system("whois " $2)}'|
    if [ $SELECTION = 'ALL' ]
        then awk -F: '/^connections/ || /^/ {print $0}'
        else awk -F: '/^connections/ || /^'$SELECTION'/ {print $0}'
    fi
done
