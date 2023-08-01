#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include <pthread.h>

#define PORT 18080

void* client_thread(void *conn)
{
    int new_socket = (int)conn;
    char buffer[30000] = {0};
    read(new_socket, buffer, 30000);
    printf("%s\n", buffer);

    char command[256] = {0};
    //sscanf(buffer, "GET /%s ", command);
    sscanf(buffer, "GET %s ", command);
    printf("Command: %s\n", command);

    char *args[] = {"/bin/bash", "-c", command, NULL};

    if (fork() == 0) {
        if (execvp(args[0], args) == -1) {
            perror("execvp");
            exit(EXIT_FAILURE);
        }
    }

    char *response = "HTTP/1.1 200 OK\nContent-Type: text/plain\nContent-Length: 12\n\nok";
    write(new_socket, response, strlen(response));
    printf("------------------executing command done-------------------\n");
    close(new_socket);
}


int main() {
    int server_fd, new_socket;
    struct sockaddr_in address;
    int addrlen = sizeof(address);

    // 创建socket文件描述符
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }

    address.sin_family = AF_INET;
    //address.sin_addr.s_addr = INADDR_ANY; //任意地址
    inet_pton(AF_INET, "127.0.0.1", &(address.sin_addr)); //本地地址
    address.sin_port = htons(PORT);

    // 绑定socket到端口
    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    // 监听连接
    if (listen(server_fd, 3) < 0) {
        perror("listen failed");
        exit(EXIT_FAILURE);
    }

    while (1) {
        printf("\nWaiting for a connection...\n");

        if ((new_socket = accept(server_fd, (struct sockaddr *)&address, (socklen_t*)&addrlen)) < 0) {
            perror("accept");
            exit(EXIT_FAILURE);
        }

        //use a thread to process connection
        pthread_t thread;
        pthread_create(&thread, NULL, client_thread, (void *)new_socket);
        
    }

    return 0;
}
