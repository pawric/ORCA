unit uRezerwacje;

interface

uses
  Contnrs, uRezerwacja;

type
  TRezerwacje = class(TObject)
  private
    FItems: TObjectList;
    function GetCount: Integer;
    function GetItems(Index: Integer): TRezerwacja;
    procedure SetItems(Index: Integer; const Value: TRezerwacja);
  public
    constructor Create();
    destructor Destroy; Override;
    function Add(ARezerwacja: TRezerwacja): Integer;
    function Remove(ARezerwacja: TRezerwacja): Integer;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TRezerwacja read GetItems write SetItems; default;
  end;

implementation

function TRezerwacje.Add(ARezerwacja: TRezerwacja): Integer;
begin
  Result := FItems.Add(ARezerwacja);
end;

constructor TRezerwacje.Create;
begin
  inherited;
  FItems := TObjectList.Create();
end;

destructor TRezerwacje.Destroy;
begin
  FItems.Free();
  inherited;
end;

function TRezerwacje.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TRezerwacje.GetItems(Index: Integer): TRezerwacja;
begin
  Result := TRezerwacja(FItems[Index]);
end;

function TRezerwacje.Remove(ARezerwacja: TRezerwacja): Integer;
begin
  result := FItems.Remove(ARezerwacja);
end;

procedure TRezerwacje.SetItems(Index: Integer; const Value: TRezerwacja);
begin
  FItems[Index] := Value;
end;

end.
