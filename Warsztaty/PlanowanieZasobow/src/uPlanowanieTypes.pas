unit uPlanowanieTypes;

interface

type
  TTypElementu = (teSamochod, teMotocykl, teRower);
  TTypyElementow = set of TTypElementu;

  TRodzajUslugi = (ruNaprawa, ruMycie, ruKonserwacja);
  TRodzajeUslug = set of TRodzajUslugi;

  TStatusElementu = (seRezerwacja, sePotwierdzonePrzybycie, seWykonywanieUslugi);
  
implementation

end.
