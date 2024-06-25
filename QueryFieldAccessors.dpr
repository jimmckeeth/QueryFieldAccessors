program QueryFieldAccessors;

uses
  Vcl.Forms,
  QueryFieldAccessorsMain in 'QueryFieldAccessorsMain.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows11 Impressive Dark');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
