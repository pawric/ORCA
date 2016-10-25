unit uPlanowanieZasobowTestSuite;

interface

uses
  TestFramework;

type
  TPlanowanieZasobowTestSuite = class(TObject)
  public
    class function GetAllTests: ITestSuite;
  end;

implementation

uses
  UnitTestZasob, UnitTestPlanowanie, UnitTestRezerwacja;

class function TPlanowanieZasobowTestSuite.GetAllTests: ITestSuite;
begin
  Result := TTestSuite.Create('Planowanie zasobów', [
    TRezerwacjaTestCase.Suite(),
    TZasobTestCase.Suite(),
    TPlanowanieTestCase.Suite()
  ]);
end;

end.
