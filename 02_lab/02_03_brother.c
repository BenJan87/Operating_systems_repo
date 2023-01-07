#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    
    printf("PID: %d", getpid());
    getchar();
    pid_t pid = fork();
    pid_t brother = fork();

    if (pid == 0){
        printf("Id procesu dziecka: %d\n", getpid());
        printf("Id procesu rodzica: %d\n", getppid());
        getchar();
        pid_t grandchild_pid = fork();

        if (grandchild_pid == 0) {
            printf("Id procesu wnuka: %d\n", getpid());
            printf("Id procesu rodzica: %d\n", getppid());
        }

        else if (grandchild_pid > 0) {
            wait(NULL);
            printf("Koniec procesu wnuka\n");
        }

        else {
            printf("fork nieudany\n");
            return 1;
        }

    }

    else if (pid>0) {
        wait(NULL);
        printf("Koniec procesu dziecka\n");
    }

    else {
        printf("fork nieudany\n");
        return 1;
    }

    if (brother == 0) {
        printf("Id procesu brata: %d\n", getpid());
        printf("Id procesu rodzica: %d\n", getppid());
    }

    else if (brother>0) {
        wait(NULL);
        printf("Koniec procesu brata\n");
    }

    else{
        printf("fork nieudany\n");
        return 1;
    }
    
    return 0;
}

