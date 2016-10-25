# ORCA - Planowanie zasobów

## User story

Jestem właścicielem warsztatu samochodowego, który jest bardzo dobrym warsztatem w mieście i posiada wielu klientów. Zaczęliśmy się gubnić z alokacją stanowisk potrzebnych do wykonania usługi dla klienta dlatego:

- jako właściciel warsztatu samochodowego chciałbym udostępnić możliwość wykonania rezerwacji stanowiska klientowi, dla którego mogę wykonać następujące usługi:
	- mycie pojazdu,
	- konserwacja podwozia,
	- wymiana oleju,
	- wymiana opon

W przyszłości być może zajdzie potrzeba rozbudowy oferty dla klientów elektronicznych.

Posiadam kilka stanowisk warsztatowych, na których mogą zostać wykonane dwie lub trzy usługi z podanej listy jednocześnie dla jednego pojazdu. Dlatego:
- jako użytkownik chciałbym móc zdefiniować takie zasoby.
- klient warsztatu przy pomocy aplikacji wizualnie wybierałby tylko rodzaj usługi oraz termin, w którym planuje odwiedzić mój warsztat. System powinien znaleźć wolne stanowisko o ile jest i poinformować o tym odpowiednim komunikatem. W przypadku gdy takiego nie znajdzie w podanym terminie także powinien podać odpowiedni koumnikat w aplikacji i potwierdzić akcję w mailu. W przyszłości chciałbym aby system umozliwiał zasugerowanie innego terminu.
- taka informacja powinna też trafić od razu do jakiegoś grafika (planu zasobów), który kontroluje biuro obsługi klienta, a może wręcz biuro obsługi klienta powinno pracować na tym samym grafiku ?

Informacje dodatkowe pozyskane od klienta: 

  - System elektroniczny powinien obsługiwać samochody osobowe, rowery, motocykle.
  - Dodatkowo posiadam kilka stanowisk, na których można jednocześnie obsługiwać mniejsze pojazdy w róznym zakresie. Niemniej ze względów organizacyjnych dobrze by było, aby ograniczyć możliwość do tych samych usług. Np. dwa motocykle jednocześnie, mogą mieć tylko wymieniane opony.
  - Warsztat jest czynny od 8:00 do 18:00 w dni powszednie, a w soboty od 10:00 do 18:00.
  - Zakładamy czas na wykonanie poszczególnych usług, w którym pracownicy powinny się wyrobić:
		- mycie pojazdu - 1h,
		- konserwacja podwozia - 4h,
		- wymian oleju - 1h 30m,
		- wymiana opon - 30m
	- Zakładamy że dla konserwacji podwozia należy ustalić dodatkowy odstęp czasu na początku i na końcu usługi w celu przygotowania stanowiska - jest to ok 10 minut.
	- Posiadamy już system, w którym notujemy dane klientów, warto byłoby z niego skorzystać o ile to możliwe.
