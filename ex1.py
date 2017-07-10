import pexpect
import sys
import os
import datetime
import time

child = pexpect.spawn('telnet localhost 6001')
child.timeout=None
child.logfile = sys.stdout

child.expect('L0.*# ')
os.system("./send_tg.sh L0_boot_complete")

child.sendline('cd /srv/vm')
child.expect('L0.*# ')
child.sendline('./run-guest.sh -c 1')
os.system("./send_tg.sh L1_boot_start")
start = datetime.datetime.now()

child.expect('L1.*# ')
elapsed = datetime.datetime.now() - start
os.system("./send_tg.sh L1_boot_complete")
os.system("./send_tg.sh %s elapsed" % elapsed)

