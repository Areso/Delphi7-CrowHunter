program CrowHunter;

uses
  Forms,
  Unit1 in '..\ANIME\Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'CrowHunter';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
