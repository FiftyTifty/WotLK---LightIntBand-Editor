unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls, ExtCtrls,
  FiftyTiftyAuxFunctions, FiftyTiftyDBCTypes, FiftyTiftyDBCReader, FiftyTiftyDBCUI,
  FiftyTiftyDBCUIFunctions;

type
  TformWindow = class(TForm)
    formMenu: TMainMenu;
    File1: TMenuItem;
    Load1: TMenuItem;
    formOpenFile: TOpenDialog;
    formTree: TTreeView;
    formGroup: TScrollBox;
    formID: TEdit;
    dialogColor: TColorDialog;
    formSearch: TEdit;
    frameEntry01: TFrame3;
    frameEntry02: TFrame3;
    frameEntry03: TFrame3;
    frameEntry04: TFrame3;
    frameEntry05: TFrame3;
    frameEntry06: TFrame3;
    frameEntry07: TFrame3;
    FrameEntry08: TFrame3;
    frameEntry09: TFrame3;
    frameEntry10: TFrame3;
    frameEntry11: TFrame3;
    frameEntry12: TFrame3;
    frameEntry13: TFrame3;
    frameEntry14: TFrame3;
    frameEntry15: TFrame3;
    frameEntry16: TFrame3;
    formNumEntries: TComboBox;
    formApply: TButton;
    Save: TMenuItem;
    formSaveFile: TSaveDialog;
    procedure Load1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure formTreeChange(Sender: TObject; Node: TTreeNode);
    procedure frameEntrybuttonColourClick(Sender: TObject);
    procedure formTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure formNumEntriesChange(Sender: TObject);
    //procedure formIDChange(Sender: TObject);
    procedure formIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure formApplyClick(Sender: TObject);
    procedure formSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  iNumIntBandBytes = 136;

var
  formWindow: TformWindow;

  tmemorystreamDBCFile: TMemoryStream;
  dbcheaderHeader: DBCHeader;
  iNumRecords: integer;
  arrayIntBand, arrayIntBandOutput: array of IntBand;
  byteEmptyStringBlock: Byte;

implementation

{$R *.dfm}

procedure TformWindow.formApplyClick(Sender: TObject);
var
  nodeFromTree: TTreeNode;
  intbandFromNode: ptrIntBand;
  iNumEntries: FixedUInt;
  iTimeIndex: ShortInt;
  tstrlistTimeValues: TStringList;
  strTimeValue: string;
  iCounter, iCounterFrames: integer;
  componentFrameEntry: TComponent;
  frameentryCurrent: TFrame3;
begin

  tstrlistTimeValues := TStringList.Create;

  nodeFromTree := formTree.Selected;
  intbandFromNode := nodeFromTree.Data;

  iNumEntries := StrToInt(formNumEntries.Text);

  for iCounterFrames := 0 to iNumEntries - 1 do begin

    componentFrameEntry := formGroup.Controls[iCounterFrames];
    frameentryCurrent := TFrame3(componentFrameEntry);
    strTimeValue := frameentryCurrent.formTime.Text;

    iTimeIndex := tstrlistTimeValues.IndexOf(strTimeValue);

    if iTimeIndex >= 0 then begin
      ShowMessage('Error! Changes not saved! Duplicate time values for entry #' + IntToStr(iCounterFrames + 1) + ' and #' + IntToStr(iTimeIndex + 1));
      tstrlistTimeValues.Free;
      exit;
    end;

    tstrlistTimeValues.Add(strTimeValue);


  end;

  intbandFromNode.NumberOfEntries := iNumEntries;

  intbandFromNode.EntryID := StrToInt(formID.Text);


  for iCounter := 0 to iNumEntries - 1 do begin

    componentFrameEntry := formGroup.Controls[iCounter];
    frameentryCurrent := TFrame3(componentFrameEntry);

    intbandFromNode.TimeArray[iCounter] := StrToInt(frameentryCurrent.formTime.Text);

    intbandFromNode.ColorArray[iCounter, 0] := StrToInt(frameentryCurrent.formB01.Text);
    intbandFromNode.ColorArray[iCounter, 1] := StrToInt(frameentryCurrent.formG01.Text);
    intbandFromNode.ColorArray[iCounter, 2] := StrToInt(frameentryCurrent.formR01.Text);


  end;

  tstrlistTimeValues.Free;

end;


procedure TformWindow.formIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nodeSelected: TTreeNode;
  intbandSelected: ptrIntBand;
begin

  if (Key = VK_OEM_PLUS) then
    formID.Text := IntToStr((StrToInt(formID.Text)) + 1);

  if (Key = VK_OEM_MINUS) and (StrToInt(formID.Text) > 2) then
    formID.Text := IntToStr(((StrToInt(formID.Text))) - 1);

  nodeSelected := formTree.Selected;
  nodeSelected.Text := formID.Text;

  intbandSelected := nodeSelected.Data;
  intbandSelected.EntryID := StrToInt(formID.Text);

end;

procedure TformWindow.formNumEntriesChange(Sender: TObject);
var
  intbandFromNode: ptrIntBand;
begin

  intbandFromNode := formTree.Selected.Data;

  //ShowMessage(IntToStr(intbandFromNode.NumberOfEntries));
  intbandFromNode.NumberOfEntries := StrToInt(formNumEntries.Text);
  //ShowMessage(IntToStr(intbandFromNode.NumberOfEntries));

end;

procedure TformWindow.formSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  strEnteredID: string;
  nodeFound: TTreeNode;
begin

  if (Key = VK_RETURN) and (formSearch.Text <> '') then begin

    strEnteredID := formSearch.Text;

    formSearch.Color := clWindow;

    nodeFound := FindNodeByText(formTree, strEnteredID);

    if nodeFound <> nil then
      formTree.Selected := nodeFound
    else
      formSearch.Color := RGB(255, 128, 128);

  end;

end;

procedure TformWindow.FormShow(Sender: TObject);
begin
  tmemorystreamDBCFile := TMemoryStream.Create;
end;

procedure TformWindow.formTreeChange(Sender: TObject; Node: TTreeNode);
var
  intbandFromNode: ptrIntBand;
  iCounter, iNumFrames: integer;
  componentFrameEntry: TComponent;
  formCurrentEntry: TFrame3;
begin

  intbandFromNode := Node.Data; //Get the IntBand record via pointers

  formID.Text := IntToStr(intbandFromNode.EntryID);

  iNumFrames := formGroup.ControlCount;
  formNumEntries.ItemIndex := intbandFromNode.NumberOfEntries - 1;

  for iCounter := 0 to iNumFrames - 1 do begin

    componentFrameEntry := formGroup.Controls[iCounter];

    if componentFrameEntry is TFrame3 then begin

      formCurrentEntry := TFrame3(componentFrameEntry);

      formCurrentEntry.formTime.Text := IntToStr(intbandFromNode.TimeArray[iCounter]);

      //RGBA is stored different, as BGRA
      formCurrentEntry.formB01.Text := IntToStr(intbandFromNode.ColorArray[iCounter, 0]);
      formCurrentEntry.formG01.Text := IntToStr(intbandFromNode.ColorArray[iCounter, 1]);
      formCurrentEntry.formR01.Text := IntToStr(intbandFromNode.ColorArray[iCounter, 2]);
      formCurrentEntry.formA01.Text := IntToStr(intbandFromNode.ColorArray[iCounter, 3]);

      SetColorForFrame(formCurrentEntry);

    end;


  end;


end;

procedure TformWindow.formTreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nodeSelected, nodeNew: TTreeNode;
  iIntBandArrayLength: integer;
  intbandLast, intbandNew: IntBand;
begin

  iIntBandArrayLength := Length(arrayIntBand);

  if (Key = VK_DELETE) and (iIntBandArrayLength > 1) then
  begin

    nodeSelected := formTree.Selected;

    if Assigned(nodeSelected) then
      nodeSelected.Delete;

    //Key := 0;

  end;

  if (Key = VK_INSERT) then
  begin

    intbandNew.EntryID := arrayIntBand[iIntBandArrayLength - 1].EntryID + 1;
    intbandNew.NumberOfEntries := 1;

    SetLength(arrayIntBand, iIntBandArrayLength + 1);
    arrayIntBand[iIntBandArrayLength] := intbandNew;
    Inc(iIntBandArrayLength);

    nodeNew := formTree.Items.AddChildObject(nil, IntToStr(intbandNew.EntryID), addr(arrayIntBand[iIntBandArrayLength - 1]) );
    nodeNew.Text := IntToStr(intbandNew.EntryID);

    //Key := 0;
  end;

end;

procedure TformWindow.frameEntrybuttonColourClick(Sender: TObject);
var
  formFrame: TFrame3;
begin

  formFrame := TFrame3(TScrollBox( ( TButton(Sender).Parent ) ).Parent);

  LaunchColorPicker(dialogColor, formFrame);

end;

procedure TformWindow.Load1Click(Sender: TObject);
var
  iCounter: integer;
  treeEntry: TTreeNode;
begin

  byteEmptyStringBlock := 0;
  formOpenFile.InitialDir := GetCurrentDir;

  if formOpenFile.Execute then begin

    //ShowMessage('Opened File');
    tmemorystreamDBCFile.LoadFromFile(formOpenFile.FileName);
    //ShowMessage('Loaded File');

    //Get the header, and from the header, the number of entries
    dbcheaderHeader := GetHeader(tmemorystreamDBCFile);
    iNumRecords := dbcheaderHeader.RecordCount;
    //ShowMessage(IntToStr(iNumRecords));

    SetLength(arrayIntBand, iNumRecords);

    GetAllIntBands(tmemorystreamDBCFile, 20, 136, dbcheaderHeader.RecordCount, arrayIntBand);

    //ShowMessage('Adding records to tree');
    for iCounter := 0 to iNumRecords - 1 do begin

      treeEntry := formTree.Items.AddChildObject(nil, IntToStr(arrayintBand[iCounter].EntryID), Addr(arrayIntBand[iCounter]) );
    end;

    formTree.FullExpand;
    formGroup.Visible := true;
    formApply.Visible := true;
    formID.Visible := true;
    formNumEntries.Visible := true;
    formSearch.Visible := true;

  end;


end;

procedure TformWindow.SaveClick(Sender: TObject);
var
  nodeCurrent: TTreeNode;
  intbandCurrent: PtrIntBand;
  filestreamOutput: TFileStream;
  iCounter: integer;
begin

  if formSaveFile.Execute() then begin

    ShowMessage('Saving File!');

    filestreamOutput := TFileStream.Create(formSaveFile.FileName, fmCreate);

    ShowMessage('Creating Filestream!');

    filestreamOutput.Write(dbcheaderHeader, SizeOf(dbcheaderHeader));

    for iCounter := 0 to formTree.Items.Count - 1 do begin

      nodeCurrent := formTree.Items[iCounter];
      intbandCurrent := nodeCurrent.Data;

      filestreamOutput.Write(nodeCurrent, iNumIntBandBytes);

    end;

    filestreamOutput.Write(byteEmptyStringBlock, 1);

    filestreamOutput.Free;

  end;

end;

end.
