import pexpect
import sys
import os
import datetime
import time
import socket

m="vm2"
L1_PORT=6001
L2_PORT=6002
SOCKET_NUM=8092
CPU_NUM=2

def send_msg(machine, msg):
	os.system("./send_tg.sh [%s]_%s" % (machine, msg))
