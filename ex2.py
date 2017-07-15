from common import *

serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serversocket.bind(('localhost', SOCKET_NUM))
serversocket.listen(1) # become a server socket.

child2 = pexpect.spawn('telnet localhost %s' % L2_PORT)
child2.timeout=None
child2.logfile = sys.stdout
child2.sendline('')
child2.expect('L0.*# ')

# Once L1 boot is complete, try to connect it
while True:
    connection, address = serversocket.accept()
    buf = connection.recv(64)
    if len(buf) > 0:
        print buf
        break

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
while True:
	child2.sendline('')
	try:
		child2.expect('L1.*# ', timeout=10)
	except pexpect.TIMEOUT:
		print("Re-trying to get L1 shell..\n")
		continue
	break
child2.sendline('./run-guest.sh -c %s' % CPU_NUM)
send_msg(m, "L2_boot_start")
start = datetime.datetime.now()

child2.expect('Booting')
elapsed = datetime.datetime.now() - start
send_msg(m, "L2_printing_msg")
send_msg(m, elapsed)

child2.expect('L2.*# ')
elapsed = datetime.datetime.now() - start
send_msg(m, "L2_boot_complete")
send_msg(m, elapsed)

start = datetime.datetime.now()
child2.sendline('./hackbench')
child2.expect('L2.*# ')
elapsed = datetime.datetime.now() - start
send_msg(m, "hackbench_default_completed")
send_msg(m, elapsed)

start = datetime.datetime.now()
child2.sendline('./hackbench 100 process 500')
child2.expect('L2.*# ')
elapsed = datetime.datetime.now() - start
send_msg(m, "hackbench_stress_completed")
send_msg(m, elapsed)
