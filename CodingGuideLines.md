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
1. [Komnetowanie kodu](#komentowanie-kodu)
1. [Nazewnictwo modułów](#nazewnictwo-modułów)
1. [Nazewnictwo identyfikatorów](#nazewnictwo-identyfikatorów)
1. [Nazewnictwo typów nie będących klasami](#nazewnictwo-typów-nie-będących-klasami)
1. [Nazewnictwo klas i interfejsów](#nazewnictwo-klas-i-interfejsów)

## Generalna konwencja

###### [Zasada [N001](#zasada-n001)]

Jeśli nie wiesz jak kod powinien wyglądać w konkretnej sytuacji a nie jest to sprecyzowane w tym dokumencie zawsze posługuj sie [Object Pascal Style Guide](http://edn.embarcadero.com/article/10280).

*Dlaczego?*: Punktem wyjścia do wypracowania zasad produkowania kodu w naszych projektach jest [Object Pascal Style Guide](http://edn.embarcadero.com/article/10280) ustalamy jedynie odstępstwa od zasad tam wskazanych. A w przypadkach, które nie są określone jeszcze w tym dokumencie nadrzędny jest Object Pascal Style Guide, który w dalszej części będzie zastępowany skrótem (**OPSG**).

**[Powrót do góry](#spis-treści)**

## Komentowanie kodu

###### [Styl [S001](#styl-s001)]

Komentarze w kodzie o ile je stosujemy powinny być jasne i związane z implementowaną funkcjonalnością. Generalnie nie powinno się komentować kodu bo jesli czujesz, że masz potrzebę coś w nim dodatkowo wyjasnić to znaczy przeważnie, że jest zbyt zagmatwany by go zorzumieć po przeczytaniu. Niemniej jednak jeśli już musisz coś zakomentować to zrób to w taki sposób aby inni nie mieli problemu z odczytaniem komentarza, czyli:

- jednoliniowe komentarze

	Zawsze zaczynaj komentować nad linią kodu, którego komentarz dotyczy i zaczynaj od **//**a następnie postaw spację i dopiero pisz komentarz.

- komentarze blokowe

	Zawsze zaczynaj od znaków (* po czym zrób nową linię i zacznij pisać komentarz zakończ komentarz w nowej linii znakami *).

- generalne uwagi

	Unikaj jakichkolwiek ozdobników w komentarzach (chodzi tu o obramowania w postaci znaków ASCI, czy też jakichś ACII Artów). Staraj się łamać linie do ilości znaków określonych przez **Right Margin** we właściwościach środowiska w edytorze. 
	Jeśli tworzysz interfejs/klasę to staraj się zawsze udokumentować przynajmniej kluczowe znaczenie interfejsu przy pomocy odpowiedniego rozszerzenia IDE (uwaga ta dotyczy, też metod).
	Nie twórz komentarzy w postaci **TODO**, nikt tego nie przeczyta kod się pewnie w tym miejscu sypnie a i ty sam zapomnisz za jakiś czas o tym komentarzu.

	**Przykłady komentowania kodu:**
	````pascal
	// Poniższe komentarze są zbędne ponieważ wszystko wynika z Kodu
	// funkcja sumuje dwie wartosci
	function Sum(const a, b: Integer): Integer;
	begin
		// dodajemy a i b zwracamy wynik
		Result := a +b;
	end;

	// Poniższy komentarz to nadmiarowy tekst 

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

**[Powrót do góry](#spis-treści)**
	
## Nazewnictwo modułów

###### [Zasada [N002](#zasada-n002)]

- Nazewnictwo
			
	W aktualnej wersji umownie w naszych projektach nazywając moduł zawsze zaczynamy od małej litery u od *unit* a dla poszczególnych typów modułów możemy zastosować następujące zaraz po pierwszej literze wyróżniki:
	
	- Dla modułu zawierającego kod formy lub ramki - **frm**
	- Dla modułu będącego pochodną DataModule - **DM**
	- Dla modułu nie mającego związku z żadnym z powyższych nie stosujemy żadnego wyróżnika

	następnie definiujemy nazwę modułu stosując notację [PascalCase/UpperCamelCase](https://pl.wikipedia.org/wiki/PascalCase).

	**Przykłady nazewnictwa modułów:**
	````pascal
	unit ufrmMain.pas; //moduł zawierający kod formy
	unit uDMCustomer.pas; //moduł pochodny od TDataModule
	unit uMojaWlasnaSuperKlasaObfitosci.pas; //moduł zawierający kod klasy obfitości ;)
	````

- Zawartość

	Należy dbać o to by zawartość modułu szczególnie w sekcji **interface** odpowiadała chociaż tematycznie jego nazwie. Nawet w przypadku gdy traktujemy moduł jako brakujące w naszym języku **namespace** należy zadbać o to by moduł nie był kombajnem do wszystkiego, a także o to by udostępniać (w miarę możliwości) tylko faktycznie publiczne API. Moduł powinien być w miarę możliwości mały pod względem ilości linii kodu, a w sekcji **uses** zarówno w w części **implementation** jak i **interface** powinno się włączać tylko i wyłącznie moduły potrzebne do implementacji, wszystkie nadmiarowe powinny zostać usunięte.

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
