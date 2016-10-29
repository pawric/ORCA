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
    constructor Create;
    property Stanowiska: TStanowiskoList read GetStanowiska;
  end;

implementation

uses
  SysUtils, uStanowisko, uPlanowanieTypes;

constructor TTestowyWarsztat.Create;
begin
  inherited;
  FStanowiska.Add(
    TStanowisko.Create(
      [teSamochod],
      EncodeDate(2016, 1,1) + EncodeTime(18,0,0,0),
      EncodeDate(2016, 1,1) + EncodeTime(8,0,0,0),
      'Myjnia bezdotykowa',
      1,
      [ruMycie]
    )
  );
end;

{ TTestowyWarsztat }

function TTestowyWarsztat.GetStanowiska: TStanowiskoList;
begin
  if not Assigned(FStanowiska) then
    FStanowiska := TStanowiskoList.Create();

  Result := FStanowiska;
end;

end.
