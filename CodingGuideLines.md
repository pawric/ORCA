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

## Zasady ogólne

Punktem wyjścia do wypracowania zasad produkowania kodu w naszych projektach jest [Object Pascal Style Guide](http://edn.embarcadero.com/article/10280) ustalamy jedynie odstępstwa od zasad tam wskazanych.

 1. Moduły
	- Nazewnictwo
		
		W naszych projektach nazywając moduł zawsze zaczynamy od małej litery u od *unit* a dla poszczególnych typów modułów możemy zastosować następujące zaraz po pierwszej literze wyróżniki:
		
	 	- Dla modułu zawierającego kod formy lub ramki - **frm**
	 	- Dla modułu będącego pochodną DataModule - **DM**
	 	- Dla modułu nie mającego związku z żadnym z powyższych nie stosujemy żadnego wyróżnika

		następnie definiujemy nazwę modułu stosując notację InfixCaps.

		Przykłady:
		````pascal
		unit ufrmMain.pas; //moduł zawierający kod formy
		unit uDMCustomer.pas; //moduł pochodny od TDataModule
		unit uMojaWlasnaSuperKlasaObfitosci.pas; //moduł zawierający kod klasy obfitości ;)
		````

	- Zawartość
	
2. Nazewnictwo identyfikatorów
3. Nazewnictwo typów nie będących klasami
4. Nazewnictwo klas/interfejsów
	- Nazewnictwo właściwości
	- Nazewnictwo property
	- Nazewnictwo metod
5. Konstrukcje blokowe

## Dobre i złe praktyki
