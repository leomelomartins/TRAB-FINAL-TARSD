import socket
HOST = '192.168.50.2'
PORT =  8220
dest = (HOST, PORT)

tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.connect(dest)

fname = 'enviados/' + input() + '.txt'
arq = open(fname, mode='rb')

for i in arq.readlines():
  tcp.send(i)

tcp.close()
