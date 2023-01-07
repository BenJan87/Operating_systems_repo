
#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int *global; 

int main()
{
    FILE *file = fopen("output.txt", "w");
    void *ptr = malloc(100); 
    global = malloc(100);   
    
    int number;     
    pid_t pid;
    printf("Od rodzica: PID: %d\n", getpid());
    pid = fork();

    if (pid < 0) {
        fprintf(stderr, "Fork niedudany\n");
        return 1;
    }
    
    else if (pid == 0) {
        printf("Od dziecka: PID: %d, PPID: %d\n", getpid(), getppid());
        printf("Wprowadz int: ");
        scanf("%d", &number);
        printf("Wprowadziles: %d\n", number);
        getchar();
    }

    else {
        printf("Od rodzica: PID: %d, PPID: %d\n", getpid(), getppid());
        getchar();
        wait(NULL);
        printf("Koniec procesu dziecka\n");
    }

    
    free(global);
    free(ptr);
    fclose(file);
    return 0;
}
