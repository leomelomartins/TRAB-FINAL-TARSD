import socket
HOST = '192.168.50.2'
PORT =  8220
orig = (HOST, PORT)

tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.bind(orig)
tcp.listen(1)

while True:
    con, cliente = tcp.accept()
    print ('Conectado por', cliente)
    while True:
        msg = con.recv(1024)
        if not msg: break
        print cliente, msg
    print ('Finalizando conexao do cliente', cliente)
    con.close()
