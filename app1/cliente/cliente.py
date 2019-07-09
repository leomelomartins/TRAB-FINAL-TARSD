import socket
HOST = '192.168.50.2'
PORT =  8220
dest = (HOST, PORT)

tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.connect(dest)

fname = 'arquivos/teste' + input() + '.txt'
arq = open(fname, 'rb')

for i in arq.readlines():
  client_socket.send(i)

tcp.close()
