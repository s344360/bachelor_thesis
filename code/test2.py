from socket import *
import socket
import errno
import IN
import sys
import random
import time
import select



def random_line():
    return "random len of line here"
    
    
#socket entleeren    
def empty_socket(sock):
    """remove the data present on the socket"""
    input = [sock]
    while 1:
        inputready, o, e = select.select(input,[],[], 0.0)
        if len(inputready)==0: break
        for s in inputready: s.recv(1)
        
        
  
def sendUDP():
  try:
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_address = ("10.42.0.1", 5005)#169.254.25.188
    empty_socket(sock) 
#  sock.setsockopt(socket.IPPROTO_IP, IN.IP_RECVERR, 1)
    print >>sys.stderr, 'starting up on %s port %s' % server_address
    
    #x=1   
    start_time= time.time()

    for i in range (0 , 100):
      empty_socket(sock)      
      abort_after =60;
      start = time.time()
      while True:
            delta =time.time()-start;
            if delta >=abort_after:
              break  
            try: 
              PACKET_SIZE = 50;#random.randint(50,1500);
              line= random_line()      
              sent=sock.sendto(line+"\x00" *max(PACKET_SIZE-len(line),0), server_address)
          # break
            except socket.error, exc:  
              if exc.errno ==55:
      	       #  print >>sys.stderr,"ERRRRRROOOOOOOR"
      	        # break
      	         time.sleep(0.1) 
      	         continue
      	           
            #print >>sys.stderr,x 	
            #x=x+1;
            #time.sleep(0.000140)
      time.sleep(60)
            
     # break  
      print >>sys.stderr,i, 'sent %s bytes back to %s' % (sent, server_address)
  except socket.error, v:
       print "Error1",v
  print(time.time()-start_time)  

if __name__=='__main__':
 sendUDP()
 