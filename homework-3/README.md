# whois-script  

If you are lazy to type several commands in a row - you will like this script.  

## What this script does  

This script will help you track network connections, group them, and get information on them from the whois database.  

## Getting started  

1. Download the script whois-script.sh from this repository and place it in a location of your choosing.
2. Add execution rights with following command: ` ~$ chmod +x whois-script.sh `  
3. Run ` ~$ ./whois-script.sh -h ` to read information about keys and options.



```console
Usage: 
./whois-script.sh [-p <string>] [-n <numeric>] [-b] [-s <string]

Options:
 -p <process>     process_name or process identificator (PID). Default process is 'firefox'.
                  you can also use this parameter to display another connection state, for example: ESTAB.
 -n <number>      number of lines to display. Default value is 5.
 -b               change backend to 'cc'. Default backend is 'netstat'. 'cc' is faster!
 -s <string>      select desired object from 'whois' output. Default object is 'Organization'.
                  'ALL' displayed all information from 'whois' output.
 -h               display this help.

```
## Examples  

This example will display the number of connections and organizations for the last 10 of all established connestions.

```console
brm@brm-HP:~$ ./whois-script.sh -p ESTAB -n 10 -b
netstat is available

Process: ESTAB
Number: 10
Backend: ss
Selection: [Oo]rgani[zs]ation

connections: 1
Organization:   Facebook, Inc. (THEFA-3)
connections: 1
Organization:   Internet Assigned Numbers Authority (IANA)
connections: 1
Organization:   Stack Exchange, Inc. (SE-111)
connections: 1
Organization:   Amazon Technologies Inc. (AT-88-Z)
connections: 1
organisation:   ORG-LA230-RIPE
connections: 2
Organization:   Internet Assigned Numbers Authority (IANA)
