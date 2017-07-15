from common import *

clientsocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
clientsocket.connect(('localhost', SOCKET_NUM))

child = pexpect.spawn('telnet localhost %s' % L1_PORT)
child.timeout=None
child.logfile = sys.stdout

child.sendline('')
child.expect('L0.*# ')
send_msg(m, "L0_boot_complete")

child.sendline('cd /srv/vm')
child.expect('L0.*# ')
child.sendline('./run-guest.sh -c %s' % CPU_NUM)
send_msg(m, "L1_boot_start")
start = datetime.datetime.now()

child.expect('L1.*# ')
elapsed = datetime.datetime.now() - start
clientsocket.send('L1 is up')
send_msg(m, "L1_boot_complete")
send_msg(m, elapsed)

os.system("telnet localhost %s | tee l1_log" % L1_PORT)
