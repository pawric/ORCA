unit UnitTestZasob;

interface

uses
  TestFramework, uZasob, uRezerwacja;

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
  FZasob.Rezerwacje.Add(TRezerwacja.Create());
  CheckEquals(1, FZasob.Rezerwacje.Count);
end;

procedure TZasobTestCase.Test_Add_GdyDodajePustyElement_WtedyCountPowinnoWskazywacDokladnieZero;
begin
  FZasob.Rezerwacje.Add(nil);
  CheckEquals(0, FZasob.Rezerwacje.Count);
end;

procedure TZasobTestCase.Test_Remove_GdyUsuwamIstniejacyElement_WtedyCountPowinnoZmniejszycSieOJeden;
var
  v_Rezerwacja: TRezerwacja;
  v_Count: Integer;
begin
  v_Rezerwacja := TRezerwacja.Create();
  FZasob.Rezerwacje.Add(v_Rezerwacja);
  v_Count := FZasob.Rezerwacje.Count;
  FZasob.Rezerwacje.Remove(v_Rezerwacja);
  CheckEquals(v_Count-1, FZasob.Rezerwacje.Count);
end;

procedure TZasobTestCase.Test_Remove_GdyUsuwamNil_WtedyCountNiePowinnoSieZmniejszyc;
var
  v_Rezerwacja: TRezerwacja;
  v_Count: Integer;
begin
  v_Rezerwacja := TRezerwacja.Create();
  FZasob.Rezerwacje.Add(v_Rezerwacja);
  v_Count := FZasob.Rezerwacje.Count;
  FZasob.Rezerwacje.Remove(nil);
  CheckEquals(v_Count, FZasob.Rezerwacje.Count);
end;

end.

