unit uDateUtils;

interface

type
  TDateUtile = class(TObject)
    class function DateBetween(ADataPorownywana, ADataPoczatkowa, ADataKoncowa: TDateTime): Boolean;
  end;

implementation

{ TDateUtile }

class function TDateUtile.DateBetween(ADataPorownywana, ADataPoczatkowa,
  ADataKoncowa: TDateTime): Boolean;
begin
  Result := (ADataPoczatkowa <= ADataPorownywana) and (ADataPorownywana <= ADataKoncowa);
end;

end.
