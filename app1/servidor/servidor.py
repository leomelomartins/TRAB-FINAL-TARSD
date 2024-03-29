import socket
import sys

HOST = '192.168.50.2'
PORT =  8220
orig = (HOST, PORT)

tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.bind(orig)
tcp.listen(1)

print ("Listening for client . . .")
conn, address = tcp.accept()
print ("Connected to client at ", address)

arq = open('recebido.txt', mode='wb')

while True:
  output = conn.recv(2048)

  if output.strip() == (b"disconnect"):
    tcp.close()
    sys.exit("Received disconnect message.  Shutting down.")
    conn.send(b"dack")
  elif output:
    arq.write(output)
    conn.send(b"ack")
    print('Arquivo enviado!')
    arq.close()
    print('Finalizando a conexão')
conn.close()
