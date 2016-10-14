unit uPlanowanie;

interface

uses
  Classes, Contnrs, uZasob;

type
  TTypElementu = (teSamochod, teMotocykl, teRower);
  TTypyElementow = set of TTypElementu;

  TRodzajUslugi = (teNaprawa, teMycie, teKonserwacja);
  TRodzajeUslug = set of TRodzajUslugi;

  TStatusElementu = (seRezerwacja, sePotwierdzonePrzybycie, seWykonywanieUslugi);

const
  CzasWykonaniaUslugi: array[teNaprawa..teKonserwacja] of integer = (
    180, 120, 360
  );

type
  TRezerwacja = class(TObject)
  private
    FNumerKlienta: String;
    FNumerRejestracji: String;
    FRodzaj: TTypElementu;
    FRodzajUslugi: TRodzajUslugi;
    FRozpoczeciePrac: TDateTime;
    FStatus: TStatusElementu;
    FZakonczeniePrac: TDateTime;
    procedure SetNumerKlienta(const aValue: String);
    procedure SetNumerRejestracji(const aValue: String);
    procedure SetRodzaj(const aValue: TTypElementu);
    procedure SetRodzajUslugi(const aValue: TRodzajUslugi);
    procedure SetRozpoczeciePrac(const aValue: TDateTime);
    procedure SetStatus(const aValue: TStatusElementu);
    procedure SetZakonczeniePrac(const aValue: TDateTime);
  public
    property NumerKlienta: String read FNumerKlienta write SetNumerKlienta;
    property NumerRejestracji: String read FNumerRejestracji write SetNumerRejestracji;
    property Rodzaj: TTypElementu read FRodzaj write SetRodzaj;
    property RodzajUslugi: TRodzajUslugi read FRodzajUslugi write SetRodzajUslugi;
    property RozpoczeciePrac: TDateTime read FRozpoczeciePrac write SetRozpoczeciePrac;
    property Status: TStatusElementu read FStatus write SetStatus;
    property ZakonczeniePrac: TDateTime read FZakonczeniePrac write SetZakonczeniePrac;
  end;

  TZasobLista = class(TObjectList)
  private
    function GetItems(Index: Integer): TZasob;
    procedure SetItems(Index: Integer; const aValue: TZasob);
  public
    property Items[Index: Integer]: TZasob read GetItems write SetItems; default;
  end;

  TZasoby = class(TObject)
  private
    FItems: TZasobLista;
    function GetCount: Integer;
    function GetItems(Index: Integer): TZasob;
    procedure SetItems(Index: Integer; const Value: TZasob);
  public
    constructor Create();
    destructor Destroy; Override;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TZasob read GetItems write SetItems; default;
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
    procedure ZapiszZmiany();
    procedure Wczytaj();
    procedure Eksportuj();
    procedure AktualizujWidok();
  end;

implementation

{ TZasoby }

uses
  DateUtils;

constructor TZasoby.Create;
begin
  inherited;
  FItems := TZasobLista.Create();
end;

destructor TZasoby.Destroy;
begin
  FItems.Free();
  inherited;
end;

function TZasoby.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TZasoby.GetItems(Index: Integer): TZasob;
begin
  Result := FItems[Index];
end;

procedure TZasoby.SetItems(Index: Integer; const Value: TZasob);
begin
  {!!!}
  FItems[Index] := Value;
end;

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
    for j := FZasoby[i].FElementy.Count - 1 downto 0 do
    begin
      with (FZasoby[i].FElementy[j] as TRezerwacja) do
      begin
        if (NumerKlienta =  aNumerKlienta) and (RodzajUslugi = aRodzajUslugi) and (Status = seRezerwacja) and (aKiedy = RozpoczeciePrac) then
        begin
          FZasoby.Items[i].FElementy.Remove(FZasoby.Items[i].FElementy[j]);
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
    for j := 0 to FZasoby.Items[i].FElementy.Count - 1 do
    begin
      with (FZasoby[i].FElementy[j] as TRezerwacja) do
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
    if (aRodzajUslugi in FZasoby[i].FWykonaywaneUslugi) and (aRodzajElementu in FZasoby[i].FAkceptowaneElementy) then
    begin
      if DateBetween(aKiedy, FZasoby.Items[i].FDostepnyOd, FZasoby.Items[i].FDostepnyDo) then
      begin
        //lista elementow na stonowisku jest pusta wiec mozna uzyc wlasciwego stanowiska
        if FZasoby[i].FElementy.Count = 0 then
        begin
          Result := TRezerwacja.Create();
          Result.NumerKlienta := aNumerKlienta;
          Result.NumerRejestracji := '';
          Result.RozpoczeciePrac := aKiedy;
          Result.ZakonczeniePrac := IncMinute(aKiedy, CzasWykonaniaUslugi[aRodzajUslugi] + 10);
          Result.RodzajUslugi := aRodzajUslugi;
          Result.Status := seRezerwacja;
          FZasoby[i].FElementy.Add(Result);
        end
        else
        begin
          for j := 0 to FZasoby[i].FElementy.Count-1 do
          begin
             if not DateBetween(aKiedy, (FZasoby[i].FElementy[j] as TRezerwacja).RozpoczeciePrac,
              (FZasoby[i].FElementy[j] as TRezerwacja).ZakonczeniePrac) then
             begin
                Result := TRezerwacja.Create();
                Result.NumerKlienta := aNumerKlienta;
                Result.NumerRejestracji := '';
                Result.RozpoczeciePrac := aKiedy;
                Result.ZakonczeniePrac := IncMinute(aKiedy, CzasWykonaniaUslugi[aRodzajUslugi] + 10);
                Result.RodzajUslugi := aRodzajUslugi;
                Result.Status := seRezerwacja;
                FZasoby[i].FElementy.Add(Result);
             end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TPlanowanie.Eksportuj;
begin

end;

procedure TPlanowanie.Wczytaj;
begin

end;

procedure TPlanowanie.ZapiszZmiany;
begin

end;

procedure TPlanowanie.AktualizujWidok;
begin

end;

procedure TRezerwacja.SetNumerKlienta(const aValue: String);
begin
  FNumerKlienta := aValue;
end;

procedure TRezerwacja.SetNumerRejestracji(const aValue: String);
begin
  FNumerRejestracji := aValue;
end;

procedure TRezerwacja.SetRodzaj(const aValue: TTypElementu);
begin
  FRodzaj := aValue;
end;

procedure TRezerwacja.SetRodzajUslugi(const aValue: TRodzajUslugi);
begin
  FRodzajUslugi := aValue;
end;

procedure TRezerwacja.SetRozpoczeciePrac(const aValue: TDateTime);
begin
  FRozpoczeciePrac := aValue;
end;

procedure TRezerwacja.SetStatus(const aValue: TStatusElementu);
begin
  FStatus := aValue;
end;

procedure TRezerwacja.SetZakonczeniePrac(const aValue: TDateTime);
begin
  FZakonczeniePrac := aValue;
end;

function TZasobLista.GetItems(Index: Integer): TZasob;
begin
  Result := (inherited Items[Index] as TZasob);
end;

procedure TZasobLista.SetItems(Index: Integer; const aValue: TZasob);
begin
  inherited Items[Index] := aValue;
end;

end.
