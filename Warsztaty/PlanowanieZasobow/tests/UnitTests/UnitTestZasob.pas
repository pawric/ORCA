unit UnitTestZasob;

interface

uses
  TestFramework, uZasob;

type
  TZasobTestCase = class(TTestCase)
  private
    FZasob: TZasob;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Test_Add_GdyDodajeElement_WtedyCountPowinnoWskazywacDokladnie1;
    procedure Test_Add_GdyDodajePustyElement_WtedyCountPowinnoWskazywacDokladnieZero;
  end;

implementation

{ TZasobTestCase }

procedure TZasobTestCase.SetUp;
begin
  inherited;
  FZasob := TZasob.Create();
end;

procedure TZasobTestCase.TearDown;
begin
  FZasob.Free();
  inherited;
end;

procedure TZasobTestCase.Test_Add_GdyDodajeElement_WtedyCountPowinnoWskazywacDokladnie1;
begin
  FZasob.Add(TObject.Create());
  CheckEquals(1, FZasob.Count);
end;

procedure TZasobTestCase.Test_Add_GdyDodajePustyElement_WtedyCountPowinnoWskazywacDokladnieZero;
begin
  FZasob.Add(nil);
  CheckEquals(0, FZasob.Count);
end;

end.
