#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    printf("Hej jestem programem");
    getchar();
    
    char commend[20] = "ls -al /var/log";
    system(commend);
    return 0;
}