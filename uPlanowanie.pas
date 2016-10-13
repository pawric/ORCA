unit uPlanowanie;

interface

uses
  Classes, Contnrs;

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
  TElement = class(TObject)
  private
  public
    NumerKlienta: String;
    NumerRejestracji: String;
    RozpoczeciePrac: TDateTime;
    ZakonczeniePrac: TDateTime;
    RodzajUslugi: TRodzajUslugi;
    Status: TStatusElementu;
    Rodzaj: TTypElementu;
  end;

  TZasob = class(TObject)
  private
    FElementy: TObjectList;
  public
    FNazwa: String;
    FRodzaj: Integer;
    FDostepnyOd: TDateTime;
    FDostepnyDo: TDateTime;
    FAkceptowaneElementy: TTypyElementow;
//    FMaksymalnaLiczbaElementow: Integer;
    FWykonaywaneUslugi: TRodzajeUslug;
    constructor Create;
    destructor Destroy; override;
  end;


  TZasoby = class(TObject)
  private
    FItems: TObjectList;
  public
    constructor Create();
    destructor Destroy; Override;
    property Items: TObjectList read FItems write FItems;
  end;

  TPlanowanie = class(TObject)
  private
    FZasoby: TZasoby;
    function DateBetween(aKiedy, aValue, Value1: TDateTime): Boolean;
  public
    constructor Create();
    Destructor Destroy; override;
    function WykonajRezerwacje(aKiedy: TDateTime; aRodzajUslugi: TRodzajUslugi;
        aNumerKlienta: String; aRodzajElementu: TTypElementu): TElement;
    function PotwierdzRezerwacje(aNumerKlienta: String; aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime): Boolean;
    function AnulujRezerwacje(aNumerKlienta: String; aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime): Boolean;
    function PrzelozRezerwacje(aNumerKlienta: String; aRodzajUslugi: TRodzajUslugi;
        aKiedy, aNaKiedy: TDateTime; aRodzajElementu: TTypElementu): Boolean;
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
  FItems := TObjectList.Create();
end;

destructor TZasoby.Destroy;
begin
  FItems.Free();
  inherited;
end;

{ TPlanowanie }

function TPlanowanie.AnulujRezerwacje(aNumerKlienta: String;
  aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime): Boolean;
var
  i: Integer;
  j: Integer;
begin
  Result := False;
  for i := 0 to FZasoby.Items.Count -1 do
  begin
    for j := (FZasoby.Items[i] as TZasob).FElementy.Count - 1 downto 0 do
    begin
      with ((FZasoby.Items[i] as TZasob).FElementy[j] as TElement) do
      begin
        if (NumerKlienta =  aNumerKlienta) and (RodzajUslugi = aRodzajUslugi) and (Status = seRezerwacja) and (aKiedy = RozpoczeciePrac) then
        begin
          (FZasoby.Items[i] as TZasob).FElementy.Remove((FZasoby.Items[i] as TZasob).FElementy[j]);
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

function TPlanowanie.DateBetween(aKiedy, aValue, Value1: TDateTime): Boolean;
begin
  Result := (CompareDate(aKiedy, aValue) in [0,1]) and ((CompareDate(aKiedy, Value1) = -1) or (CompareDate(aKiedy, Value1) = 0));
end;

function TPlanowanie.PotwierdzRezerwacje(aNumerKlienta: String;
  aRodzajUslugi: TRodzajUslugi; aKiedy: TDateTime): Boolean;
var
  i: Integer;
  j: Integer;
begin
  Result := False;
  for i := 0 to FZasoby.Items.Count -1 do
  begin
    for j := 0 to (FZasoby.Items[i] as TZasob).FElementy.Count - 1 do
    begin
      with ((FZasoby.Items[i] as TZasob).FElementy[j] as TElement) do
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
  v_NowyElement: TElement;
begin
  v_NowyElement := WykonajRezerwacje(aNaKiedy, aRodzajUslugi, aNumerKlienta, aRodzajElementu);
  if Assigned(v_NowyElement) then
    AnulujRezerwacje(aNumerKlienta, aRodzajUslugi, aKiedy);
end;

function TPlanowanie.WykonajRezerwacje(aKiedy: TDateTime; aRodzajUslugi:
    TRodzajUslugi; aNumerKlienta: String; aRodzajElementu: TTypElementu):
    TElement;
var
  i, j: Integer;
begin
  Result := nil;
  for i := 0 to FZasoby.Items.Count -1 do
  begin
    if (aRodzajUslugi in (FZasoby.Items[i] as TZasob).FWykonaywaneUslugi) and (aRodzajElementu in (FZasoby.Items[i] as TZasob).FAkceptowaneElementy) then
    begin
      if DateBetween(aKiedy, (FZasoby.Items[i] as TZasob).FDostepnyOd, (FZasoby.Items[i] as TZasob).FDostepnyDo) then
      begin
        //lista elementow na stonowisku jest pusta wiec mozna uzyc wlasciwego stanowiska
        if (FZasoby.Items[i] as TZasob).FElementy.Count = 0 then
        begin
          Result := TElement.Create();
          Result.NumerKlienta := aNumerKlienta;
          Result.NumerRejestracji := '';
          Result.RozpoczeciePrac := aKiedy;
          Result.ZakonczeniePrac := IncMinute(aKiedy, CzasWykonaniaUslugi[aRodzajUslugi] + 10);
          Result.RodzajUslugi := aRodzajUslugi;
          Result.Status := seRezerwacja;
          (FZasoby.Items[i] as TZasob).FElementy.Add(Result);
        end
        else
        begin
          for j := 0 to (FZasoby.Items[i] as TZasob).FElementy.Count-1 do
          begin
             if not DateBetween(aKiedy, ((FZasoby.Items[i] as TZasob).FElementy[j] as TElement).RozpoczeciePrac,
              ((FZasoby.Items[i] as TZasob).FElementy[j] as TElement).ZakonczeniePrac) then
             begin
                Result := TElement.Create();
                Result.NumerKlienta := aNumerKlienta;
                Result.NumerRejestracji := '';
                Result.RozpoczeciePrac := aKiedy;
                Result.ZakonczeniePrac := IncMinute(aKiedy, CzasWykonaniaUslugi[aRodzajUslugi] + 10);
                Result.RodzajUslugi := aRodzajUslugi;
                Result.Status := seRezerwacja;
                (FZasoby.Items[i] as TZasob).FElementy.Add(Result);
             end;
          end;
        end;
      end;
    end;
  end;
end;

constructor TZasob.Create;
begin
  inherited;
  FElementy := TObjectList.Create();
end;

destructor TZasob.Destroy;
begin
  FElementy.Free();
  inherited Destroy;
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

end.
