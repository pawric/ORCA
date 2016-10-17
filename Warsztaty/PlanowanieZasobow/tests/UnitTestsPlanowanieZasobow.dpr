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
  uZasobLista in '..\src\uZasobLista.pas',
  uZasoby in '..\src\uZasoby.pas';

{$IFDEF DUNIT_CONSOLE_MODE}
  {$APPTYPE CONSOLE}
{$ELSE}
  {$R *.RES}
{$ENDIF}

begin
{$IFDEF DUNIT_CONSOLE_MODE}
  if not FindCmdLineSwitch('Graphic', ['-','/'], True) then
    TextTestRunner.RunRegisteredTests(rxbHaltOnFailures)
  else
{$ENDIF}
    GUITestRunner.RunRegisteredTests;
end.
