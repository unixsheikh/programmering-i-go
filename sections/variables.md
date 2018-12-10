# Variabler #

En variabel er en pladsholder i computerens hukommelse til noget data. Denne data kan f.eks. være en tekststreng som ordet "hallo verden", eller det kan f.eks. være et tal som tallet 100, men det kan også være andre ting. Hvorvidt en given værdig er tilladt eller ej fastlægges af variablens type. Variablens type fastsættes ved variablens deklaration.

I Go erklæres en variabel med nøgleordet `var`.

```go
// Deklarer en variabel af navnet "minTekst", og giv den typen "string".
var minTekst string

// Deklarer en variabel af navnet "mitTal", og den den typen "int".
var mitTal int

// Giv variablen "minTekst" værdien "Hallo verden".
minTekst = "Hallo verden"

// Giv variablen "mitTal" værdien "100".
mitTal = 100
```

Hvis en variable ikke gives en begyndelsesværdi, initialisere Go variablen til en "nul værdi" for den type man definerer.

Nul værdierne er følgende:

  * 0 for tal typer.
  * false for sandhedsværdier, også kaldet boolske værdier.
  * En tom tekststreng for tekststrenge.

Variabler kan også defineres med en begyndelsesværdi.

```go
var minTekst string = "hallo verden"
var mitTal int = 100
```

Der findes også en forkortet form hvor Go selv finder ud af variablens type ud fra den værdi man giver den.

```go
var minTekst = "hallo verden"
var mitTal = 100
```

Sidst, men ikke mindst kan man også erstatte nøgleordet `var` med semikolon foran lighedstegnet.

```go
minTekst := "hallo verden"
mitTal := 100
```

Ovenstående forkortede udgave, hvor semikolen bruges i stedet for nøgleordet `var`, kan kun bruges inde i en funktion. Udenfor en funktion skal enhver variabeldeklaration begynde med nøgleordet `var`, og den forkortede form `:=` er ikke tilgængelig.

Variablers data kan ændres sålænge værdier er af samme type.

```go
// Begyndende værdi.
var mitTal = 100

// Ny værdi.
mitTal = 200

// Duer ikke da mitTal er deklareret automatisk som en int.
mitTal = "Hej verden"
```

I det sidste tilfælde giver Go følgende fejlbesked:

```
cannot use "Hej verden" (type string) as type int in assignment
```

Det er også muligt at gruppere flere variabel deklarationer sammen. Go tillægger værdierne til variablerne i den rækkefølge de står.

```go
var a, b, c int = 10, 20, 30

// Eller med den forkortede udgave.
a, b, c := 10, 20, 30
```

Med den forkortede udgave kan man sågar blande typerne.

```go
a, b, c := 10, "Hallo", false
```

Variablen `a` bliver deklareret til typen `int`, og får begyndelsesværdien 10. Variablen `b` bliver deklareret til typen `string`, og får begyndelsesværdien "Hallo". Og variablen c bliver deklareret til typen `bool`, og får værdien "false".

## Pointer ##

En "pointer" i Go er en særlig variabel der indeholder en hukommelsesadresse på en anden almindelig variabel. Ligesom en almindelig variabel har en type, så har en pointer variabel også en type. Pointer variablens type fastsættes af den variablen type som pointeren "peger" på.

Hvis jeg opretter en variablen af typen "string" med værdien "Hej verden", så ligger denne værdi et sted i computerens hukommelse. Hvis jeg skal "pege" på denne hukommelsesadresse med en pointer variabel, så skal jeg bruge en pointer af typen "string".

Sagt med andre ord: En pointers type skal passe sammen med typen af det som den peger på.

Lad os kigge på et konkret eksempel. Opret filen _main.go_ og indtast følgende:

```go
package main

import "fmt"

func main() {

    // Først deklarer vi variablen "a" af typen "string", og giver den værdien "Hej".
	var a string = "Hej"

    // Dernæst deklarer vi variablen "b" af typen "string pointer".
    // Vi bruger * til at indikere at denne variablen er en "pointer".
	var b *string

    // Her giver vi variablen "b" hukommelsesadressen på variablen "a".
    // Vi bruger & til at indikerer at det er hukommelsesadressen vi ønsker,
    // og ikke selve indholdet af "a".
    b = &a

    // Udskriv værdien der ligger i variablen "a".
	fmt.Println(a)

    // Udskriv værdien der ligger i variablen "b".
	fmt.Println(b)

    // Udskriv værdien af det som "b" peger på.
    fmt.Println(*b)
}
```

Hvis du kører ovenstående kode vil du se noget tilsvarende det her:

```
$ go run main.go
Hej
0xc8200721b0
Hej
```

Værdien `0xc8200721b0` er adressen på variablen `a` på min computer, den vil højst sandsynligt se anderledes på din.

Tegnet * betyder at en variabel bliver deklareret som en pointer, en variabel der peger på noget, og man kan rent praktisk tænke sig at "stjernen" er det man peger med.

Forskellen på `fmt.Println(b)` og `fmt.Println(*b)` er at vi i første tilfælde udskriver værdien af selve variablen `b`, hvilket er hukommelsesadressen på variablen `a`. I et andet tilfælde vil vi ikke se selve hukommelsesadressen, men derimod vil vi gerne se hvad der egentligt gemmer sig på denne hukommelsesadresse, hvilket er værdien "Hej" som variablen `a` indholder.

Tegnet & bruges til at få hukommelsesadresser, og vi kan lave et lille program der viser dette isoleret fra emnet om pointere.

```go
package main

import "fmt"

func main() {

    var foo string = "Hej med dig"

    // Udskriv værdien som foo indeholder.
    fmt.Println(foo)

    // Udskriv den hukommelsesadresse på foo.
    fmt.Println(&foo)
}
```

Hvis du kører ovenstående program får du noget tilsvarende dette resultat:

```
Hej med dig
0xc82000a320
```

Lad os lave et andet konkret eksempel.

```go
package main

import "fmt"

func main() {

	var a string = "foo"

	var b *string = &a

	fmt.Println(a)

	*b = "bar"

	fmt.Println(a)
}
```

Hvad tror du der sker, hvis du prøver at køre ovenstående program?

```
$ go run main.go
foo
bar
```

Efter som `*b` peger på hukommelsesadressen til variablen `a`, kan vi ændre på indholdet på selve adressen, og det gør vi med:

```go
*b = "bar"
```

I ovenstående er det ikke variablen `b` der bliver ændret, men derimod det indhold som den peger på i hukommelsen, hvilket er indholdet af variablen `a`.

Man kunne undre sig over hvad formålet med pointere er, og hvis man kommer fra en Python, Ruby eller PHP baggrund, så giver de meget lidt mening. Men der findes specifikke situationer hvor en pointer kan være et meget nyttigt redskab.

Go blev oprindeligt designet til systemprogrammering og til at være et alternativ til C++. Dette betyder at Go blev udstyret med pointere sådan at man har mulighed for at "pille" direkte i data via brug af specifikke hukommelsesadresser. Pointere kan også bruges til at få programmer til at køre hurtigere idet man får direkte kontrol over hvor og hvordan data gemmes i hukommelsen. Selvom det er mikroskopiske forskelle, så er der forskel på hastigheden på udlæsning af en lang tekst streng der ligger spredt rundt omkring i hukommelsen, og så på en tekststreng der ligger samme sted, punkt efter punkt. Dette betyder samtidig også at hukommelsen bliver mindre fragmenteret.

Det er dog kun til systemprogrammering og programmering til [indlejrede systemer](https://da.wikipedia.org/wiki/Indlejret_system) at man har brug for den slags kontrol.

Grundlæggende set skal du ikke bruge pointere fremfor almindelige variabler. Pointere skal du kun bruge hvor du ikke kan bruge noget som helst andet, eller hvor du reelt har brug for at manipulere med indholdet på specifikke hukommelsesadresser.

Når man kender til globale variabler, kan man forledes til at tænke at en pointer og en global variabel lidt er det samme, men det er ikke korrekt. En global variabel er en variabel der kan tilgås alle steder fra. En pointer er en variabel der indeholder en hukommelsesadresse til hvor noget i hukommelsen bor.
