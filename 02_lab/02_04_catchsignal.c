#include <stdio.h>
#include <signal.h>
#include <string.h>

void signal_handler(int signal)
{
    //strsignal jako opis 
    printf("Otrzymany sygnal %d (%s)\n", signal, strsignal(signal)); 
}

int main()
{

    // NSIG - zmienna przechowująca maksymalną liczbę sygnałów przez system 

    for (int i = 1; i < NSIG; i++) {signal(i, signal_handler);}

    while (1) {}

    return 0;
}
