#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
   printf("PID: %d", getpid());
   getchar();

   pid_t pid = fork();

   if (pid == 0) {
      printf("Id procesu dziecka: %d", getpid());
      printf("Id procesu rodzica: %d", getppid());
   }

   else if (pid>0) {
      printf("Id procesu dziecka: %d", pid);
   }

   getchar();
   return 0;
}
