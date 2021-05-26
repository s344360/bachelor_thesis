from socket import *
import socket
import errno
import IN
import sys
import random
import time
import sys, os



def random_line():
  return "random len of line here"
  
def sendUDP():
  try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_address = ("10.42.0.1", 5005)#169.254.25.188
 #   sock.setsockopt(socket.IPPROTO_IP, IN.IP_RECVERR, 1)
    print >>sys.stderr, 'starting up on %s port %s' % server_address
    
    x=1;
    start_time= time.time()
    while (x<=200000):      #while 1
      PACKET_SIZE = random.randint(50,1500);
      line= random_line()
      try:
       sent=sock.sendto(line+"\x00" *max(PACKET_SIZE-len(line),0), server_address)
       # break
      except socket.error, exc:  
      	if exc.errno ==55:
      	   #print >>sys.stderr,"ERRRRRROOOOOOOR"
      	  # break
      	   time.sleep(0.1)  
      	   
    #	else: 
      	 #   raise     
      print >>sys.stderr,x  	
      x=x+1;
      time.sleep(0.000150)
     #  sent = sock.sendto("Hiiiiiiiiii Rami", server_address)
    print >>sys.stderr, 'sent %s bytes back to %s' % (sent, server_address)
  except socket.error, v:
    print "Error1",v
  print(time.time()-start_time)  

if __name__=='__main__':
  sendUDP()
 

 

# while(x < 6):
  #     sent = sock.sendto("Hiiiiii Rami", server_address)
   #    x= x+1;
    #print >>sys.stderr, 'sent %s bytes back to %s' % (sent, server_address)
  #except socket.error, v:
   # print "Error",v
#if __name__=='__main__':
  #sendUDP()
  
  #ip.dst== 10.42.0.1 and !dns and !ssh and !tcp and !arp and !icmp and !ntp and !ssdp and !db-lsp-disc 
  
  
  
  
  
  