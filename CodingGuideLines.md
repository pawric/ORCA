# Coding Guildelines

## Wstęp

Dokument ten ma być próbą ustalenia jednoznacznych wytycznych co do tworzenia kodu w projektach ORCA.

### Geneza

Ideę ujednolicenia między innymi konwencji nazewniczych dostrzegaliśmy wszyscy już od dawna. Długo i wiele się o tym mówiło, ale nie powstała żadna porządna notatka z ustaleń dlatego często zdarza się nam o tych ustaleniach zapominać. Dlatego właśnie postanowiłem zebrać ekipę, która to zajmie się zbieraniem zasad ustalanych podczas kolejnych dyskusji i nanoszeniem ich w niniejszym dokumencie. 
	
Ma on głównie służyć temu by kontrolować wersję i zmiany w nim wprowadzane a także łatwość dostępu do niego. Stąd jego umiejscowienie na GitHub'ie. Istnieje duże prawdopodobieństwo, że dokument w wersji finalnej zagości na Xwiki.

### Zmiany

Zmiany w dokumencie należy wprowadzać z częstotliwością odpowiadającą postępującym ustaleniom aby niczego nie zgubić. Zmian można dokonywać bezpośrednio w pliku na repozytorium a potem zgłosić je poprzez wystawienie odpowiedniego **pull-request**.
	
Formatowanie dokumentu powinno być zgodne z [GitHub Mark Down](https://guides.github.com/features/mastering-markdown/). Przydatne do tego narzędzie to (między innymi): [stackedit](https://stackedit.io/).

Zawsze należy załączyć przykłady. Oznacza to, że jeśli ustalamy coś i chcemy zanotować to tutaj należy podać przykład zarówno błędnego jak i poprawnego kodu.

## Spis treści.

1. [Generalna konwencja](#generalna-konwencja)
2. [Komentowanie kodu](#komentowanie-kodu)
3. [Nazewnictwo modułów](#nazewnictwo-modułów)
4. [Zawartość modułów](#zawartość-modułów)
5. [Nazewnictwo identyfikatorów](#nazewnictwo-identyfikatorów)
6. [Nazewnictwo typów nie będących klasami](#nazewnictwo-typów-nie-będących-klasami)
7. [Nazewnictwo klas i interfejsów](#nazewnictwo-klas-i-interfejsów)

## Generalna konwencja

###### [Zasada [N001](#zasada-n001)]

Jeśli nie wiesz jak kod powinien wyglądać w konkretnej sytuacji a nie jest to sprecyzowane w tym dokumencie zawsze posługuj sie [Object Pascal Style Guide](http://edn.embarcadero.com/article/10280).

*Dlaczego?*: Punktem wyjścia do wypracowania zasad produkowania kodu w naszych projektach jest [Object Pascal Style Guide](http://edn.embarcadero.com/article/10280) ustalamy jedynie odstępstwa od zasad tam wskazanych. A w przypadkach, które nie są określone jeszcze w tym dokumencie nadrzędny jest Object Pascal Style Guide, który w dalszej części będzie zastępowany skrótem (**OPSG**).

**[Powrót do góry](#spis-treści)**

## Komentowanie kodu

###### [Styl [S001](#styl-s001)]
Komentarze w kodzie o ile je stosujemy powinny być jasne i związane z implementowaną funkcjonalnością. Generalnie nie powinno się komentować kodu bo jesli czujesz, że masz potrzebę coś w nim dodatkowo wyjasnić to znaczy przeważnie, że jest zbyt zagmatwany by go zorzumieć po przeczytaniu. Niemniej jednak jeśli już musisz coś zakomentować to zrób to w taki sposób aby inni nie mieli problemu z odczytaniem komentarza.

*Przykład nadmiarowego komentarza:*
````pascal
// funkcja sumuje dwie wartosci
function Sum(const a, b: Integer): Integer;
begin
	// dodajemy a i b zwracamy wynik
	Result := a +b;
end;
````

###### [Styl [S002](#styl-s002)]
Jednoliniowe komentarze zawsze zaczynaj komentować nad linią kodu, którego komentarz dotyczy i zaczynaj od **//**a następnie postaw spację i dopiero pisz komentarz.

*Przykład błędnego komentowania*
````pascal
function Foo(): Integer; //funkcja robi Foo
````

*Przykład poprawnego komentarza*
````pascal
// funkcja robi Foo
function Foo(): Integer; 
````

###### [Styl [S003](#styl-s003)]
Komentarze blokowe zawsze zaczynaj od znaków (* po czym zrób nową linię i zacznij pisać komentarz zakończ komentarz w nowej linii znakami *).

##### Generalne zasady

###### [Styl [S004](#styl-s004)]
Nie używaj jakichkolwiek ozdobników w komentarzach (chodzi tu o obramowania w postaci znaków ASCI, czy też jakichś ACII Artów).

*Dlaczego?*: Kiedyś takie rzeczy były wymagane w kodzie w każdym unicie pisało się licencję i wszystkie informacje o włascicielu czy autorze kodu. Zresztą w niektórych produkcjach ta konwencja nadal obowiązuje. W naszym przypadku nie ma to sensu, gdyż wszystko co napiszemy jest własnością firmy i podlega jej licencjom. Dodatkowo stwarza to problem utrzymowaniowy.

*Informacja*: Jest to odstępstwo do punktów [2.2](http://edn.embarcadero.com/article/10280#2.2) i [2.2.1](http://edn.embarcadero.com/article/10280#2.2.1) z [**OPSG**](#generalna-konwencja).

*Przykłady nadmiarowego komentarza:*
````pascal
{*************************************************************************************************
* Autor: Janek Zenek
* Data wyprodukowania: 2045-01-01
* Opis: TClassFoo Realizuje zadania Foo 
**************************************************************************************************}
type
  TClassFoo = class(TObject)
  public 
	procedure KillSystem();
  end; 
````

###### [Styl [S005](#styl-s005)]
Łam linie do ilości znaków określonych przez **Right Margin** we właściwościach środowiska w edytorze. 

*Dlaczego?*: Ponieważ nie zawsze i nie wszyscy pracują z kodem na monitorach dużej rozdzielczości. Często w takich przypadkach odczytanie długiego komentarza jest po prostu trudne.

###### [Styl [S006](#styl-s006)]
Jeśli tworzysz interfejs/klasę to zawsze dokumentuj w komenatrzu przynajmniej kluczowe znaczenie interfejsu przy pomocy odpowiedniego rozszerzenia IDE (uwaga ta dotyczy, też metod).

*Dlaczego?*: Otóż ze względu na to iż używamy automatycznego narzędzia do generowania dokumentacji. Dzięki o wiele łatwiej jest przeczytać co dana metoda/klasa/interfejs reprezentuje jeślnie w dokumentacji to już w samym kodzie.

###### [Styl [S007](#styl-s007)]
Nie twórz komentarzy w postaci **TODO**.

*Dlaczego?*: I tak nikt tego nie przeczyta kod się pewnie w tym miejscu sypnie a i ty sam zapomnisz za jakiś czas o tym komentarzu.

**[Powrót do góry](#spis-treści)**
	
## Nazewnictwo modułów

###### [Zasada [N002](#zasada-n002)]
Zawsze zaczynaj nazwę nowego modułu od znaku **u** (od unit), po czym dodaj odpowiedni wyróżnik i dopiero nazwę modułu stosując notację [PascalCase/UpperCamelCase](https://pl.wikipedia.org/wiki/PascalCase). Dopuszczalne są poniższ wyróżniki:

- Dla modułu zawierającego kod formy lub ramki - **frm**
- Dla modułu będącego pochodną DataModule - **DM**
- Dla modułu nie mającego związku z żadnym z powyższych nie stosujemy żadnego wyróżnika
	
**Przykłady nazewnictwa modułów:**
````pascal
unit ufrmMain.pas; //moduł zawierający kod formy
unit uDMCustomer.pas; //moduł pochodny od TDataModule
unit uMojaWlasnaSuperKlasaObfitosci.pas; //moduł zawierający kod klasy obfitości ;)
````

*Dlaczego?*: Jest to stan zastany. Ze względu na olbrzymią ilość modułów i kodu zmiana tego byłaby wręcz samobójstwem dlatego po prostu tak przyjmujemy.

*Informacja*: Jest to odstępstwo od informacji dotyczących nazywania plików źródłowych zawratych w punktach [2.0](http://edn.embarcadero.com/article/10280#2.0) i [2.1](http://edn.embarcadero.com/article/10280#2.1) (**OPSG**)[#generalna-konwencja].

**[Powrót do góry](#spis-treści)**

## Zawartość modułów

###### [Zasada [N003](#zasada-n003)]
Zawsze dbaj o to by zawartość modułu szczególnie w sekcji **interface** odpowiadała chociaż tematycznie jego nazwie. Nawet w przypadku gdy traktujemy moduł jako brakujące w naszym języku **namespace** należy zadbać o to by moduł nie był kombajnem do wszystkiego, a także o to by udostępniać (w miarę możliwości) tylko faktycznie publiczne API. 

###### [Zasada [N004](#zasada-n004)]
Dbaj o to by moduł był w miarę możliwości mały pod względem ilości linii kodu.

###### [Zasada [N005](#zasada-n005)]
Unikaj generowania zbędnych zależności. W sekcji **uses** zarówno w części **implementation** jak i **interface** powinno się włączać tylko i wyłącznie moduły potrzebne do implementacji, wszystkie nadmiarowe powinny zostać usunięte.

**[Powrót do góry](#spis-treści)**
	
## Nazewnictwo identyfikatorów

- Podczas budowania nazwy identyfikatora powinieneś się starać jasno okreslić jego znaczenie nawet jeśli nazwa będzie długa. Niedopuszczalne jest stosowanie nazw identyfikatorów jednoliterowych nie mówiących nic. Wyjątek stanowią lokalne zmienne kontrolne pętli.
		
	Przykład błędny:
	````pascal
	function ObliczSume(const aTowary: TTowaryLista): Currency;
	var
	  a: Currency;
	  i: Integer;
	begin
	  for i:=0 to aTowary.Count -1 do 
	  begin
		a := aTowary[i].Cena;
		Result := Result + a;
	  end;
	end;
	````
	
	Przykład poprawny:
	````pascal
	function ObliczSume(const aTowary: TTowaryLista): Currency;
	var
	  v_CenaTowaru: Currency;
	  i: Integer;
	begin
	  for i:=0 to aTowary.Count -1 do 
	  begin
		v_CenaTowaru := aTowary[i].Cena;
		Result := Result + v_CenaTowaru;
	  end;
	end;
	````
	
- Stosuj notację [PascalCase/UpperCamelCase](https://pl.wikipedia.org/wiki/PascalCase) zwracając uwagę na to by każde nowe słowo w nazwie identyfikatora zaczynało się z nowej litery.
- Unikaj "_"(underscore) w nazwach identyfikatorów (stosujemy kilka wyjątków od tej reguły).
- Zmienne lokalne w metodach nazywaj zaczynając od prefixu **v_**

	Przykład:
	````pascal
	function Foo(): Integer;
	var
	  // poprawnie nazwany identyfikator zmiennej lokalnej w metodzie
	  v_XPosition: Integer;
	  // niepoprawnie nazwany identyfikator zmiennej lokalnej w metodzie
	  yPosition: Integer;
	begin
	end;
	````
	
- Zmienne globalne (o ile życie zmusi Cię do ich zastosowania) nazywaj zawsze zaczynając od prefixu **g_**.
- Nazwy metod w testach jednostkowych (do debaty).
- Nazwy stałych (do debaty).

## Nazewnictwo typów nie będących klasami
## Nazewnictwo klas i interfejsów
