//{$DEFINE DUNIT_CONSOLE_MODE}

program OOPWp2;

uses
  SysUtils,
  TestFramework,
  TestExtensions,
  GUITestRunner,
  TextTestRunner,
  UnitTestDummy in 'UnitTestDummy.pas',
  uPlanowanie in 'uPlanowanie.pas',
  uNotifikacje in 'uNotifikacje.pas',
  uGrafik in 'uGrafik.pas',
  uZasob in 'uZasob.pas',
  uPlanowanieTypes in 'uPlanowanieTypes.pas',
  uRezerwacja in 'uRezerwacja.pas',
  uZasobLista in 'uZasobLista.pas',
  uZasoby in 'uZasoby.pas';

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
