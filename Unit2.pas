unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrame2 = class(TFrame)
    formGroupEntry01: TGroupBox;
    formTime: TEdit;
    buttonColour: TButton;
    formB01: TEdit;
    formA01: TEdit;
    formG01: TEdit;
    formR01: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
