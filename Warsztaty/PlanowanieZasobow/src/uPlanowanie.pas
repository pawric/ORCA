unit uPlanowanie;

interface

uses
  Classes, Contnrs, uPlanowanieTypes, uZasobyList, uRezerwacja;

const
  CzasWykonaniaUslugi: array[ruNaprawa..ruKonserwacja] of integer = (
    180, 120, 360
  );

type
  TZapisOdczytPlanowania = class(TObject)
  public
    procedure Wczytaj;
    procedure ZapiszZmiany;
  end;

  TEksportPlanowania = class(TObject)
  public
    procedure Eksportuj;
  end;

  TPlanowanie = class(TObject)
  private
    FZasoby: TZasobyList;
  public
    constructor Create();
    Destructor Destroy; override;
    function WykonajRezerwacje(aKiedy: TDateTime; aRodzajUslugi: TRodzajUslugi; aNumerKlienta: String; aRodzajElementu: TTypElementu): TRezerwacja;
    function PotwierdzRezerwacje(aNumerKlienta: String; aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime; aTypElementu: TTypElementu): Boolean;
    function AnulujRezerwacje(aNumerKlienta: String; aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime; aTypElementu: TTypElementu): Boolean;
    function PrzelozRezerwacje(aNumerKlienta: String; aRodzajUslugi: TRodzajUslugi; aKiedy, aNaKiedy: TDateTime; aRodzajElementu: TTypElementu): Boolean;
    procedure AktualizujWidok();
  end;

implementation

{ TZasoby }

uses
  DateUtils, uZasob;

{ TPlanowanie }

function TPlanowanie.AnulujRezerwacje(aNumerKlienta: String; aRodzajUslugi:
    TRodzajUslugi; aKiedy: TDateTime; aTypElementu: TTypElementu): Boolean;
var
  i: Integer;
  v_Rezerwacja: TRezerwacja;
  v_SzukanaRezerwacja: TRezerwacja;
begin
  Result := False;
  v_SzukanaRezerwacja := TRezerwacja.Create(aNumerKlienta, aTypElementu, aRodzajUslugi, aKiedy, seRezerwacja, aKiedy);
  try
    for i := 0 to FZasoby.Count -1 do
    begin
      v_Rezerwacja := FZasoby[i].Rezerwacje.Find(v_SzukanaRezerwacja);
      if v_Rezerwacja.Equals(v_SzukanaRezerwacja) then
      begin
        FZasoby[i].Rezerwacje.Remove(v_Rezerwacja);
        Break;
      end;
    end;
  finally
    v_SzukanaRezerwacja.Free();
  end;
end;

constructor TPlanowanie.Create;
begin
  inherited;
  FZasoby := TZasobyList.Create();
end;

destructor TPlanowanie.Destroy;
begin
  FZasoby.Free();
  inherited;
end;

function TPlanowanie.PotwierdzRezerwacje(aNumerKlienta: String; aRodzajUslugi:
    TRodzajUslugi; aKiedy: TDateTime; aTypElementu: TTypElementu): Boolean;
var
  i: Integer;
  v_Rezerwacja: TRezerwacja;
  v_SzukanaRezerwacja: TRezerwacja;
begin
  Result := False;
  v_SzukanaRezerwacja := TRezerwacja.Create(aNumerKlienta, aTypElementu, aRodzajUslugi, aKiedy, seRezerwacja);
  try
    for i := 0 to FZasoby.Count -1 do
    begin
      v_Rezerwacja := FZasoby[i].Rezerwacje.Find(v_SzukanaRezerwacja);
      if v_Rezerwacja.Equals(v_SzukanaRezerwacja) then
      begin
        v_Rezerwacja.Status := sePotwierdzonePrzybycie;
        Result := True;
        Break;
      end;
    end;
  finally
    v_SzukanaRezerwacja.Free();
  end;
end;

function TPlanowanie.PrzelozRezerwacje(aNumerKlienta: String; aRodzajUslugi:
    TRodzajUslugi; aKiedy, aNaKiedy: TDateTime; aRodzajElementu: TTypElementu):
    Boolean;
var
  v_NowyElement: TRezerwacja;
begin
  Result := False;
  v_NowyElement := WykonajRezerwacje(aNaKiedy, aRodzajUslugi, aNumerKlienta, aRodzajElementu);
  if Assigned(v_NowyElement) then
  begin
    AnulujRezerwacje(aNumerKlienta, aRodzajUslugi, aKiedy, aRodzajElementu);
    Result := True;
  end;
end;

function TPlanowanie.WykonajRezerwacje(aKiedy: TDateTime; aRodzajUslugi:
    TRodzajUslugi; aNumerKlienta: String; aRodzajElementu: TTypElementu):
    TRezerwacja;
var
  i: Integer;
  v_Zasob: TZasob;
begin
  Result := nil;
  for i := 0 to FZasoby.Count -1 do
  begin
    v_Zasob := FZasoby[i];
    if v_Zasob.CzyObslugujeUsluge(aRodzajUslugi) and
       v_Zasob.CzyObslugujeElement(aRodzajElementu) and
       v_Zasob.CzyJestDostepny(aKiedy) and
       not v_Zasob.CzyJestZarezerwowany(aKiedy)
    then
    begin
      Result := TRezerwacja.Create(
        aNumerKlienta, aRodzajElementu, aRodzajUslugi, aKiedy, seRezerwacja,
        IncMinute(aKiedy, CzasWykonaniaUslugi[aRodzajUslugi] + 10)
      );
      v_Zasob.Rezerwacje.Add(Result);
      break;
    end;
  end;
end;

procedure TPlanowanie.AktualizujWidok;
begin

end;

procedure TZapisOdczytPlanowania.Wczytaj;
begin

end;

procedure TZapisOdczytPlanowania.ZapiszZmiany;
begin

end;

procedure TEksportPlanowania.Eksportuj;
begin

end;

end.
