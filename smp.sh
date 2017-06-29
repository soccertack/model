#!/usr/bin/expect

set timeout 1200000

log_file mylog
source start_telnet.sh
exec ./send_tg.sh start_telnet
send "\n"
expect -re "L0.*# "
exec ./send_tg.sh start_smp_L1
send "./run.sh 2\n"
expect -re "L1.*# "
exec ./send_tg.sh L1_up
send "cd vm\n"
expect -re "L1.*# "
exec ./send_tg.sh start_smp_L2
send "./run-guest.sh -c 2\n"
expect -re "L2.*# "
exec ./send_tg.sh L2_up
send "\n"
