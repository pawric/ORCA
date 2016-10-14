unit uZasobLista;

interface

uses
  Contnrs, uZasob;

type
  TZasobLista = class(TObjectList)
  private
    function GetItems(Index: Integer): TZasob;
    procedure SetItems(Index: Integer; const aValue: TZasob);
  public
    property Items[Index: Integer]: TZasob read GetItems write SetItems; default;
  end;

implementation

function TZasobLista.GetItems(Index: Integer): TZasob;
begin
  Result := (inherited Items[Index] as TZasob);
end;

procedure TZasobLista.SetItems(Index: Integer; const aValue: TZasob);
begin
  inherited Items[Index] := aValue;
end;

end.
