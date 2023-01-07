#include <stdio.h>
#include <unistd.h>

int main()
{
    printf("Hej, jestem programem egzekucyjnym\n");
    getchar();
    execl("./02_05_another.c", "02_05_another.c", (char*)NULL);
    perror("execl() nieudany");
    return 1;
}

