#!/usr/bin/expect

set timeout 1200000

log_file mylog
spawn telnet localhost 5000
sleep 1
send "\n"
expect -re "L0.*# "
send "./run.sh 2\n"
expect -re "L1.*# "
send "cd kvm-unit-tests\n"
expect -re "L1.*# "
send "QEMU=../qemu/aarch64-softmmu/qemu-system-aarch64 ./run_tests.sh\n"
