program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {formWindow},
  FiftyTiftyDBCReader in 'FiftyTiftyDBCReader.pas',
  FiftyTiftyDBCTypes in 'FiftyTiftyDBCTypes.pas',
  FiftyTiftyDBCUI in 'FiftyTiftyDBCUI.pas' {Frame3: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformWindow, formWindow);
  Application.Run;
end.
