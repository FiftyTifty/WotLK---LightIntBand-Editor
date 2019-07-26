object formWindow: TformWindow
  Left = 0
  Top = 0
  Caption = 'WotLK - LightIntBand.dbc Editor'
  ClientHeight = 731
  ClientWidth = 1101
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = formMenu
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object formTree: TTreeView
    Left = 8
    Top = 35
    Width = 265
    Height = 688
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnChange = formTreeChange
    OnKeyDown = formTreeKeyDown
  end
  object formGroup: TScrollBox
    Left = 279
    Top = 35
    Width = 818
    Height = 534
    TabOrder = 1
    Visible = False
    inline frameEntry01: TFrame3
      Left = 16
      Top = 5
      Width = 249
      Height = 81
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = 5
      inherited formGroupEntry01: TGroupBox
        Left = 6
        Top = 2
        ExplicitLeft = 6
        ExplicitTop = 2
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry02: TFrame3
      Left = 287
      Top = 10
      Width = 249
      Height = 81
      TabOrder = 1
      ExplicitLeft = 287
      ExplicitTop = 10
      inherited formGroupEntry01: TGroupBox
        Top = -2
        Caption = 'Entry #02'
        ExplicitTop = -2
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry03: TFrame3
      Left = 552
      Top = 9
      Width = 249
      Height = 81
      TabOrder = 2
      ExplicitLeft = 552
      ExplicitTop = 9
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #03'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry04: TFrame3
      Left = 19
      Top = 92
      Width = 249
      Height = 81
      TabOrder = 3
      ExplicitLeft = 19
      ExplicitTop = 92
      inherited formGroupEntry01: TGroupBox
        Left = 3
        Caption = 'Entry #04'
        ExplicitLeft = 3
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry05: TFrame3
      Left = 287
      Top = 93
      Width = 249
      Height = 81
      TabOrder = 4
      ExplicitLeft = 287
      ExplicitTop = 93
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #05'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry06: TFrame3
      Left = 552
      Top = 93
      Width = 249
      Height = 81
      TabOrder = 5
      ExplicitLeft = 552
      ExplicitTop = 93
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #06'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry07: TFrame3
      Left = 22
      Top = 179
      Width = 249
      Height = 81
      TabOrder = 6
      ExplicitLeft = 22
      ExplicitTop = 179
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #07'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry09: TFrame3
      Left = 552
      Top = 179
      Width = 249
      Height = 81
      TabOrder = 7
      ExplicitLeft = 552
      ExplicitTop = 179
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #09'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry10: TFrame3
      Left = 22
      Top = 266
      Width = 249
      Height = 81
      TabOrder = 8
      ExplicitLeft = 22
      ExplicitTop = 266
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #10'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry11: TFrame3
      Left = 285
      Top = 266
      Width = 249
      Height = 81
      TabOrder = 9
      ExplicitLeft = 285
      ExplicitTop = 266
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #11'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry14: TFrame3
      Left = 286
      Top = 353
      Width = 249
      Height = 81
      TabOrder = 12
      ExplicitLeft = 286
      ExplicitTop = 353
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #14'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry15: TFrame3
      Left = 552
      Top = 353
      Width = 249
      Height = 81
      TabOrder = 13
      ExplicitLeft = 552
      ExplicitTop = 353
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #15'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry16: TFrame3
      Left = 19
      Top = 440
      Width = 249
      Height = 81
      TabOrder = 14
      ExplicitLeft = 19
      ExplicitTop = 440
      inherited formGroupEntry01: TGroupBox
        Left = 3
        Top = 1
        Caption = 'Entry #16'
        ExplicitLeft = 3
        ExplicitTop = 1
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline FrameEntry08: TFrame3
      Left = 286
      Top = 179
      Width = 249
      Height = 81
      TabOrder = 15
      ExplicitLeft = 286
      ExplicitTop = 179
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #08'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry12: TFrame3
      Left = 551
      Top = 266
      Width = 249
      Height = 81
      TabOrder = 10
      ExplicitLeft = 551
      ExplicitTop = 266
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #12'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
    inline frameEntry13: TFrame3
      Left = 22
      Top = 353
      Width = 249
      Height = 81
      TabOrder = 11
      ExplicitLeft = 22
      ExplicitTop = 353
      inherited formGroupEntry01: TGroupBox
        Caption = 'Entry #13'
        inherited buttonColour: TButton
          OnClick = frameEntrybuttonColourClick
        end
      end
    end
  end
  object formID: TEdit
    Left = 279
    Top = 8
    Width = 121
    Height = 21
    Hint = 'ID Of the entry'
    NumbersOnly = True
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    Visible = False
    OnKeyDown = formIDKeyDown
  end
  object formSearch: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    Hint = 'ID to jump to'
    NumbersOnly = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = False
    OnKeyDown = formSearchKeyDown
    OnKeyUp = formSearchKeyDown
  end
  object formNumEntries: TComboBox
    Left = 406
    Top = 8
    Width = 145
    Height = 21
    Hint = 'Select number of time:colour pairs'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Visible = False
    OnChange = formNumEntriesChange
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16')
  end
  object formApply: TButton
    Left = 1002
    Top = 504
    Width = 74
    Height = 54
    Caption = 'Apply'
    TabOrder = 5
    Visible = False
    OnClick = formApplyClick
  end
  object formMenu: TMainMenu
    Left = 32
    Top = 65491
    object File1: TMenuItem
      Caption = 'File'
      object Load1: TMenuItem
        Caption = 'Load...'
        OnClick = Load1Click
      end
      object Save: TMenuItem
        Caption = 'Save as...'
        OnClick = SaveClick
      end
    end
  end
  object formOpenFile: TOpenDialog
    DefaultExt = '.dbc'
    Filter = '*.dbc'
    Options = [ofFileMustExist, ofEnableSizing]
    Left = 80
    Top = 65490
  end
  object dialogColor: TColorDialog
    Left = 543
    Top = 65489
  end
  object formSaveFile: TSaveDialog
    DefaultExt = 'dbc'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 656
    Top = 65491
  end
end
