{******************************************************************************}
{                                                                              }
{          Test Name:                                                          }
{             Author:                                                          }
{            Version:                                                          }
{            Summary:                                                          }
{           Comments:                                                          }
{                                                                              }
{******************************************************************************}

unit UnitTestDummy;

interface

uses
  Windows, SysUtils, Classes, TestFramework, TestExtensions;

type
  TTest = class(TTestCase)
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Test;
  end;

implementation

procedure TTest.Setup;
begin

end;

procedure TTest.TearDown;
begin

end;

procedure TTest.Test;
begin

end;

initialization
  TestFramework.RegisterTest(TTest.Suite);

end.

