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
    procedure Test_Remove_GdyUsuwamIstniejacyElement_WtedyCountPowinnoZmniejszycSieOJeden;
    procedure Test_Remove_GdyUsuwamNil_WtedyCountNiePowinnoSieZmniejszyc;
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

procedure TZasobTestCase.Test_Remove_GdyUsuwamIstniejacyElement_WtedyCountPowinnoZmniejszycSieOJeden;
var
  v_Object: TObject;
  v_Count: Integer;
begin
  v_Object := TObject.Create();
  FZasob.Add(v_Object);
  v_Count := FZasob.Count;
  FZasob.Remove(v_Object);
  CheckEquals(v_Count-1, FZasob.Count);
end;

procedure TZasobTestCase.Test_Remove_GdyUsuwamNil_WtedyCountNiePowinnoSieZmniejszyc;
var
  v_Object: TObject;
  v_Count: Integer;
begin
  v_Object := TObject.Create();
  FZasob.Add(v_Object);
  v_Count := FZasob.Count;
  FZasob.Remove(nil);
  CheckEquals(v_Count, FZasob.Count);
end;

end.
