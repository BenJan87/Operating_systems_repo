#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

int main(int argc, char *argv[])
{
    if (argc != 3) {
        printf("Za malo argumentow");
        return 1;
    }

    int pid = atoi(argv[1]);
    int signal = atoi(argv[2]);
    int result = kill(pid, signal);
    
    if (result != 0) {
        perror("kill() nieudany");
        return 1;
    }

    printf("Wyslano sygnal: %d do process: %d\n", signal, pid);
    return 0;
}
