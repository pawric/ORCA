unit UnitTestPlanowanie;

interface

uses
  TestFramework, uPlanowanie, uTestowyWarsztat;

type
  TPlanowanieTestCase = class(TTestCase)
  private
    FPlanowanie: TPlanowanie;
    FWarsztat: TTestowyWarsztat;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Test_WykonajRezerwacje_GdyWarsztacieNieMaZadnychRezerwacji_MetodaZwrociNowaRezewacjeIDodaElementNaListe;
  end;

implementation

uses
  SysUtils, uRezerwacja, uPlanowanieTypes;
{ TPlanowanieTestCase }

procedure TPlanowanieTestCase.SetUp;
begin
  inherited;
  FWarsztat := TTestowyWarsztat.Create();
  FPlanowanie := TPlanowanie.Create(FWarsztat.Stanowiska);
end;

procedure TPlanowanieTestCase.TearDown;
begin
  FPlanowanie.Free();
  FWarsztat.Free();
  inherited;
end;

procedure TPlanowanieTestCase.Test_WykonajRezerwacje_GdyWarsztacieNieMaZadnychRezerwacji_MetodaZwrociNowaRezewacjeIDodaElementNaListe;
var
  v_Rezerwacja: TRezerwacja;
begin
  v_Rezerwacja := FPlanowanie.WykonajRezerwacje(
    EncodeDate(2016,1,1)+EncodeTime(8,0,0,0),
    ruMycie,
    '100000',
    teSamochod
  );

  CheckNotNull(v_Rezerwacja, 'nie utworzono rezerwacji w pustym i dostepnym warsztacie');
end;

end.
