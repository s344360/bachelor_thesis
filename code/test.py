from socket import *
import socket
import errno
import IN
import sys
import random
import time



def random_line():
  return "random len of line here"
  
def sendUDP():
  try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_address = ("10.42.0.1", 5005)#169.254.25.188
 #   sock.setsockopt(socket.IPPROTO_IP, IN.IP_RECVERR, 1)
    print >>sys.stderr, 'starting up on %s port %s' % server_address
    
    #x=1
    start_time= time.time()
    for i in range (0 , 200000):
      while True: 
         try: 
           PACKET_SIZE =random.randint(50,1500);
           line= random_line()
      
           sent=sock.sendto(line+"\x00" *max(PACKET_SIZE-len(line),0), server_address)
       # break
         except socket.error, exc:  
           if exc.errno ==55:
      	    #  print >>sys.stderr,"ERRRRRROOOOOOOR"
      	     # break
      	      time.sleep(0.01) 
      	      continue
      	           
        # print >>sys.stderr,i  	
        # x=x+1;
         time.sleep(0.000140)
         break
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
  #except socket.error, v:  print(time.time()-start_time)  

   # print "Error",v
#if __name__=='__main__':
  #sendUDP()
  
 # date +"%T.%3N"
 
# sudo /usr/sbin/ntpd -c /private/etc/ntp-restrict.conf -n -g -p /var/run/ntpd.pid -f /var/db/ntp.drift 
  
  
  
  
  
  