unit uTestowyWarsztat;

interface

uses
  uStanowiskoList;

type
  TTestowyWarsztat = class(TObject)
  private
    FStanowiska: TStanowiskoList;
    function GetStanowiska: TStanowiskoList;
  public
    property Stanowiska: TStanowiskoList read GetStanowiska;
  end;

implementation

{ TTestowyWarsztat }

function TTestowyWarsztat.GetStanowiska: TStanowiskoList;
begin
  if not Assigned(FStanowiska) then
    FStanowiska := TStanowiskoList.Create();

  Result := FStanowiska;
end;

end.
