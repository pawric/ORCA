unit uRezerwacjeList;

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
    function Contains(ARezerwacja: TRezerwacja): Boolean;
    /// <summary>Metod przeszukuje sekwencj� danych w poszukiwaniu pierwszego
    /// wyst�pienia obiektu kt�rego warto�ci sa r�wne podanemu w parametrze metody
    /// wyst�pieniu.
    /// </summary>
    /// <returns> TRezerwacja - wyst�pienie obiektu ( refrencja) jesli obiekt zosta�
    /// znaleziony TRezrewacjaNullObject jesli obiekt nie zosta� znleziony
    /// </returns>
    /// <param name="ARezerwacja"> (TRezerwacja) - obiekt reprezentuj�cy warto�ci kt�re
    /// chcemy odnale��</param>
    function Find(ARezerwacja: TRezerwacja): TRezerwacja;
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

function TRezerwacje.Contains(ARezerwacja: TRezerwacja): Boolean;
begin
  Result := ARezerwacja.Equals(Find(ARezerwacja));
end;

function TRezerwacje.Find(ARezerwacja: TRezerwacja): TRezerwacja;
var
  i: Integer;
begin

  Result := nil;
  for i:= 0 to Pred(FItems.Count) do
  begin
    if Items[i].Equals(ARezerwacja) then
    begin
      Result := Items[i];
      Break;
    end;
  end;
  if not Assigned(Result) then
    Result := TRezerwacjaNullObject.Create();

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
