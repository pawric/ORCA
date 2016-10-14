unit uZasob;

interface

uses
  Contnrs;

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
    procedure SetAkceptowaneElementy(const aValue: TTypyElementow);
    procedure SetDostepnyDo(const aValue: TDateTime);
    procedure SetDostepnyOd(const aValue: TDateTime);
    procedure SetNazwa(const aValue: String);
    procedure SetRodzaj(const aValue: Integer);
    procedure SetWykonaywaneUslugi(const aValue: TRodzajeUslug);
  public
    constructor Create;
    destructor Destroy; override;
    property AkceptowaneElementy: TTypyElementow read FAkceptowaneElementy write
        SetAkceptowaneElementy;
    property DostepnyDo: TDateTime read FDostepnyDo write SetDostepnyDo;
    property DostepnyOd: TDateTime read FDostepnyOd write SetDostepnyOd;
    property Nazwa: String read FNazwa write SetNazwa;
    property Rodzaj: Integer read FRodzaj write SetRodzaj;
    property WykonaywaneUslugi: TRodzajeUslug read FWykonaywaneUslugi write
        SetWykonaywaneUslugi;
  end;

implementation

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

procedure TZasob.SetWykonaywaneUslugi(const aValue: TRodzajeUslug);
begin
  FWykonaywaneUslugi := aValue;
end;

end.
