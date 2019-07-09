import socket
HOST = '192.168.50.2'
PORT = 8220
dest = (HOST, PORT)

tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.connect(dest)

msg = input()
while msg != '\x18':
    tcp.send (msg)
    msg = raw_input()
tcp.close()
