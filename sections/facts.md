# Fakta om Go #

## Statisk typet sprog ##

Go er et statisk typet programmeringssprog, hvilket vil sige at kompileren tjekker variablernes typer under kompilering. Dette betyder i praksis at du som programmør skal definere hvilken type værdi en given variabel skal indeholde, altså om det er f.eks. et tal eller en tekststreng. Det er ikke selve værdien der tjekkes, men derimod kun typen.

Et statisk typet sprog har den store fordel at type fejl opdages før programmet køres. Hvis jeg f.eks. har defineret en variabel til at være en tekststreng, men er kommet til at indtaste et tal som dens værdi, så vil kompileren give mig en fejl ved kompilering da variablens indhold ikke passer til den type jeg oprindeligt definerede variablen med. Jeg bliver dermed forhindret i at kompilere programmet, og skal rette fejlen før jeg kan fortsætte.

Dette er modsat et dynamisk typet programmeringssprog hvor der enten ikke eksisterer noget tjek af variabel typen, eller hvor dette tjek først sker under kørsel (dvs. run-time). Som programmør skal du ikke tænke på typer i et dynamisk typet programmeringssprog, og du kan blot give variablerne de værdier du ønsker. Dette gælder f.eks. programmeringssprog som PHP, Python, og Ruby.

Da der ikke er noget tjek af variabel typen før evt. under kørsel, kan du risikerer at lede længe efter fejl fordi du er kommet til at give en variabel en forkert værdi. Hvis det dynamiske programmeringssprog samtidig tillader at du ændre variabel typen blot ved at ændre indholdet, som i f.eks. PHP eller Python, så bliver fejlen heller ikke opdaget under kørsel.

Vi kan lave et lille program der demonstrerer dette fint i Go.

```go
package main

import "fmt"

func main() {

    // Først deklareres variablen til at være af typen "string".
    // Dette betyder at variablen skal indeholde en tekst streng.
	var foo string
    // Dernæst gives variablen en værdi der passer til typen.
	foo = "Hello world!"

    // Her deklareres variablen også til at være af typen "string".
	var bar string
    // Men da vi giver variablen et indhold af en anden type,
    // får vi en fejl af kompileren når vi forsøger at kompilere programmet.
	bar = 10

	fmt.Println(foo)
	fmt.Println(bar)
}
```

Go kompileren giver os følgende fejlbesked:

```
cannot use 10 (type int) as type string in assignment
```

I PHP og Python, der begge er dynamiske programmeringssprog, kan ovenstående fejl ikke opdages. Vi behøver ikke definere nogen type, og hvis vi ændre typen bliver dette ikke registreret som en fejl.

Et dynamisk programmeringssprog giver derfor programmøren den frihed at han ikke skal bekymre sig om variabel typer, men tilgengæld er det meget lettere for programmøren at komme til at lave fejl i koden.

Følgende program virker fint i Python:

```python
# Vi definerer variablen foo til at være af typen "string" ved
# at give den en tekst streng som indhold.
foo = "Hello world"
print foo

# Her ændrer vi typen til int uden at dette er et problem.
foo = 10
print foo
```

Og her er det samme eksempel i PHP:

```php
<?php
// Vi definerer variablen foo til at være af typen "string" ved
// at give den en tekst streng som indhold.
$foo = "Hello world";
print $foo;

// Her ændrer vi typen til int uden at dette er et problem.
$foo = 10;
print $foo;
```

Statisk typet programmeringssprog er derfor mere sikre at programmere i, og det er typisk svære at lave den slags fejl i koden.
