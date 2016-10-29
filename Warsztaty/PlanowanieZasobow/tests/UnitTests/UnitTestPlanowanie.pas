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
  CheckEquals('100000',v_Rezerwacja.NumerKlienta);
  CheckEquals(EncodeDate(2016,1,1)+EncodeTime(8,0,0,0),v_Rezerwacja.RozpoczeciePrac, 'Data i czas rozpoczecia prac nie pasuja do oczekiwanego');
  CheckEquals(EncodeDate(2016,1,1)+EncodeTime(8,0,0,0),v_Rezerwacja.ZakonczeniePrac, 'Data i czas zakonczenia prac nie pasuja do oczekiwanego');
  CheckTrue(v_Rezerwacja.RodzajUslugi = ruMycie);
  CheckTrue(v_Rezerwacja.Rodzaj = teSamochod);
  CheckTrue(v_Rezerwacja.Status = seRezerwacja);
end;

end.
