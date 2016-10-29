unit uStanowisko;

interface

uses
  Contnrs, uPlanowanieTypes, uRezerwacjeList, uRezerwacja;

type
  TStanowisko = class(TObject)
  private
    FAkceptowaneElementy: TTypyElementow;
    FDostepnyDo: TDateTime;
    FDostepnyOd: TDateTime;
    FRezerwacje: TRezerwacje;
    FNazwa: String;
    FRodzaj: Integer;
//    FMaksymalnaLiczbaElementow: Integer;
    FWykonywaneUslugi: TRodzajeUslug;
    procedure SetAkceptowaneElementy(const aValue: TTypyElementow);
    procedure SetDostepnyDo(const aValue: TDateTime);
    procedure SetDostepnyOd(const aValue: TDateTime);
    procedure SetNazwa(const aValue: String);
    procedure SetRodzaj(const aValue: Integer);
    procedure SetWykonywaneUslugi(const aValue: TRodzajeUslug);
  public
    constructor Create(AAkceptowaneElementy: TTypyElementow; ADostepnyDo,
        ADostepnyOd: TDateTime; const ANazwa: String; ARodzaj: Integer;
        AWykonaywaneUslugi: TRodzajeUslug); overload;
    constructor Create; overload;
    destructor Destroy; override;
    function CzyObslugujeUsluge(ARodzajUslugi: TRodzajUslugi): Boolean;
    function CzyObslugujeElement(ATypElementu: TTypElementu): Boolean;
    function CzyJestDostepny(AKiedy: TDateTime): Boolean;
    function CzyJestZarezerwowany(AKiedy: TDateTime): Boolean;
    property AkceptowaneElementy: TTypyElementow read FAkceptowaneElementy write SetAkceptowaneElementy;
    property DostepnyDo: TDateTime read FDostepnyDo write SetDostepnyDo;
    property DostepnyOd: TDateTime read FDostepnyOd write SetDostepnyOd;
    property Nazwa: String read FNazwa write SetNazwa;
    property Rodzaj: Integer read FRodzaj write SetRodzaj;
    property WykonywaneUslugi: TRodzajeUslug read FWykonywaneUslugi write
        SetWykonywaneUslugi;
    property Rezerwacje: TRezerwacje read FRezerwacje;
  end;

implementation

uses Classes, uDateUtils;

constructor TStanowisko.Create(AAkceptowaneElementy: TTypyElementow; ADostepnyDo,
    ADostepnyOd: TDateTime; const ANazwa: String; ARodzaj: Integer;
    AWykonaywaneUslugi: TRodzajeUslug);
begin
  Create;
  FAkceptowaneElementy := AAkceptowaneElementy;
  FDostepnyDo := ADostepnyDo;
  FDostepnyOd := ADostepnyOd;
  FNazwa := ANazwa;
  FRodzaj := ARodzaj;
  FWykonywaneUslugi := AWykonaywaneUslugi;
end;

constructor TStanowisko.Create;
begin
  inherited Create();
  FRezerwacje := TRezerwacje.Create();
end;

function TStanowisko.CzyJestDostepny(AKiedy: TDateTime): Boolean;
begin
  Result := TDateUtile.DateBetween(AKiedy, FDostepnyOd, FDostepnyDo);
end;

function TStanowisko.CzyObslugujeElement(ATypElementu: TTypElementu): Boolean;
begin
  Result := ATypElementu in FAkceptowaneElementy;
end;

function TStanowisko.CzyJestZarezerwowany(AKiedy: TDateTime): Boolean;
var
  i: Integer;
  v_Rezerwacja: TRezerwacja;
begin
  Result := False;
  for i := 0 to FRezerwacje.Count-1 do
  begin
    v_Rezerwacja := FRezerwacje[i];
    if TDateUtile.DateBetween(aKiedy, v_Rezerwacja.RozpoczeciePrac, v_Rezerwacja.ZakonczeniePrac) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TStanowisko.CzyObslugujeUsluge(ARodzajUslugi: TRodzajUslugi): Boolean;
begin
  Result := ARodzajUslugi in FWykonywaneUslugi;
end;

destructor TStanowisko.Destroy;
begin
  FRezerwacje.Free();
  inherited Destroy;
end;

procedure TStanowisko.SetAkceptowaneElementy(const aValue: TTypyElementow);
begin
  FAkceptowaneElementy := aValue;
end;

procedure TStanowisko.SetDostepnyDo(const aValue: TDateTime);
begin
  FDostepnyDo := aValue;
end;

procedure TStanowisko.SetDostepnyOd(const aValue: TDateTime);
begin
  FDostepnyOd := aValue;
end;

procedure TStanowisko.SetNazwa(const aValue: String);
begin
  FNazwa := aValue;
end;

procedure TStanowisko.SetRodzaj(const aValue: Integer);
begin
  FRodzaj := aValue;
end;

procedure TStanowisko.SetWykonywaneUslugi(const aValue: TRodzajeUslug);
begin
  FWykonywaneUslugi := aValue;
end;

end.
