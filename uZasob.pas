unit uZasob;

interface

uses
  Contnrs, uPlanowanieTypes, uRezerwacja;

type
  TZasob = class(TObject)
  private
    FAkceptowaneElementy: TTypyElementow;
    FDostepnyDo: TDateTime;
    FDostepnyOd: TDateTime;
    FElementy: TObjectList;
    FNazwa: String;
    FRodzaj: Integer;
//    FMaksymalnaLiczbaElementow: Integer;
    FWykonaywaneUslugi: TRodzajeUslug;
    function GetCount: Integer;
    function GetItems(Index: Integer): TRezerwacja;
    procedure SetAkceptowaneElementy(const aValue: TTypyElementow);
    procedure SetDostepnyDo(const aValue: TDateTime);
    procedure SetDostepnyOd(const aValue: TDateTime);
    procedure SetItems(Index: Integer; const Value: TRezerwacja);
    procedure SetNazwa(const aValue: String);
    procedure SetRodzaj(const aValue: Integer);
    procedure SetWykonaywaneUslugi(const aValue: TRodzajeUslug);
  public
    constructor Create;
    destructor Destroy; override;
    function Add(const aObject: TObject): Integer;
    procedure Remove(const aObject: TObject);
    property AkceptowaneElementy: TTypyElementow read FAkceptowaneElementy write SetAkceptowaneElementy;
    property Count: Integer read GetCount;
    property DostepnyDo: TDateTime read FDostepnyDo write SetDostepnyDo;
    property DostepnyOd: TDateTime read FDostepnyOd write SetDostepnyOd;
    property Items[Index: Integer]: TRezerwacja read GetItems write SetItems; default;
    property Nazwa: String read FNazwa write SetNazwa;
    property Rodzaj: Integer read FRodzaj write SetRodzaj;
    property WykonaywaneUslugi: TRodzajeUslug read FWykonaywaneUslugi write SetWykonaywaneUslugi;
  end;

implementation

uses Classes;

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

function TZasob.Add(const aObject: TObject): Integer;
begin
  {Dzia³anie jak w przypadku metody Remove}
  Result := FElementy.Add(aObject);
end;

function TZasob.GetCount: Integer;
begin
  Result := FElementy.Count;
end;

function TZasob.GetItems(Index: Integer): TRezerwacja;
begin
  Result := FElementy[Index] as TRezerwacja
end;

procedure TZasob.Remove(const aObject: TObject);
begin
  {Poniewaz po wydzielenieach kodu do oddzielnych unitów - zwiekszeniu hermetyzacji wystepuje blad kompilacji poniewaz brakuje tej metody dla
   zasobu nalezy ja zdefiniowac. Jako ze nie chcemy udostepniac wewnetrznej listy zasobow do jakiejkolwiek kontroli}
  FElementy.Remove(aObject);
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

procedure TZasob.SetItems(Index: Integer; const Value: TRezerwacja);
begin
  FElementy[Index] := Value;
end;

procedure TZasob.SetNazwa(const aValue: String);
begin
  FNazwa := aValue;
end;

procedure TZasob.SetRodzaj(const aValue: Integer);
begin
  FRodzaj := aValue;
end;

procedure TZasob.SetWykonaywaneUslugi(const aValue: TRodzajeUslug);
begin
  FWykonaywaneUslugi := aValue;
end;

end.
