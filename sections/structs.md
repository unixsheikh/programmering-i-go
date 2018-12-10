# Structs #

Structs i Go er en type samling af felter. De er brugbare til at gruppere data sammen.

Lad os se på et simpelt eksempel:

```go
package main

import "fmt"

// Vi opretter en struct af type "person", og giver den felterne "navn" og "alder".
type Person struct {
    navn string
    alder int
}

func main() {

    // Med denne syntaks opretter vi en ny struct.
    fmt.Println(Person{"Brian", 20})

    // Du kan også oprette en struct ved at navngive felterne.
    fmt.Println(Person{navn: "Karina", alder: 30})

    // Hvis du udelader et felt får den sin naturlige nul værdi.
    fmt.Println(Person{name: "Martin"})

    // Du tilgår en struck's felter med et punktum.
    s := Person{navn: "Jonas", age: 50}
    fmt.Println(s.name)
}
```
