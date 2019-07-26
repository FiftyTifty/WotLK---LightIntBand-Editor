unit FiftyTiftyDBCUIFunctions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FiftyTiftyDBCTypes,
  FiftyTiftyDBCUI;

  function LaunchColorPicker(dialogToOpen: TColorDialog; frameParent: TFrame3): TColor;
  function GetRGBBytesFromTColor(Color: TColor): array3Byte;
  procedure SetColorForFrame(frameParent: TFrame3);

implementation

  function LaunchColorPicker(dialogToOpen: TColorDialog; frameParent: TFrame3): TColor;
  var
    byteR, byteG, byteB: Byte;
    arrayRGB: array3Byte;
    colorOutput: TColor;
  begin

    byteR := StrToInt(frameParent.formR01.Text);
    byteG := StrToInt(frameParent.formG01.Text);
    byteB := StrToInt(frameParent.formB01.Text);

    colorOutput := RGB(byteR, byteG, byteB); //Get current RGB

    dialogToOpen.Color := colorOutput; //Open colour picker with initial RGB being current values

    if dialogToOpen.Execute then begin

      colorOutput := dialogToOpen.Color;
      arrayRGB := GetRGBBytesFromTColor(colorOutput);

      frameParent.formR01.Text := IntToStr(arrayRGB[0]);
      frameParent.formG01.Text := IntToStr(arrayRGB[1]);
      frameParent.formB01.Text := IntToStr(arrayRGB[2]);

      frameParent.formColour.Color := colorOutput;

    end;


  end;

  function GetRGBBytesFromTColor(Color: TColor): array3Byte;
  var
    R,G,B: Integer;
    arrayRGB: array3Byte;
  begin

    R := Color and $ff;
    G := (Color and $ff00) shr 8;
    B := (Color and $ff0000) shr 16;

    arrayRGB[0] := StrToInt(IntToStr(R));
    arrayRGB[1] := StrToInt(IntToStr(G));
    arrayRGB[2] := StrToInt(IntToStr(B));

    result := arrayRGB;

  end;

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

end.
