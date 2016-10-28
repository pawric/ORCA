unit uZasob;

interface

uses
  Contnrs, uPlanowanieTypes, uRezerwacjeList, uRezerwacja;

type
  TZasob = class(TObject)
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

constructor TZasob.Create(AAkceptowaneElementy: TTypyElementow; ADostepnyDo,
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

constructor TZasob.Create;
begin
  inherited Create();
  FRezerwacje := TRezerwacje.Create();
end;

function TZasob.CzyJestDostepny(AKiedy: TDateTime): Boolean;
begin
  Result := TDateUtile.DateBetween(AKiedy, FDostepnyDo, FDostepnyDo);
end;

function TZasob.CzyObslugujeElement(ATypElementu: TTypElementu): Boolean;
begin
  Result := ATypElementu in FAkceptowaneElementy;
end;

function TZasob.CzyJestZarezerwowany(AKiedy: TDateTime): Boolean;
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

function TZasob.CzyObslugujeUsluge(ARodzajUslugi: TRodzajUslugi): Boolean;
begin
  Result := ARodzajUslugi in FWykonywaneUslugi;
end;

destructor TZasob.Destroy;
begin
  FRezerwacje.Free();
  inherited Destroy;
end;

procedure TZasob.SetAkceptowaneElementy(const aValue: TTypyElementow);
begin
  FAkceptowaneElementy := aValue;
end;

procedure TZasob.SetDostepnyDo(const aValue: TDateTime);
begin
  FDostepnyDo := aValue;
end;

procedure TZasob.SetDostepnyOd(const aValue: TDateTime);
begin
  FDostepnyOd := aValue;
end;

procedure TZasob.SetNazwa(const aValue: String);
begin
  FNazwa := aValue;
end;

procedure TZasob.SetRodzaj(const aValue: Integer);
begin
  FRodzaj := aValue;
end;

procedure TZasob.SetWykonywaneUslugi(const aValue: TRodzajeUslug);
begin
  FWykonywaneUslugi := aValue;
end;

end.
