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
  UnitTestZasob, UnitTestPlanowanie;

class function TPlanowanieZasobowTestSuite.GetAllTests: ITestSuite;
begin
  Result := TTestSuite.Create('Planowanie zasobów', [
    TZasobTestCase.Suite(),
    TPlanowanieTestCase.Suite()
  ]);
end;

end.
