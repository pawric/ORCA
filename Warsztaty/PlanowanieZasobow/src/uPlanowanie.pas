unit uPlanowanie;

interface

uses
  Classes, Contnrs, uPlanowanieTypes, uZasoby, uRezerwacja;

const
  CzasWykonaniaUslugi: array[teNaprawa..teKonserwacja] of integer = (
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
    FZasoby: TZasoby;
    function DateBetween(ADataPorownywana, ADataPoczatkowa, ADataKoncowa: TDateTime): Boolean;
  public
    constructor Create();
    Destructor Destroy; override;
    function WykonajRezerwacje(aKiedy: TDateTime; aRodzajUslugi: TRodzajUslugi; aNumerKlienta: String; aRodzajElementu: TTypElementu): TRezerwacja;
    function PotwierdzRezerwacje(aNumerKlienta: String; aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime): Boolean;
    function AnulujRezerwacje(aNumerKlienta: String; aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime): Boolean;
    function PrzelozRezerwacje(aNumerKlienta: String; aRodzajUslugi: TRodzajUslugi; aKiedy, aNaKiedy: TDateTime; aRodzajElementu: TTypElementu): Boolean;
    procedure AktualizujWidok();
  end;

implementation

{ TZasoby }

uses
  DateUtils, uZasob;

{ TPlanowanie }

function TPlanowanie.AnulujRezerwacje(aNumerKlienta: String;
  aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime): Boolean;
var
  i: Integer;
  j: Integer;
begin
  Result := False;
  for i := 0 to FZasoby.Count -1 do
  begin
    for j := FZasoby[i].Count - 1 downto 0 do
    begin
      with FZasoby[i][j] do
      begin
        if (NumerKlienta =  aNumerKlienta) and (RodzajUslugi = aRodzajUslugi) and (Status = seRezerwacja) and (aKiedy = RozpoczeciePrac) then
        begin
          FZasoby[i].Remove(FZasoby[i][j]);
          Break;
        end;
      end;
    end;
  end;
end;

constructor TPlanowanie.Create;
begin
  inherited;
  FZasoby := TZasoby.Create();
end;

destructor TPlanowanie.Destroy;
begin
  FZasoby.Free();
  inherited;
end;

function TPlanowanie.DateBetween(ADataPorownywana, ADataPoczatkowa,
    ADataKoncowa: TDateTime): Boolean;
begin
  Result := (CompareDate(ADataPorownywana, ADataPoczatkowa) in [0,1]) and ((CompareDate(ADataPorownywana, ADataKoncowa) = -1) or (CompareDate(ADataPorownywana, ADataKoncowa) = 0));
end;

function TPlanowanie.PotwierdzRezerwacje(aNumerKlienta: String;
  aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime): Boolean;
var
  i: Integer;
  j: Integer;
begin
  Result := False;
  for i := 0 to FZasoby.Count -1 do
  begin
    for j := 0 to FZasoby[i].Count - 1 do
    begin
      with FZasoby[i][j] do
      begin
        if (NumerKlienta =  aNumerKlienta) and (RodzajUslugi = aRodzajUslugi) and (Status = seRezerwacja) and (aKiedy = RozpoczeciePrac) then
        begin
          Status := sePotwierdzonePrzybycie;
          Result := True;
          Break;
        end;
      end;
    end;
  end;
end;

function TPlanowanie.PrzelozRezerwacje(aNumerKlienta: String; aRodzajUslugi:
    TRodzajUslugi; aKiedy, aNaKiedy: TDateTime; aRodzajElementu: TTypElementu):
    Boolean;
var
  v_NowyElement: TRezerwacja;
begin
  v_NowyElement := WykonajRezerwacje(aNaKiedy, aRodzajUslugi, aNumerKlienta, aRodzajElementu);
  if Assigned(v_NowyElement) then
    AnulujRezerwacje(aNumerKlienta, aRodzajUslugi, aKiedy);
end;

function TPlanowanie.WykonajRezerwacje(aKiedy: TDateTime; aRodzajUslugi:
    TRodzajUslugi; aNumerKlienta: String; aRodzajElementu: TTypElementu):
    TRezerwacja;
var
  i, j: Integer;
begin
  Result := nil;
  for i := 0 to FZasoby.Count -1 do
  begin
    if (aRodzajUslugi in FZasoby[i].WykonaywaneUslugi) and (aRodzajElementu in FZasoby[i].AkceptowaneElementy) then
    begin
      if DateBetween(aKiedy, FZasoby[i].DostepnyOd, FZasoby.Items[i].DostepnyDo) then
      begin
        //lista elementow na stonowisku jest pusta wiec mozna uzyc wlasciwego stanowiska
        if FZasoby[i].Count = 0 then
        begin
          Result := TRezerwacja.Create(
            aNumerKlienta, '', aRodzajElementu, aRodzajUslugi, aKiedy, seRezerwacja,
            IncMinute(aKiedy, CzasWykonaniaUslugi[aRodzajUslugi] + 10)
          );
          FZasoby[i].Add(Result);
        end
        else
        begin
          for j := 0 to FZasoby[i].Count-1 do
          begin
             if not DateBetween(aKiedy, FZasoby[i][j].RozpoczeciePrac, FZasoby[i][j].ZakonczeniePrac) then
             begin
                Result := TRezerwacja.Create(
                  aNumerKlienta, '', aRodzajElementu,
                  aRodzajUslugi, aKiedy, seRezerwacja,
                  IncMinute(aKiedy, CzasWykonaniaUslugi[aRodzajUslugi] + 10)
                );
                FZasoby[i].Add(Result);
             end;
          end;
        end;
      end;
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
