import socket as s
import _thread as thread
import time

host = "10.0.0.1"
port = 33000


client = s.socket(s.AF_INET, s.SOCK_STREAM)
client.connect((host, port))

client_name = input("Insert your username: ")
client.send(client_name.encode("utf8"))

tmp_name = client.recv(1024).decode("utf8")
print(tmp_name)

def listening(client):
    while True:
        msg = client.recv(1024).decode("utf8")
        if msg:
            print("\r"+msg+f"\n({curr_time}) You: ", end="")

while True:
    curr_time = time.ctime(time.time())[11:16]
    thread.start_new_thread(listening, (client, ))
    msg = input(f"({curr_time}) You: ")  
    client.send(f"({curr_time}) {client_name}: {msg}".encode("utf8"))