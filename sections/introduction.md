# Introduktion #

Programmeringssproget "Go", også kaldet "Golang", er et programmeringssprog der blev udviklet hos Google i 2007 af [Robert Griesemer](https://en.wikipedia.org/wiki/Robert_Griesemer), [Rob Pike](https://en.wikipedia.org/wiki/Rob_Pike), og [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson). I 2009 havde google allerede taget det i produktion, og det blev efterfølgende annonceret og udgivet som Open Source.

Udviklingen af Go startede med at Robert Griesemer, Rob Pike og Ken Thompson den 21 september 2007 sad og drøftede nogle af de problemer de havde med bl.a. C++ og andre programmeringssprog samt den meget lange kompileringstid der fulgte med i disse sprog.

De drøftede hvad de ville gøre anderledes hvis de skulle designe et nyt programmeringssprog, og en af dem tog nogle notater på en whiteboard. Efter et par dage fremstod der en klar idé og plan om hvordan det skulle gøres. Design af Go fortsatte på deltid og i parallel med andet ikke-relateret arbejde. I 2008 begyndte Ken Thompsom at arbejde på en kompiler som de kunne bruge til at undersøge ideerne. Kompileren udgav C kode. Midt på året havde projektet udviklet sig til et fuldtidsprojekt, og de var kommet så langt at de kunne forsøge sig på en produktionskompiler. I maj 2008 begyndte Ian Taylor, uafhængigt af projektet, at udvikle en Go frontend til GCC kompileren via det draft de havde lavet til Go specifikationen. Russ Cox sluttede sig til projektet i slutningen af 2008 og hjalp til med flytte sproget og bibliotekkerne fra prototype til virkelighed. Efterfølgende tilsluttede mange andre sig projektet og bidrog med både ideer og kode.

Rob Pike fortæller:

> Programmeringssproget Go blev udviklet i slutningen af 2007 som et svar på nogle af de problemer vi som udviklere så i infrastrukturen hos Google. Computer landskabet i dag har stort set ingen relation til det miljø i hvilket de sprog der bruges mest, som C++, Java, og Python, blev skabt i. De problemer der er opstået ved introduktionen af fler-kerne processorer, netværkssystemer, massive computer klynger, samt web udviklingsmodellen, blev der arbejdet udenom fremfor at man løste dem. Derudover har størrelsesordnen ændret sig markant. Programmerne på serverne i dag består af millioner af linjer af kode, og de bliver arbejdet på af flere hundrede eller sågar flere tusinde programører, og de bliver opdateret bogstavlig talt hver dag. For at gøre sagen værre så er tiden det tager at bygge disse programmer, selv på store kompilationsklynger, vokset til mange minutter, ja selv flere timer. Go blev designet og udviklet til at håndterer disse miljø mere produktivt.

Go blev altså født ud af en slags frustration over de nuværende programmeringssprog og miljøer. Programmering ansås for at være blevet for vanskeligt og valget af programmeringssprog bar på årsagen. Enten er man tvunget til at vælge effektiv kompilering og effektiv udførelse, eller også lettere udvikling, men meget langsommere implementering. Disse tre ting fandtes ikke i én kombination i nogle af de udbredte programmeringssprog.

Go er et forsøg på at kombinere den lettelse man opnår ved at bruge et dynamisk og fortolket sprog med effektiviseringen af et kompileret sprog. Samtidig forsøger det at være moderne med understøttelse af flere kerne og bedre netværksunderstøttelse.

Go er også designet til at være ultra hurtig til kompilering. Det må ikke tage mere end et par sekunder at bygge store eksekverbar filer på en enkelt computer. En del af dette er opnået ved at udvikle et meget simpelt, men samtidig meget udtrykfyldt sprog. Ligeledes automatisk hukommelseshåndtering, effektiv udførelse af programmer der kører samtidigt, effektiv håndtering af afhængigheder.

Ingen af de nuværende sprog havde denne sammensætning, hvorfor de følte et stort behov for et nyt sprog.

Ken Thompson var den der designede og implementerede det originale UNIX operativ system, og han var også opfinderen bag programmeringssproget B (den direkte forløber til programmeringssproget C). Han har også en af opfinderne til operativsystemet [Plan 9](https://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs) fra Bell Labs.

Robert Pike er bedst kendt for hans arbejde hos Bell Labs, hvor han også var en af medlemmerne på UNIX holdet. Ligeledes var han også med til at designe og udvikle Plan 9 og operativsystemet Inferno. Han har også været med til at udvikle programmeringssproget Limbo.

Pike er sammen med Brian Kernighan forfater til bogen [The Practice of Programming](https://en.wikipedia.org/wiki/The_Practice_of_Programming) og [The Unix Programming Environment](https://en.wikipedia.org/wiki/The_Unix_Programming_Environment). Sammen med Ken Thompson er han også udvikleren af UTF-8.

Robert Griesemer er en af udviklerne bag Google's V8 JavaScript motor. Han har også udviklet på Chuppy, der er en distribueret låsemekanisme til Google's GFS distribuerede filsystem og en masse andet.

Programmeringssproget Go er således udviklet af nogle af verdens mest erfarne og dygtige mennesker.

Det første jeg lagde mærke til da jeg besluttede mig for at tage et kig på Go var at den fuldstændig mangel på megen af den funktionalitet der normalt forbindes med et "moderne" programmeringssprog, og som flere sprog vedvarende bliver proppet med.

Som et eksempel kan nævnes både C++ og PHP der i de senere år bliver ved med at vokse med mere og mere funktionalitet til f.eks. bedre understøttelse af det objekt orienterede paradigme.

I kontrast til dette er Go nærmest blevet renset for alle disse ting og det er med god grund. Go er ikke alene udviklet hos Google til at gøre det som Google gør bedst, men det er samtidig udviklet af nogle af de gamle mestre i industrien.

Det der gør programmeringssproget Go til en fantastisk designmæssig bedrift er netop det faktum at designerne havde nogle meget negative reaktioner til de programmeringssprog som de betragter som værende akademiske, teoretiske, eller uproduktive.

Nogle mennesker mener at Go ignorerer alle de fundamentale fremskridt indenfor udvikling af programmeringssprog der er opnået indenfor de sidste 40 års. Det betragter Go som et sprog der er låst fast i 70'erne, og som er blevet designet til middelmådige programmører, men intet kunne være fjernere fra sandheden!

Det udviklerne har gjort er ikke at ignorere de sidste 40 års udvikling indenfor programmeringssprog, derimod har de sorteret alt det overflødige og unødvendigt komplekse fra og smidt det i skraldespanden, og har i stedet valgt at fokuserer på at opnå meget af den samme funktionalitet, blot på en meget mere simpel og effektiv måde, og det mener jeg personligt at de har haft stor succes med.

Hver eneste funktionalitet i Go er blevet udtænkt meget nøje, og dernæst implementeret på den mest effektive måde.

I Go er der ikke noget rent objekt orienteret, ikke noget rent funktionelt, ingen klasser, ingen "inheritance" (hvor klasser arver fra andre klasser), og en masse andet funktionalitet eksisterer ikke.

Men det betyder ikke at Go ikke understøtter objekt orienteret programmering eller funktionel programmering, det gør Go, det bliver bare implementeret på en anderledes og utrolig simpel måde.

Resultatet af Go's design er at man kan opnår meget af den samme funktionalitet kendt fra programmeringssprog som f.eks. Java og C++, men på nogle meget mere simple måder.

Man kan sige at i Go er der meget mindre at holde øje med, men ikke mindre man kan opnå.

Resultatet er nogle meget effektive programmer der er meget lettere at vedligeholde.

Hvis du vil vide mere om udviklingen af Go kan artiklen [Go at Google: Language Design in the Service of Software Engineering](https://talks.golang.org/2012/splash.article), der er en forkortet tale som Rob Pike gav på en konference i Tucson, Arizona i 2012, anbefales. Ligeledes følgende videoer på YouTube:

 * [https://www.youtube.com/watch?v=FTl0tl9BGdc](https://www.youtube.com/watch?v=FTl0tl9BGdc)
 * [https://www.youtube.com/watch?v=rFejpH_tAHM](https://www.youtube.com/watch?v=rFejpH_tAHM)
 * [https://www.youtube.com/watch?v=sln-gJaURzk](https://www.youtube.com/watch?v=sln-gJaURzk)
