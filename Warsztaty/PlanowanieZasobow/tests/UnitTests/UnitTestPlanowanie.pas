unit UnitTestPlanowanie;

interface

uses
  TestFramework, uPlanowanie;

type
  TPlanowanieTestCase = class(TTestCase)
  private
    FPlanowanie: TPlanowanie;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published

  end;

implementation

{ TPlanowanieTestCase }

procedure TPlanowanieTestCase.SetUp;
begin
  inherited;

end;

procedure TPlanowanieTestCase.TearDown;
begin
  inherited;

end;

end.
