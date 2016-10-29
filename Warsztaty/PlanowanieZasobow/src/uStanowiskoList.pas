unit uStanowiskoList;

interface

uses
  Contnrs, uRezerwacja, uStanowisko;

type
  TStanowiskoList = class(TObject)
  private
    FItems: TObjectList;
    function GetCount: Integer;
    function GetItems(Index: Integer): TStanowisko;
    procedure SetItems(Index: Integer; const Value: TStanowisko);
  public
    constructor Create();
    destructor Destroy; Override;
    function Add(AStanowisko: TStanowisko): Integer;
    function Remove(AStanowisko: TStanowisko): Integer;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TStanowisko read GetItems write SetItems;
        default;
  end;

implementation

function TStanowiskoList.Add(AStanowisko: TStanowisko): Integer;
begin
  Result := FItems.Add(AStanowisko);
end;

constructor TStanowiskoList.Create;
begin
  inherited;
  FItems := TObjectList.Create();
end;

destructor TStanowiskoList.Destroy;
begin
  FItems.Free();
  inherited;
end;

function TStanowiskoList.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TStanowiskoList.GetItems(Index: Integer): TStanowisko;
begin
  {!!!}
  Result := TStanowisko(FItems[Index]);
end;

function TStanowiskoList.Remove(AStanowisko: TStanowisko): Integer;
begin
  result := FItems.Remove(AStanowisko);
end;

procedure TStanowiskoList.SetItems(Index: Integer; const Value: TStanowisko);
begin
  {!!!}
  FItems[Index] := Value;
end;

end.
