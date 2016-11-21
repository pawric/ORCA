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
2. [Generalny styl kodowania](#generalny-styl-kodowania)
3. [Komentowanie kodu](#komentowanie-kodu)
4. [Nazewnictwo modułów](#nazewnictwo-modułów)
5. [Zawartość modułów](#zawartość-modułów)
6. [Nazewnictwo identyfikatorów](#nazewnictwo-identyfikatorów)
7. [Nazewnictwo typów](#nazewnictwo-typów)
8. [Nazewnictwo metod funkcji procedur](#nazewnictwo-metod-funkcji-procedur)
9. [Baza danych](#baza-danych)
10. [Nazewnictwo katalogów](#nazewnictwo-katalogów)

## Generalna konwencja

###### [Zasada [N001](#zasada-n001)]
Jeśli nie wiesz jak kod powinien wyglądać w konkretnej sytuacji a nie jest to sprecyzowane w tym dokumencie zawsze posługuj sie [Object Pascal Style Guide](http://edn.embarcadero.com/article/10280).

*Dlaczego?*: Punktem wyjścia do wypracowania zasad produkowania kodu w naszych projektach jest [Object Pascal Style Guide](http://edn.embarcadero.com/article/10280) ustalamy jedynie odstępstwa od zasad tam wskazanych. A w przypadkach, które nie są określone jeszcze w tym dokumencie nadrzędny jest Object Pascal Style Guide, który w dalszej części będzie zastępowany skrótem (**OPSG**).

**[Powrót do góry](#spis-treści)**

## Generalny styl kodowania

###### [Styl [S001](#styl-s001)]
Jeśli robisz wcięcie zawsze rób to przy użyciu 2 spacji. Można ustawić taką opcję w IDE aby wykonywało tę robotę za Ciebie po wciśnięciu **tabulatora**.

###### [Styl [S002](#styl-s002)]
Łam linie zawsze po osiągnięciu długości 120 znaków. Przy czym jeśli dokonujesz łamania to zrób to w taki sposób by nie utrudniać odczytania kodu innym. Szerokość prawego marginesu tak jak i jego widoczność ustawia się IDE. Podczas łamania linii w przypadku deklaracji metod nie oddzielaj typu argumentu od jego nazwy. Pamiętaj także by nowo utworzona linia zawierała odpowiednie wcięcie.

**Przykłady**

````pascal
// przykład błędnego złamania tekstu w lini ponieważ oddzielono typ argumentu od jego nazwy. 
// Nie zachowano także wcięcia
function Foo(const ANazwaArgumentu: TTypArgumentu; AInnyArgument: 
TInnyArgument): Integer;
// przykład poprawnego złamania tekstu
function Foo(const ANazwaArgumentu: TTypArgumentu; 
	AInnyArgument: TInnyArgument): Integer;
	
//przykład błędnego złamania tekstu w warunku logicznym 
if (a <> 
	b) and (c = 
	d) and (d <> a) then 
begin
end;
	
// przykład poprawnego złamania tekstu w warunku logicznym
if (a <> b) and 
  (c = d) and 
  (d <> a) then 
begin
end;
````

###### [Styl [S003](#styl-s003)]
Gdy stosujesz instrukcje blokowe zawsze zamykaj kod, który obejmują w klamrę **begin** na początku bloku w nowej linii **end** na końcu bloku w nowej linii. Wyjątkiem od tej zasady są instrukcje blokowe, które w swoim bloku zawierają tylko jedną linię kodu. 

###### [Styl [S004](#styl-s004)]
Pamiętaj zawsze by stawiać średnik po słowie kluczowym **end**.

###### [Styl [S005](#styl-s005)]
Pamiętaj by zmiennych i argumentów w kodzie używać dokładnie tak jak są zadeklarowane. Zmienianie choćby wielkości literek w kodzie względem deklaracji jest złe.

###### [Styl [S006](#styl-s006)]
W przypadku gdy konstruktor klasy posiada dużą liczbę argumentów, należy każdy z nich podczas inicjowania tej klasy zapisać w nowej linii.

**[Powrót do góry](#spis-treści)**

## Komentowanie kodu

###### [Styl [S007](#styl-s007)]
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

###### [Styl [S008](#styl-s008)]
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

###### [Styl [S009](#styl-s009)]
Komentarze blokowe zawsze zaczynaj od znaków (* po czym zrób nową linię i zacznij pisać komentarz zakończ komentarz w nowej linii znakami *).

##### Generalne zasady

###### [Styl [S010](#styl-s011)]
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

###### [Styl [S011](#styl-s011)]
Łam linie do ilości znaków określonych przez **Right Margin** we właściwościach środowiska w edytorze. 

*Dlaczego?*: Ponieważ nie zawsze i nie wszyscy pracują z kodem na monitorach dużej rozdzielczości. Często w takich przypadkach odczytanie długiego komentarza jest po prostu trudne.

###### [Styl [S012](#styl-s012)]
Jeśli tworzysz interfejs/klasę to zawsze dokumentuj w komenatrzu przynajmniej kluczowe znaczenie interfejsu przy pomocy odpowiedniego rozszerzenia IDE (uwaga ta dotyczy, też metod).

*Dlaczego?*: Otóż ze względu na to iż używamy automatycznego narzędzia do generowania dokumentacji. Dzięki o wiele łatwiej jest przeczytać co dana metoda/klasa/interfejs reprezentuje jeślnie w dokumentacji to już w samym kodzie.

###### [Styl [S013](#styl-s013)]
Nie twórz komentarzy w postaci **TODO**.

*Dlaczego?*: I tak nikt tego nie przeczyta kod się pewnie w tym miejscu sypnie a i ty sam zapomnisz za jakiś czas o tym komentarzu.

**[Powrót do góry](#spis-treści)**
	
## Nazewnictwo modułów

###### [Zasada [N002](#zasada-n002)]
Zawsze zaczynaj nazwę nowego modułu od znaku **u** (od unit), po czym dodaj odpowiedni wyróżnik i dopiero nazwę modułu stosując notację [PascalCase/UpperCamelCase](https://pl.wikipedia.org/wiki/PascalCase). Nazwa modułu może być zbudowana tylko i wyłącznie wg poniższego formatu (*ustalenie z dnia 2016-10-28:ORCA OOP*)

**u[NazwaModulu][WyróznikModułu].pas**

gdzie 

- **NazwaModułu** jest polską nazwą stosowną do domeny, której dany moduł dotyczy,
- **WyróznikModułu** jest angielską specyfikacją tego co moduł zawiera.
	
Budując pełną nazwę pliku modułu zawsze używaj całych słów (zarówno w **NazwieModułu** jak i **WyróżnikuModułu**), bedących rzeczownkiami.

**Przykłady nazewnictwa modułów:**
````pascal
unit uKlientForm.pas; //moduł zawierający kod formy związany domenowo z klientem
unit uKlientFrame.pas //moduł zawierający kod ramki związany domenowo z klientem
unit uKlientDataModule.pas; //moduł pochodny od TDataModule związany domenowo 
unit uMojaWlasnaSuperKlasaObfitosciInterface.pas; //moduł zawierający deklarację interfejsu 
unit uMojaWlasnaSuperKlasaObfitosciClass.pas; //moduł zawierający kod klasy obfitości  ??
unit uKlientList.pas; //moduł zawierający listę, której elemntami są encje typu TKlient
````

*Dlaczego?*: Istniejący kod, z kórym pracujemy nie posiadał jakiejś sztywnej konwencji w tym zakresie w związku z tym powstała masa modułów, których nazwy często są mylne, lub nie mówiące nic na pierwszy rzut, a czasem wręcz trudne do wymówienia. Uchwałą z dnia 2016-10-28 na spotkaniu zespołu została ustalna taka a nie inna konwencja nazewnictwa modułów i należy ją stosować. W przypadku gdy modyfikujemy jakiś moduł, którego nazwa nie spełnia wymogów tej konwencji, jesteśmy zobligowani do dostosowania jego nazwy do nowej konwencji oczywiście w miarę możliwości.

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

###### [Zasada [N006](#zasada-n006)]
Zawsze nadawaj identyfikatorom znaczenie odpowiednie do tego co reprezentują nawet jeśli to spowoduje potrzebę wygenerowania długiej nazwy identyfikatora.

###### [Zasada [N007](#zasada-n007)]
Niedopuszczalne jest stosowanie nazw identyfikatorów jednoliterowych nie mówiących nic. Wyjątek stanowią lokalne zmienne kontrolne pętli.
		
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
	
###### [Zasada [N008](#zasada-n008)]
Stosuj notację [PascalCase/UpperCamelCase](https://pl.wikipedia.org/wiki/PascalCase) zwracając uwagę na to by każde nowe słowo w nazwie identyfikatora zaczynało się z nowej litery.

###### [Zasada [N009](#zasada-n009)]
Unikaj **"_"(underscore)** w nazwach identyfikatorów wyjątkami od tej reguły są [N010](#zasada-n010) oraz [N011](#zasada-n011).

*Dlaczego?*: Taka konwencja.

###### [Zasada [N010](#zasada-n010)]
**Zmienne lokalne** w metodach zawsze nazywaj zaczynając od prefixu **v_**.

*Dlaczego?* Aby nie pomiksować się czasem z nazwami argumentów czy stałych globalnych funkjonujących już w kodzie. W przypadku gdy lokalna zmienna metody będzie miała taką samą nazwę jak zmienna globalna dostępna w scope kompilator zawsze będzie używał zmiennej globalnej.

**Przykład błędny**

````pascal
var
  Cena: Currency;
  
function Foo(): Currency;
var
  Cena: Currency;
begin
end;
````

**Przykład poprawny**

````pascal
var
  cena: Currency;
  
function Foo(): Currency;
var
  v_Cena: Currency;
begin
end;
````

###### [Zasada [N011](#zasada-n011)]
**Zmienne globalne** (o ile życie zmusi Cię do ich zastosowania - czyli masz przystawiony pistolet do głowy i każą Ci zdefiniować zmienną glablaną) nazywaj zawsze zaczynając od prefixu **g_**.

*Dlaczego?*: Aby nie nadpisać wartości zmiennych lokalnych metod lub ich argumentów występujących w zasięgu scope.

**Przykład błędny**

````pascal
var
  Cena: Currency;
  
function Foo(): Currency;
var
  Cena: Currency;
begin
end;
````

**Przykład poprawny**

````pascal
var
  g_Cena: Currency;
  
function Foo(): Currency;
var
  Cena: Currency;
begin
end;
````

###### [Zasada [N012](#zasada-n012)]

- Podczas definiowania nazwy stałych globalnych używaj notacji w postaci WIELKICH_LITER_ROZDZIELONYCH_UNDERSCORE.
- Podczas definiowania nazwy stałych lokalnych używaj notacji [PascalCase/UpperCamelCase](https://pl.wikipedia.org/wiki/PascalCase) poprzedzając ją znakiem *c* (małe c - od const).

*Dlaczego?* : Jest to efekt wynikaów ankiety przeprowadzonej w dniu 2016-11-02 pośród członków zespołu.

**Przykład**

````pascal
unit uDummyUnit;

interface

const
	MOJA_ZMIENNA_GLOBALNA = 1;

implementation

const 
	cMojaZmiennaLokalna = 1;
	
function Foo(): Integer;
const
	cMojaInnaZmiennaLokalna = 1;
begin
end;

end.
````

###### [Zasada [N013](#zasada-n013)]
Nazwę prywatnego atrybutu klasy zawsze poprzedzaj literą **F**.

**Przykłady** 

````pascal
type
  TFoo = class(TObject)
  private    
	// przykłady niepoprawnej nazwy prywatnego atrybutu klasy 
	id: Integer;
	x,y: Integer;
	__cos: Double;
    // przykłady poprawnej nazwy prywatnego atrybutu klasy 
    FIdentyfikator: Integer;	
	FPozycjaX: Integer;
	FPozycjaY: Integer;
	FCos: Double;
  end;
````

###### [Zasada [N013](#zasada-n013)]
Nazwy publicznych atrybutów nazywaj stosując [N008](#zasada-n008).

**Przykłady**

````pascal
type
  TFoo = class(TObject)
  public
	// przykłady niepoprawnej nazwy publicznego atrybutu klasy 
	id: Integer;
	x,y: Integer;
	__cos: Double;
    // przykłady poprawnej nazwy publicznego atrybutu klasy 
    Identyfikator: Integer;	
	PozycjaX: Integer;
  published
	PozycjaY: Integer;
	Cos: Double;
  end;  
````

###### [Zasada [N014](#zasada-n014)]
Nazwy elementów typów wyliczeniowych nazywaj stosując [Hungarian Notation](https://en.wikipedia.org/wiki/Hungarian_notation). Pamiętając o tym by nie stosować zbyt wielu znaków w prefiksie.

**Przykład błędny**
````pascal
type
  TMojTypWyliczeniowy = (mojaWartoscJeden, mojaWartoscDwa);
````

**Przykład poprawny**
````pascal
type
  // prefix mtw w poniższym zapisie wynika ze skrócenia MojTypWyliczeniowy
  TMojTypWyliczeniowy = (mtwWartoscJeden, mtwWartoscDwa); 
````

**[Powrót do góry](#spis-treści)**

## Nazewnictwo typów

###### [Zasada [N015](#zasada-n015)]
Nazwa typu, kóry definiujesz zawsze powinna zaczynać sie od znaku **T**. Wyjątkiami od tej reguły są interfejsy (**interfaces**) i wyjątki (**exceptions**).

###### [Zasada [N016](#zasada-n016)]
Nazwa interfejsu musi zaczynać sie od znaku **I**.

###### [Zasada [N017](#zasada-n017)]
Nazwa wyjątku musi zaczynać się od znaku **E**.

###### [Zasada [N018](#zasada-n018)]
Nazwa typu, zawsze powinna być rzeczownikiem.

###### [Zasada [N019](#zasada-n019)]
Podczas nazywania typów stosuj zawsze [N008](#zasada-n008). 
 
**[Powrót do góry](#spis-treści)**

## Nazewnictwo metod funkcji procedur

## Baza danych 

PONIŻSZE ZASADY DO PRZEGADANIA!!!

###### [Zasada [N020](#zasada-n020)]
Nazwy tabel oraz kolumn powinny być takie same jak nazwy w modelu (tabela w liczbie mnogiej)

###### [Zasada [N021](#zasada-n021)]
Identifikatory tabeli (primary key) nazywamy tak jak tabela ale w liczbie pojedynczej i z prefiksem ID

###### [Zasada [N022](#zasada-n022)]
Dla utrzymania spójności danych w BD, tworzymy klucze główne, klucze obce, unikalne pola (UNIQUE), itd.

###### [Zasada [N023](#zasada-n023)]
Dla określenia daty w BD używamy typu TIMESTAMP (nigdy string!!!)

**Przykład dla zasad N020 - N022**

**PASCAL**
````pascal
type
	TZasob = class(TObject)
	private
		FDostepnyDo: TDateTime;
		FDostepnyOd: TDateTime;
		FRezerwacja: TRezerwacja;
	public
		proprety DostepnyDo: TDateTime read FDostepnyDo write SetDostepnyDo;
		proprety DostepnyOd: TDateTime read FDostepnyOd write SetDostepnyOd;
		property Rezerwacje: TRezerwacje read FRezerwacje;
	end;

TRezerwacja = class(TObject)
private
	FNumerKlienta: String;
	FNumerRejestracji: String;
end;	
````
**SQL**
````sql
CREATE TABLE REZERWACJE (
	ID_REZERWACJA		INTEGER NOT NULL, //klucz główny
	NUMER_KLIENTA		VARCHAR(10),
	NUMER_REJESTRACJI	VARCHAR(30)
)
ALTER TABLE REZERWACJE ADD CONSTRAINT PK_REZERWACJE PRIMARY KEY (ID_REZERWACJA);

CREATE ZASOBY (
	ID_ZASOB		INTEGER NOT NULL, //klucz główny
	ID_REZERWACJA	INTEGER NOT NULL, //klucz obcy
	DOSTEPNY_DO		TIMESTAMP,
	DOSTEPNY_OD		TIMESTAMP
)
ALTER TABLE ZASOBY ADD CONSTRAINT PK_ZASOBY PRIMARY KEY (ID_ZASOB);
ALTER TABLE ZASOBY ADD CONSTRAINT FK_GRUPY_JEDN FOREIGN KEY (ID_REZERWACJA) REFERENCES REZERWACJE (ID_REZERWACJA) 
	ON DELETE NO ACTION ON UPDATE NO ACTION;
````

###### [Zasada [N025](#zasada-n025)]
Dla utrzymania spójności danych tworzymy triggery do inicjowania kluczy głównych

SQL
````sql
	CREATE VIEW REZERWACJE_VIEW ...
````

###### [Zasada [N026](#zasada-n026)]
Nazwy widoków określamy z sufiksem View, triggerów - prefiksem TR plus nazwa tabeli, której dotyczy (w niektórych pojektach używamy TG więc używamy tego) generatorów - prefiksem GEN plus nazwa identyfikatora

SQL
````sql
CREATE VIEW REZERWACJE_VIEW ...

CREATE GENERATOR GEN_ID_REZERWACJA;

CREATE TRIGGER TR_REZERWACJE FOR REZERWACJE
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
	NEW.ID_REZERWACJA=GEN_ID(GEN_ID_REZERWACJA,1);
END^
````

###### [Zasada [N027](#zasada-n027)]
W miarę możliwości unikamy tworzenia procedur oraz triggerów (z wyjątkiem [N026](#zasada-n026)). Logikę powinniśmy realizować w kodzie domeny. Poprzez realizowanie logiki w jendym miejscu, utrzymanie projektu stanie się prostrze i czytelniejsze.  

###### [Zasada [N028](#zasada-n028)]
aktualizacje


**[Powrót do góry](#spis-treści)**

**Nazewnictwo katalogów

###### [Zasada [D001](#zasada-d001)]
Tworzony kod źródłowy powinien być dzielony na katalogi.

###### [Zasada [D002](#zasada-d002)]
Nazwy katalogów i ich zawartość powinny wynikać z oprogramowywanej domeny.

###### [Zasada [D003](#zasada-d003)]
Obszerne zagadnienia domenowe należy dzielić na podkatalogi.

###### [Zasada [D004](#zasada-d004)]
Ilość plików w katalogu nie podlega ścisłym ograniczeniom, ale należy zachować rozsądny umiar.

*Dlaczego?* : Podział kodu pomiędzy katalogi wg domeny ma następujące plusy:
- wysoka modularność, klasy blisko ze sobą powiązane znajdują się w jednej lokalizacji
- łatwa nawigacja po kodzie, modyfikując funkcjonalność nie trzeba szukać plików w kilku katalogach
- zachowanie wysokiej abstrakcji, katalogi prezentują dziedzinę, a nie szczegóły implementacji

**[Powrót do góry](#spis-treści)**
