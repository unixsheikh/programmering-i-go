# Pakker #

I Go bliver programmer organiseret i en mappestruktur kaldet for "arbejdsrum" (workspace). Et arbejdsrum er blot et bibliotek der indeholder en eller flere af dine Go applikationer. Et arbejdsrum indeholder tre undermapper i roden.

Følgende er et eksempel på et arbejdsrum kaldet "GoArbejdsMappe" i din hjemmemappe.

```
GoArbejdsMappe/
  bin/
  pkg/
  src/
```

  * bin<br>Indeholder dine eksekverbar filer efter at dine programmer er blevet kompilerede.
  * pkg<br>Indeholder Go pakke objekter.
  * src<br>Indeholder kildekoden opdelt i pakker. Du skriver dine Go programmer i denne mappe.

Go programmer konstrueres ved at linke "pakker" sammen. En pakke kan være sammensat af en eller flere filer med kildekode der sammen deklarerer konstanter, variabler, typer og funktioner som hører sammen i pakken, og som alle er tilgængelige for filer i den samme pakke. Disse elementer kan så "eksporteres" så de også kan benyttes i andre pakker.

I en og samme pakke kan der ikke eksistere to identiske deklarationer. Dvs. der kan f.eks. ikke eksistere to funktioner med samme navn i en og samme pakke.

Pakker i Go minder om det der hedder "namespaces" i andre programmeringssprog.

Før du kan udvikle et Go program skal du specificere et arbejdsrum. Dette gør du med GOPATH miljø variablen.

```
$ export GOPATH=/$HOME/GoArbejdsMappe
```

En god måde at organisere et Go program på er ved at bruge mappenavne som pakkenavne.

```
GoArbejdsMappe/
  src/
    foo/
      bar/
        a.go
        b.go
        c.go
      main.go
```

I _GoArbejdsMappe_ under _src_ har vi en pakke kaldet _foo_. _foo_ indeholder en _main.go_, der er selve hovedfilen som Go skal bruge. Derudover indeholder _foo_ en lokal pakke kaldet _bar_.

Et pakkenavn specificeres via nøgleordet **package**. _main.go_ skal altid tilhøre _main_ pakken, og det kan ikke laves om.

Go's standard bibliotek kommer med et hav af rigtigt gode pakker der alle kan bruges til at opbygge forskellige programmer. F.eks. indeholder pakken _database/sql_ et interface til at arbejde med SQL databaser, mens pakken _net/http_ giver HTTP klient og server implementeringer.

Pakkerne der følger med i Go's standard bibliotek kan ses på: [https://golang.org/pkg/](https://golang.org/pkg/)

Go har indbygget funktionalitet til effektiv benyttelse af eksterne pakker uanset om det drejer sig om pakker fra Go's eget standard bibliotek, eller om det drejer sig om tredjeparts pakker på f.eks. Github.

Pakker bliver importeret i Go med nøgleordet **import**.

Hvis vi tager udgangspunkt i ovenstående eksempel ville filerne se sådan ud:

_a.go_

```go
package bar

import "fmt"

func Blip() {
	fmt.Println("Hej, jeg er Blip!")
}
```

Pakken [fmt](https://golang.org/pkg/fmt/) er en pakke i Go's standard bibliotek der implementerer forskellige input og output funktioner som svarer lidt til C's _printf_ og _scanf_.

_b.go_

```go
package bar

import "fmt"

func Blop() {
	fmt.Println("Hej, jeg er Blop!")
}
```

_c.go_

```go
package bar

import "fmt"

func Blup() {
	fmt.Println("Hej, jeg er Blup!")
}
```

_main.go_

```go
package main

import (
	"fmt"
    "foo/bar"
)

func main() {
	fmt.Println("Hej, jeg er main!")

	bar.Blip()
	bar.Blop()
	bar.Blup()
}
```

Filerne _a.go_, _b.go_ og _c.go_ tilhører alle den samme lokale pakke fordi de ligger i den samme undermappe. Navnet på en pakke behøver ikke være det samme som navnet på et bibliotek, men det er praktisk at benytte det samme navn.

I _main.go_ bliver to forskellige pakker importeret. Først bliver pakken _fmt_ fra Go's standard bibliotek importeret. Dernæst bliver den lokale pakke _bar_ importeret. Vi importerer den lokale pakke _bar_ ved at bruge pakkenavnet _foo_. Dette gør vi fordi vi har sat vores GOPATH variabel til at pege på `$HOME/GoArbejdsMappe`, og Go importerer lokale pakker relativt i forhold til GOPATH.

Hvis du prøver at oprette ovenstående filer kan du teste programmet ved at bruge kommandoen:

```
$ go run GoArbejdsMappe/src/foo/main.go
Hej, jeg er main!
Hej, jeg er Blip!
Hej, jeg er Blop!
Hej, jeg er Blup!
```

**Bemærk!** _go run_ virker **kun** med filer indeholdende Go kildekode, den virker ikke med mapper. _go install_ derimod virker **kun** med mapper.

_go run_ kompilerer filen og kører programmet, men den gemmer ikke det kompilerede program.

Hvis du gerne vil oprette en eksekverbar fil af dit program, skal du benytte _go install_. Det er ligegyldigt i hvilken mappe du befinder dig, når du bruger kommandoen _go install_, du skal blot specificere navnet på den pakke du ønsker at installere.

```
$ cd $HOME
$ go install foo
```

Din mappestruktur ser nu sådan ud:

```
$ tree
.
└── GoArbejdsMappe
    ├── bin
    │   └── foo
    ├── pkg
    │   └── linux_amd64
    │       └── foo
    │           └── bar.a
    └── src
        └── foo
            ├── bar
            │   ├── a.go
            │   ├── b.go
            │   └── c.go
            └── main.go
```

Go har oprettet mapperne _bin_ og _pkg_. Og den eksekverbare fil ligger i _bin_.

```
./GoArbejdsMappe/bin/foo
Hej, jeg er main!
Hej, jeg er Blip!
Hej, jeg er Blop!
Hej, jeg er Blup!
```

Bemærk at funktionerne _Blip_, _Blop_ og _Blup_ alle starter med et stort begyndelsesbogstav. Det er ikke tilfældigt, men Go's måde at eksportere ting på.

Når en deklaration af en variabel, en konstant, en funktion eller en struct starter med et stort begyndelsesbogstav, så bliver det der er blevet deklareret "synligt" for anden kode udenfor den pakke som deklarationen finder sted i. Man siger at den pågældende ting der blev deklareret er blevet "eksporteret". Deklarationer der starter med et lille begyndelsesbogstav, bliver ikke eksporterede, og disse ting er kun synlige for kode der tilhører den samme pakke.

Prøv f.eks. at lave _Blop_ om til _blop_ med et lille "b". Hvis du gør det, vil du ikke længere kunne kalde funktionen inde fra _main.go_. Dette skyles at _blob_ nu kun kan ses af kode fra samme pakke som den pakke _blob_ tilhører, altså pakken "bar". Da kode i _main.go_ tilhører pakken "main", kan den ikke se de funktioner der ikke er blevet eksporterede.

```
GoArbejdsMappe/src/foo/main.go:11: cannot refer to unexported name bar.blip
GoArbejdsMappe/src/foo/main.go:11: undefined: bar.blip
```

Denne funktionalitet kaldes for "synlighed" eller "navnerum", og i programmering af computere bruges synlighed typisk med henblik på at gruppere symboler og identifikatorer omkring en bestemt funktionalitet, og til at undgå navne kollisioner mellem flere identifikatorer, der deler det samme navn.

_main.go_ kan ikke længere se funktionen _blip()_.

Lad os prøve at lave filerne lidt om og så køre _go install foo_ igen.

_a.go_

```go
package bar

import "fmt"

func Blip() {
	fmt.Println("Hej, jeg er Blip!")
}

// Funktionen baz() er privat, og den kan kun kaldes
// fra a.go eller fra andre filer i samme pakke, som
// f.eks. b.go eller c.go.
func baz() {
	fmt.Println("Hej, jeg er private baz!")
}
```

_b.go_

```go
package bar

import "fmt"

func Blop() {
	fmt.Println("Hej, jeg er Blop!")

	// Her kalder vi funktionen baz() fra a.go
	// Det kan vi fordi a.go og b.go er i samme pakke.
	baz()
}
```

_c.go_

```go
package bar

import "fmt"

func Blup() {
	fmt.Println("Hej, jeg er Blup!")
}
```

_main.go_

```go
package main

import (
	"fmt"
	"foo/bar"
)

func main() {
	fmt.Println("Hej, jeg er main!")

	bar.Blip()
	bar.Blop()
	bar.Blup()
}
```

```
$ go install foo
$ ./GoArbejdsMappe/bin/foo
Hej, jeg er main!
Hej, jeg er Blip!
Hej, jeg er Blop!
Hej, jeg er private baz!
Hej, jeg er Blup!
```

Funktionen _baz()_ og _Blop()_ er i samme pakke, hvilket gør at _Blop()_ kan se _baz()_ selvom den er privat. Hvis vi forsøger at kalde _baz()_ direkte indefra _main()_ får vi en fejl idet _main()_ ikke kan se _baz()_ direkte. Men da _main()_ kan se _Blop()_, fordi _Blop()_ er blevet eksporteret via det store begyndelsesbogstav, og da _Blop()_ kan se _baz()_, bliver _baz()_ kaldt.

Ovenstående kan godt virke lidt forvirrende, og det anbefales at du læser [How to Write Go Code](https://golang.org/doc/code.html)

Derudover er det en god idé at eksperimentere lidt med ovenstående indtil du har fået overblik over hvordan det virker.

De fleste mennesker føler en trang til at yde modstand imod måden tingene er sat op på i Go, og det er muligt at gøre tingenen på en anden måde, men målet med den faste opsætning i Go er at få Go udviklere til at arbejde struktureret ens, og når man kigger på hvordan tingene fungere i mange andre programmeringssprog, hvor netop disse ting er til konstant debat og diskussion, så har udviklerne bag Go lukket diskussionen og gennemført en ensartet og effektiv måde at arbejde på. Det fungerer rigtig godt, og kræver blot en lille smule tilvending i starten.

## Mere om eksterne pakker ##

**UNDER UDVIKLING**
