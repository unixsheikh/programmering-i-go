# Konstanter #

En konstant minder om en variabel, det er også en pladsholder i computerens hukommelse til noget data. Forskellen imellem en variabel og en konstant ligger i at en konstant ikke kan få ændret sit indhold, når den først er erklæret.

I Go erklæres en konstant med nøgleordet `const`

I Go (og mange andre programmeringssprog) er det god kutyme at gøre brug af store bogstaver, når man definerer konstanter. På den måde er de lette at få øje på i koden, og de er dermed også lette at skelne fra variabler.

```go
const MINTEKST string = "Dette er en konstant"
```

Hvis du forsøger at ændre værdien af en konstant der allerede er sat, får du en fejl.

```go
const MITTAL int = 100

// Dette virker ikke!
MITTAL = 200
```

Når man forsøger at ændre indholdet af en konstant giver Go følgende fejlbesked:

```
cannot assign to MITTAL
```

Hvilket blot betyder, at Go ikke er i stand til at ændre værdien af konstanten `MITTAL` da den allerede er sat.
