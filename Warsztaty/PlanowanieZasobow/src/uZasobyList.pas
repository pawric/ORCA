unit uZasobyList;

interface

uses
  Contnrs, uRezerwacja, uZasob;

type
  TZasobyList = class(TObject)
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

function TZasobyList.Add(AZasob: TZasob): Integer;
begin
  Result := FItems.Add(AZasob);
end;

constructor TZasobyList.Create;
begin
  inherited;
  FItems := TObjectList.Create();
end;

destructor TZasobyList.Destroy;
begin
  FItems.Free();
  inherited;
end;

function TZasobyList.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TZasobyList.GetItems(Index: Integer): TZasob;
begin
  Result := TZasob(FItems[Index]);
end;

function TZasobyList.Remove(AZasob: TZasob): Integer;
begin
  result := FItems.Remove(AZasob);
end;

procedure TZasobyList.SetItems(Index: Integer; const Value: TZasob);
begin
  {!!!}
  FItems[Index] := Value;
end;

end.
