unit FiftyTiftyDBCUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FiftyTiftyDBCTypes,
  Vcl.ExtCtrls;

type

  array3Byte = array[0..2] of Byte;

  TFrame3 = class(TFrame)
    formGroupEntry01: TGroupBox;
    formTime: TEdit;
    buttonColour: TButton;
    formB01: TEdit;
    formA01: TEdit;
    formG01: TEdit;
    formR01: TEdit;
    formColour: TEdit;
    procedure formColourEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

  procedure SetColorForFrame(frameParent: TFrame3);
  var
    iR, iG, iB: integer;
    R, G, B: Byte;
    strR, strG, strB: string;
  begin

    strR := frameParent.formR01.Text;
    if strR = '' then
      strR := '0';

    strG := frameParent.formG01.Text;
    if strG = '' then
      strG := '0';

    strB := frameParent.formB01.Text;
    if strB = '' then
      strB := '0';

    iR := StrToInt(strR);
    if iR > 255 then
      iR := 255;
    if iR < 0 then
      iR := 0;
    R := iR;
    frameParent.formR01.Text := IntToStr(R);

    iG := StrToInt(strG);
    if iG > 255 then
      iG := 255;
    if iG < 0 then
      iG := 0;
    G := iG;
    frameParent.formG01.Text := IntToStr(G);

    iB := StrToInt(strB);
    if iB > 255 then
      iB := 255;
    if iB < 0 then
      iB := 0;
    B := iB;
    frameParent.formB01.Text := IntToStr(B);

    frameParent.formColour.Color := RGB(R, G, B);
  end;

{$R *.dfm}

procedure TFrame3.formColourEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  formEdit: TEdit;
  frameParent: TFrame3;
begin

  if Sender is TEdit then
    formEdit := TEdit(Sender);

  frameParent := TFrame3(TScrollBox((formEdit.Parent)).Parent);
  SetColorForFrame(frameParent);
end;

end.
