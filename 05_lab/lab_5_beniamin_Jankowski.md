# Lab 5 - Beniamin Jankowski

## Zad 1.1

Komendy do utworzenia plików:

```bash
dd if=/dev/zero of=zero.dat bs=1M count=100
```

```bash
dd if=/dev/urandom of=losowy.dat bs=1M count=100
```


![](images/two_random_files.png)

Komenda do spakowania:

```bash
zip arch.zip zero.dat losowy.dat
```
![](images/after_pack.png)

Pliki po spakowaniu są mniejsze ponieważ nastąpiła ich kompresja, gdzie w zero.dat kompresja była bardzo skuteczna z racji na powtarzające się puste bajty.

## Zad 1.2

Powiązanie miękkie:
    
```bash
ln -s losowy.dat losowy-soft.dat
```
Powiązanie twarde:
    
```bash
ln losowy.dat losowy-hard.dat
```
Aby sprawdzić zajętość:

```bash
ls -l | grep "losowy-"
```
![](images/links.png)

Dowiązanie miękkie to wskaźnik na nazwę pliku - jeśli zniknie plik, zniknie również powiązanie. Stąd tak mała waga pliku. \
Dowiązanie twarde to tak naprawdę kopia pliku. Nawet jeśli zniknie plik, to dowiązanie twarde zostanie.

## Zad 1.3
Utwórz plik:

```bash
dd if=/dev/zero of=pusty.dat bs=1M count=100
```
Zamontuj system plików:

```bash
mkfs.ext4 pusty.dat
```
Utwórz katalogm gdzie chcemy zamontować system plików:

```bash
mkdir /mnt/mounting
```
Zamontujmy system plików

```bash
mount -t ext4 pusty.dat /mnt/mounting
```
Następnie należy dodać linię do pliku /etc/fstab:

```bash
pusty.dat /mnt/mounting ext4 defaults,user 0 0
```
Po powyższej linijcie nie musimy używać sudo

## Zad 1.5

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define BUFFER_SIZE 8192

int main(int argc, char *argv[]) {
  
    int buffer_size = atoi(argv[1]);
    const char *src_file = argv[2];
    const char *target_file = argv[3];

    // Otwieranie plików
    FILE *src = fopen(src_file, "rb");
    FILE *target = fopen(target_file, "wb");
  

    // Alokowanie bufera
    char *buffer = (char*) malloc(buffer_size);

    // Kopiowanie pliku
    size_t bytes_read;
    while ((bytes_read = fread(buffer, 1, buffer_size, src)) > 0) {
        fwrite(buffer, 1, bytes_read, target);
    }

    free(buffer);
    fclose(src);
    fclose(target);

    return 0;
}
```

## Zad 1.6


```bash
#!/bin/bash

declare -A visited #tablica asocjacyjna

function check_link {

local link=$1
local count=0

while [ -L "$link" ]
do
    count=$((count + 1))
    if [ ${visited["$link"]} ]; 
    then
        echo "Zapętlenie: $link -> ${visited["$link"]}"
        return
    fi

    visited["$link"]=$(readlink "$link")
    link=${visited["$link"]}
done

echo "Brak zapętleń: $count"
}

for file in "$1"/* #wszystkie pliki i katalogiw katalogu $1
do

    if [ -L "$file" ]
    then
        check_link "$file"
    fi

done
```

## Zad 1.7

```bash
#!/bin/bash

files=$(find "$1" -type f -maxdepth 1)

for file in $files; do
    links=$(find "$1" -samefile "$file" | wc -l)
    if [ "$links" -gt 1 ]
    then
        echo "$file has $links hard links"
    fi
done
```

## Zad 1.8

```bash
ls -Rl $1 | grep -vE "(^\.)|(t)|(^\s*$)" | sort | cut -d" " -f1 | uniq -c
```

## Zad 1.9

```bash
dd if=/dev/zero of=disc_512 bs=1M count=100
dd if=/dev/zero of=disc_1024 bs=1M count=100
dd if=/dev/zero of=disc_2048 bs=1M count=100
dd if=/dev/zero of=disc_4096 bs=1M count=100



mkfs.ext4 -b 512 disc_512 #tutaj będzie najwięcej plików
mkfs.ext4 -b 1024 disc_1024
mkfs.ext4 -b 2048 disc_2048
mkfs.ext4 -b 4096 disc_4096

losetup -f disc_512
losetup -f disc_1024
losetup -f disc_2048
losetup -f disc_4096

for i in $(seq 1 1000)
do
    dd if=/dev/zero of=disc_512/$i bs=512 count=1
    dd if=/dev/zero of=disc_1024/$i bs=1024 count=1
    dd if=/dev/zero of=disc_2048/$i bs=2048 count=1
    dd if=/dev/zero of=disc_4096/$i bs=4096 count=1
done



for i in $(seq 1 1000)
do
    size=$(( ( RANDOM % 8192 )  + 256 ))

    dd if=/dev/urandom of=disc_512/$i bs=1 count=$size
    dd if=/dev/urandom of=disc_1024/$i bs=1 count=$size
    dd if=/dev/urandom of=disc_2048/$i bs=1 count=$size
    dd if=/dev/urandom of=disc_4096/$i bs=1 count=$size
    
done
```



