# Installation

Go tilbydes til en lang række platforme, hvoraf de mest brugte platforme er repræsenteret
i disse installationsinstruktioner,

  - Mac OS X
  - Linux
  - Windows

Yderligere detaljer og instruktioner for andre platforme forefindes på
[golang.org](https://golang.org/doc/install).
Disse instruktioner anvender primært platformens pakkesystemer til installation,
hvorfor det næppe er allerseneste udgivne Go-udgave, der installeres.  
Hvis der er behov for en nyere udgave af Go, kan instruktionerne på
[golang.org](https://golang.org/doc/install) anvendes.


## Mac OS X
TBD.

## Linux
Go er generelt godt understøttet i diverse Linux-distributioners pakkesystemer.
De primære er dækket her.

## Før installation
TBD.

## Ubuntu
Debian-baserede distributioner såsom Ubuntu understøtter Go i Apt-pakkesystemet,
og kan derfor let installeres således,

```
sudo apt-get update
sudo apt-get install -y golang
```

## Arch
TBD.

## Fedora

```
sudo dnf install golang
```

Dette vil installere Go og dets afhængigheder.

## Efter installation
Start en ny shell og bekræft følgende,

  - Miljøvariablen `GOPATH` er defineret og biblioteket eksisterer
  - Miljøvariablen `GOROOT` er defineret, biblioteket eksisterer og er ikke tomt
  - Go-programmet er i `PATH`

Dette kan gøres på følgende vis,

```
# ls -l $(go env GOPATH)
drwxrwxr-x 2 user group 4096 Dec 26 16:46 bin
drwxrwxr-x 3 user group 4096 Mar 25  2017 pkg
drwxrwxr-x 6 user group 4096 Jan 21 08:50 src

# ls -l $(go env GOROOT)
total 12                       
drwxr-xr-x 2 root root 4096 Apr  6  2017 bin
lrwxrwxrwx 1 root root   35 Dec 19  2016 doc -> ../../share/doc/golang-1.7-doc/html
lrwxrwxrwx 1 root root   45 Apr  5  2017 favicon.ico.gz -> ../../share/doc/golang-1.7-doc/favicon.ico.gz
drwxr-xr-x 5 root root 4096 Apr  5  2017 pkg                                                
lrwxrwxrwx 1 root root   22 Dec 19  2016 src -> ../../share/go-1.7/src
lrwxrwxrwx 1 root root   23 Dec 19  2016 test -> ../../share/go-1.7/test
-rw-r--r-- 1 root root    7 Dec  1  2016 VERSION   
```

Note: Output varierer i lettere grad mellem distributioner og Go-versioner.


## Windows
TBD.



# Afprøvning
Installationen kan afprøves ved at oversætte følgende minimale Go-program,

```
package main

import "fmt"

func main() {
    fmt.Printf("Hej fra Go\n")
}
```

Kopier og indsæt ovenstående kildekode i filen `$GOPATH/src/hej.go`. Oversæt derefter kildekoden og afvikl programmet således,

```
# cd $GOPATH/src
# go build .
# ./hej
Hej fra Go
```

Hvis der vises fejlbeskeder eller linjen `Hej fra Go` ikke vises, er Go-installationen fejlramt.
