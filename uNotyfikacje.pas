unit uNotyfikacje;

interface

type
  INotifier = interface(IInterface)
  ['{90CEA0AB-9158-45FA-B0E5-9B402B803AF3}']
    procedure Notify();
  end;

  IEmailNotifier = interface(INotifier)
  ['{FBE2B767-566B-4AFD-866C-5C56578074A8}']
    procedure SetSender(const aSender: String);
    procedure SetReceiver(const aSender: String);
    procedure SetContent(const aContent: String);
  end;

  TEmailNotifier = class(TInterfacedObject, IEmailNotifier)
  private
    FContent: String;
    FReceiver: String;
    FSender: String;
    procedure SendMail();
  public
    procedure SetContent(const aContent: String);
    procedure SetReceiver(const aSender: String);
    procedure SetSender(const aSender: String);
    procedure Notify();
  end;

implementation

procedure TEmailNotifier.Notify;
begin
  SendMail();
end;

procedure TEmailNotifier.SendMail;
begin

end;

procedure TEmailNotifier.SetContent(const aContent: String);
begin
  FContent := aContent;
end;

procedure TEmailNotifier.SetReceiver(const aSender: String);
begin
  FReceiver := aSender;
end;

procedure TEmailNotifier.SetSender(const aSender: String);
begin
  FSender := aSender;
end;

end.
