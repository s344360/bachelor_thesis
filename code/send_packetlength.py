#from socket import *
import socket
import errno
import IN
import sys
import random
import time
#import select


#socket entleeren    
#def empty_socket(sock):
   # """remove the data present on the socket"""
    #input = [sock]
    #while 1:
        #inputready, o, e = select.select(input,[],[], 0.0)
        #if len(inputready)==0: break
        #for s in inputready: s.recv(1)
      
def random_line():
  PACKET_SIZE = 1500; 	#random.randint(50,1500);#5000; 
  line="random is here";
  line1=line+"\x00"*max(PACKET_SIZE-len(line),0)
  return line1
	 
def sendUDP():
   try:
    sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM) # (socket.AF_INET, socket.SOCK_DGRAM)
    server_address = ("10.42.0.1",5005) #("10.42.0.1", 8008)
   # empty_socket(sock) 
#  sock.setsockopt(socket.IPPROTO_IP, IN.IP_RECVERR, 1)
    print >>sys.stderr, 'starting up on %s port %s' % server_address
    
    start_time= time.time()
    
    line11= random_line();
    
    for i in range (0 ,101):
      #empty_socket(sock)      
      abort_after =60;
      start = time.time()
      y = 0;
      x=0;
    
      while True:
            delta =time.time()-start;
            if delta >=abort_after or y==120000:
              break  
    	    try:       
              sent=sock.sendto(line11,server_address);
           #  break
            except socket.error, exc:
              if exc.errno ==55:
      	        #print >>sys.stderr,"ERRRRRROOOOOOOR"
      	       # break
      	       	x =x+1;
      	        time.sleep(0.1)
      	        continue
  	           
            #print >>sys.stderr,x 	
            #x=x+1;
            #time.sleep(0.000300)
            y=y+1;
            #if y == x:
    	    #time.sleep(0.00000120) 
    	      #  x=x+100000
      if delta<abort_after:
         time.sleep(abort_after - delta)      
      time.sleep(120)
            
     # break  
     # print >>sys.stderr,i, 'sent %s bytes back to %s' % (sent, server_address)
      print >>sys.stderr,i
      print(y)
      print('Anzahl Error 55',x);  
   except socket.error, v:
      print "Error1",v
   print(time.time()-start_time);  

if __name__=='__main__':
 sendUDP()
 