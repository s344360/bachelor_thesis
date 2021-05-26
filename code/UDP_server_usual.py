import socket
import errno
import sys

def udpServer():
  # Create a TCP/IP socket
  try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) #open new socket
    # sock.setsockopt(socket.SOL_SOCKET, IN.IP_RECVERR, 1)
    # Bind the socket to the port
    server_address = ("127.0.0.1",5005)#"169.254.52.186",5005
    print >>sys.stderr, 'starting up on %s port %s' % server_address
    sock.bind(server_address) # bind the socket to a public host, and a well-known port
   #sleep(40)
    sent = sock.sendto('Hiii Revin', ("127.0.0.1", 5005))
    x=0;
    while True:
      print >>sys.stderr, '\nwaiting to receive message'
      data, address = sock.recvfrom(2048)

      print >>sys.stderr, 'received %s bytes from %s' % (len(data), address) #return the length number of item len'(s)'
      print >>sys.stderr, data
      print >>sys.stderr,x
      x=x+1;
  except socket.error, v:
    print "Error::",v

if __name__=='__main__': #Wenn das aktuelle Modul das "Hauptmodul" ist, d.h. direkt von einem Python-Interpreter gestarted und nicht von einem anderen Modul importiert wurde
 udpServer()




