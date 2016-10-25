unit uRezerwacja;

interface

uses
  uPlanowanieTypes;
  
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
    constructor Create(); overload;
    constructor Create(const ANumerKlienta, ANumerRejestracji: String; ARodzaj: TTypElementu;
      ARodzajUslugi: TRodzajUslugi; ARozpoczeciePrac: TDateTime; AStatus: TStatusElementu;
      AZakonczeniePrac: TDateTime); overload;
    property NumerKlienta: String read FNumerKlienta write SetNumerKlienta;
    property NumerRejestracji: String read FNumerRejestracji write SetNumerRejestracji;
    property Rodzaj: TTypElementu read FRodzaj write SetRodzaj;
    property RodzajUslugi: TRodzajUslugi read FRodzajUslugi write SetRodzajUslugi;
    property RozpoczeciePrac: TDateTime read FRozpoczeciePrac write SetRozpoczeciePrac;
    property Status: TStatusElementu read FStatus write SetStatus;
    property ZakonczeniePrac: TDateTime read FZakonczeniePrac write SetZakonczeniePrac;
  end;

implementation

constructor TRezerwacja.Create(const ANumerKlienta, ANumerRejestracji: String; ARodzaj: TTypElementu;
  ARodzajUslugi: TRodzajUslugi; ARozpoczeciePrac: TDateTime; AStatus: TStatusElementu; AZakonczeniePrac: TDateTime);
begin
  Create;
  FNumerKlienta := ANumerKlienta;
  FNumerRejestracji := ANumerRejestracji;
  FRodzaj := ARodzaj;
  FRodzajUslugi := ARodzajUslugi;
  FRozpoczeciePrac := ARozpoczeciePrac;
  FStatus := AStatus;
  FZakonczeniePrac := AZakonczeniePrac;
end;

constructor TRezerwacja.Create;
begin
  inherited Create;
  FNumerKlienta := '';
  FNumerRejestracji := '';
  FRodzaj := teSamochod;
  FRodzajUslugi := ruNaprawa;
  FRozpoczeciePrac := 0;
  FStatus := seRezerwacja;
  FZakonczeniePrac := 0;
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

end.
