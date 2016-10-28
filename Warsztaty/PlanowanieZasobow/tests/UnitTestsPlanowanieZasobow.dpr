//{$DEFINE DUNIT_CONSOLE_MODE}

program UnitTestsPlanowanieZasobow;

uses
  SysUtils,
  TestFramework,
  TestExtensions,
  GUITestRunner,
  TextTestRunner,
  UnitTestDummy in 'UnitTests\UnitTestDummy.pas',
  uPlanowanie in '..\src\uPlanowanie.pas',
  uNotyfikacje in '..\src\uNotyfikacje.pas',
  uGrafik in '..\src\uGrafik.pas',
  uZasob in '..\src\uZasob.pas',
  uPlanowanieTypes in '..\src\uPlanowanieTypes.pas',
  uRezerwacja in '..\src\uRezerwacja.pas',
  uZasoby in '..\src\uZasoby.pas',
  uPlanowanieZasobowTestSuite in 'TestSuites\uPlanowanieZasobowTestSuite.pas',
  UnitTestZasob in 'UnitTests\UnitTestZasob.pas',
  UnitTestPlanowanie in 'UnitTests\UnitTestPlanowanie.pas',
  uRezerwacjeList in '..\src\uRezerwacjeList.pas',
  uDateUtils in '..\src\uDateUtils.pas',
  UnitTestRezerwacja in 'UnitTests\UnitTestRezerwacja.pas';

{$IFDEF DUNIT_CONSOLE_MODE}
  {$APPTYPE CONSOLE}
{$ELSE}
  {$R *.RES}
{$ENDIF}

begin
{$IFDEF DUNIT_CONSOLE_MODE}
  if not FindCmdLineSwitch('Graphic', ['-','/'], True) then
    TextTestRunner.RunTests(TPlanowanieZasobowTestSuite.GetAllTests(), rxbHaltOnFailures)
  else
{$ENDIF}
    GUITestRunner.RunTest(TPlanowanieZasobowTestSuite.GetAllTests);
end.
