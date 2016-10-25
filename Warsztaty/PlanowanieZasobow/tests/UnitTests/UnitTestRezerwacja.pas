unit UnitTestRezerwacja;

interface

uses
  TestFramework, uRezerwacja;

type
  TRezerwacjaTestCase = class(TTestCase)
  private
    FBazowyObiekt: TRezerwacja;
    function StworzObiektZRoznymiWartosciamiProperty: TRezerwacja;
    function StworzBazowyObiektDoPorownan: TRezerwacja;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Test_Equals_GdyPodajeNilWParametrze_WynikiemBedzieFalse;
    procedure Test_Equals_GdyPodajeNiezgodnyTypWParametrze_WynikiemBedzieFalse;
    procedure Test_Equals_GdyPodajeTeSamaReferencje_WynikiemBedzieTrue;
    procedure Test_Equals_GdyPodajePoprawnyTypZJednymRoznymProperty_WynikiemBedzieFalse;
    procedure Test_Equals_GdyPodajeReferencjeZawierajacaDokladnieTakieSameWartociPol_WynikiemBedzieTrue;
  end;

implementation

uses
  SysUtils, uPlanowanieTypes;

function TRezerwacjaTestCase.StworzObiektZRoznymiWartosciamiProperty: TRezerwacja;
begin
  Result := TRezerwacja.Create(
    '00001', teMotocykl, ruNaprawa, EncodeDate(2014, 1, 1), seRezerwacja, EncodeDate(2014, 1, 1)
  );
end;

function TRezerwacjaTestCase.StworzBazowyObiektDoPorownan: TRezerwacja;
begin
  Result := TRezerwacja.Create(
    '00002', teSamochod, ruMycie, EncodeDate(2014, 1, 1), seRezerwacja, EncodeDate(2014, 1, 1)
  );
end;

procedure TRezerwacjaTestCase.Test_Equals_GdyPodajeNiezgodnyTypWParametrze_WynikiemBedzieFalse;
var
  v_Object: TObject;
begin
  v_Object:= TObject.Create;
  try
    CheckFalse( FBazowyObiekt.Equals(v_Object));
  finally
    v_Object.Free();
  end;
end;

procedure TRezerwacjaTestCase.Test_Equals_GdyPodajeNilWParametrze_WynikiemBedzieFalse;
begin
  CheckFalse(FBazowyObiekt.Equals(nil));
end;

procedure TRezerwacjaTestCase.Test_Equals_GdyPodajePoprawnyTypZJednymRoznymProperty_WynikiemBedzieFalse;
var
  v_TestObject: TRezerwacja;
begin
  v_TestObject := StworzObiektZRoznymiWartosciamiProperty();
  try
    CheckFalse(FBazowyObiekt.Equals(v_TestObject));
  finally
    v_TestObject.Free();
  end;
end;

procedure TRezerwacjaTestCase.Test_Equals_GdyPodajeReferencjeZawierajacaDokladnieTakieSameWartociPol_WynikiemBedzieTrue;
var
  v_TestObject: TRezerwacja;
begin
  v_TestObject := StworzBazowyObiektDoPorownan();
  try
    CheckTrue(FBazowyObiekt.Equals(v_TestObject));
  finally
    v_TestObject.Free();
  end;
end;

procedure TRezerwacjaTestCase.Test_Equals_GdyPodajeTeSamaReferencje_WynikiemBedzieTrue;
begin
  CheckTrue(FBazowyObiekt.Equals(FBazowyObiekt));
end;

procedure TRezerwacjaTestCase.SetUp;
begin
  inherited;
  FBazowyObiekt := StworzBazowyObiektDoPorownan;
end;

procedure TRezerwacjaTestCase.TearDown;
begin
  FBazowyObiekt.Free();
  inherited;
end;

end.
