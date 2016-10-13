unit uGrafik;

interface

uses
  uPlanowanie;

type
  TElementGraficzny = class(TObject)
  end;

  TGraficznyRodzajElementu = class(TElementGraficzny)
  private
    Felement: TRezerwacja;
  public
    constructor Create(const aElement: TRezerwacja);
  end;

  TGraficznyRodzajUslugi = class(TElementGraficzny)
  private
    FZasob: TZasob;
  public
    constructor Create(const aZasob: TZasob);
  end;

  TGrafik = class(TObject)
  private
    procedure NarysujSamochod(const aElement: TGraficznyRodzajElementu);
    procedure NarysujRower(const aElement: TGraficznyRodzajElementu);
    procedure NarysujMotocykl(const aElement: TGraficznyRodzajElementu);
    procedure NarysujMyjnie(const aElement: TGraficznyRodzajUslugi);
    procedure NarysujWarsztat(const aElement: TGraficznyRodzajUslugi);
  public
    procedure NarysujElement(const aElement: TGraficznyRodzajElementu);
    procedure NarysujZasob(const aZasob: TGraficznyRodzajUslugi);
  end;

implementation

{ TGraficznyRodzajElementu }

constructor TGraficznyRodzajElementu.Create(const aElement: TRezerwacja);
begin
  inherited Create();
  Felement := aElement;
end;

{ TGraficznyRodzajUslugi }

constructor TGraficznyRodzajUslugi.Create(const aZasob: TZasob);
begin
  inherited Create();
  FZasob := aZasob;
end;

{ TGrafik }

procedure TGrafik.NarysujElement(const aElement: TGraficznyRodzajElementu);
begin
  case aElement.Felement.Rodzaj of
    teSamochod: NarysujSamochod(aElement);
    teMotocykl: NarysujMotocykl(aElement);
    teRower: NarysujRower(aElement);
  end;
end;

procedure TGrafik.NarysujMotocykl(
  const aElement: TGraficznyRodzajElementu);
begin

end;

procedure TGrafik.NarysujMyjnie(const aElement: TGraficznyRodzajUslugi);
begin

end;

procedure TGrafik.NarysujRower(const aElement: TGraficznyRodzajElementu);
begin

end;

procedure TGrafik.NarysujSamochod(
  const aElement: TGraficznyRodzajElementu);
begin

end;

procedure TGrafik.NarysujWarsztat(const aElement: TGraficznyRodzajUslugi);
begin

end;

procedure TGrafik.NarysujZasob(const aZasob: TGraficznyRodzajUslugi);
begin
  case aZasob.FZasob.FRodzaj of
    0: NarysujMyjnie(aZasob);
    1: NarysujWarsztat(aZasob);
  end;
end;

end.
