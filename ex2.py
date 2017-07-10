import pexpect
import sys
import os
import datetime
import time

child2 = pexpect.spawn('telnet localhost 6002')
child2.timeout=None
child2.logfile = sys.stdout
child2.expect('L0.*# ')
time.sleep(60)
child2.sendline('telnet localhost 6666')
while True:
	child2.sendline('')
	try:
		child2.expect('L1.*# ', timeout=10)
	except pexpect.TIMEOUT:
		print("Re-trying to get L1 shell..\n")
		continue
	break

child2.sendline('cd vm')
child2.expect('L1.*# ')
child2.sendline('./run-guest.sh -c 1')
start = datetime.datetime.now()

child2.expect('Booting')
elapsed = datetime.datetime.now() - start
os.system("./send_tg.sh L2_boot_starts")
os.system("./send_tg.sh %s elapsed" % elapsed)
start = datetime.datetime.now()

child2.expect('L2.*# ')
elapsed = datetime.datetime.now() - start
os.system("./send_tg.sh L2_boot_complete")
os.system("./send_tg.sh %s elapsed" % elapsed)
