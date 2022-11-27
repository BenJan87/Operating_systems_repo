import socket as s
import _thread as thread

host = "10.0.0.1"
port = 33000


server = s.socket(s.AF_INET, s.SOCK_STREAM)
# s.setsockopt(s.SOL_SOCKET, s.SO_REUSEADDR, 1)
server.bind((host, port))
server.listen(3)

all_clients = tuple()


def messaging(client):
    while True:
        msg = client.recv(1024).decode("utf8")
        if msg:
            print(f"User {msg} has joined the chat!")
            client.send(f"You joined the chat".encode("utf8"))
            messeging_to_all(client, f"\rUser {msg} joined the chat")
            break


    while True:
        msg_from_user = client.recv(1024).decode("utf8")
        if msg_from_user:
            messeging_to_all(client, msg_from_user)
            print(msg_from_user)

            
def messeging_to_all(sender, message):
    for client in all_clients:
        if client is not sender:    
            client.send(message.encode("utf8"))

while True:
    client, address = server.accept()
    print(f"Access accepted - {address}")
    all_clients += (client, )
    # cl_socket = tuple([client])
    # print(repr(cl_socket[0]))
    thread.start_new_thread(messaging, (client, ))