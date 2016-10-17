unit uZasoby;

interface

uses
  uRezerwacja, uZasob, uZasobLista;

type
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

implementation

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

end.
