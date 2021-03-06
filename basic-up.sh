#!/usr/bin/expect

set timeout 1200000

log_file mylog
source start_telnet.sh
sleep 1
send "\n"
expect -re "L0.*# "
send "./run.sh 1\n"
expect -re "L1.*# "
send "cd vm\n"
expect -re "L1.*# "
send "./run-guest.sh\n"
expect -re "L1.*# "
