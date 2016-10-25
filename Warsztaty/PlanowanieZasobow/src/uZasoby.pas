unit uZasoby;

interface

uses
  Contnrs, uRezerwacja, uZasob;

type
  TZasoby = class(TObject)
  private
    FItems: TObjectList;
    function GetCount: Integer;
    function GetItems(Index: Integer): TZasob;
    procedure SetItems(Index: Integer; const Value: TZasob);
  public
    constructor Create();
    destructor Destroy; Override;
    function Add(AZasob: TZasob): Integer;
    function Remove(AZasob: TZasob): Integer;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TZasob read GetItems write SetItems; default;
  end;

implementation

function TZasoby.Add(AZasob: TZasob): Integer;
begin
  Result := FItems.Add(AZasob);
end;

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

function TZasoby.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TZasoby.GetItems(Index: Integer): TZasob;
begin
  Result := TZasob(FItems[Index]);
end;

function TZasoby.Remove(AZasob: TZasob): Integer;
begin
  result := FItems.Remove(AZasob);
end;

procedure TZasoby.SetItems(Index: Integer; const Value: TZasob);
begin
  {!!!}
  FItems[Index] := Value;
end;

end.
