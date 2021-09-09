# whois-script

```console
Usage: 
./whois-script.sh [-p <string>] [-n <numeric>] [-b] [-s <string]

Options:
 -p <process>     process_name or process identificator (PID). Default process is 'firefox'.
                  you can also use this parameter to display another connection state, for example: ESTAB.
 -n <number>      number of lines to display. Default value is 5.
 -b               change backend to 'cc'. Default backend is 'netstat'. 'cc' is faster!
 -s <string>      select desired object from 'whois' output. Default object is 'Organization'.
                  ALL displayed allinformation from 'whois' output.
 -h               display this help.

```
