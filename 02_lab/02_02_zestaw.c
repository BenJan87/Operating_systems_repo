#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

int main()
{
	for(int i =0; i< 48000; i++) {
		pid_t child;
		child = fork();

		if (child == 0){
			printf("%d\n", i);
			continue;
		}
		else {break;}
	}

	getchar();
	sleep(60);
return 0;
}
