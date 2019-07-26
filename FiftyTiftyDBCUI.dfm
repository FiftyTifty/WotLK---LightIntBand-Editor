object Frame3: TFrame3
  Left = 0
  Top = 0
  Width = 249
  Height = 81
  TabOrder = 0
  object formGroupEntry01: TGroupBox
    Left = 0
    Top = 0
    Width = 243
    Height = 78
    Caption = 'Entry #01'
    TabOrder = 0
    object formTime: TEdit
      Left = 98
      Top = 51
      Width = 65
      Height = 21
      Hint = 'Time in multiples of 30 seconds Min = 0 Max = 2880'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object buttonColour: TButton
      Left = 169
      Top = 51
      Width = 65
      Height = 21
      Hint = 'Open colour picker'
      Caption = 'Colour'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object formB01: TEdit
      Left = 169
      Top = 24
      Width = 65
      Height = 21
      Hint = 'Blue value'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyDown = formColourEditKeyDown
      OnKeyUp = formColourEditKeyDown
    end
    object formA01: TEdit
      Left = 31
      Top = 51
      Width = 61
      Height = 21
      Hint = 'Alpha value'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object formG01: TEdit
      Left = 98
      Top = 24
      Width = 65
      Height = 21
      Hint = 'Green value'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnKeyDown = formColourEditKeyDown
      OnKeyUp = formColourEditKeyDown
    end
    object formR01: TEdit
      Left = 31
      Top = 24
      Width = 62
      Height = 21
      Hint = 'Red value'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnKeyDown = formColourEditKeyDown
      OnKeyUp = formColourEditKeyDown
    end
    object formColour: TEdit
      Left = 3
      Top = 24
      Width = 22
      Height = 21
      Color = clNone
      ReadOnly = True
      TabOrder = 6
    end
  end
end
