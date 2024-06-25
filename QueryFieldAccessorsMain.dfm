object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Query Field Accessors Demonstration'
  ClientHeight = 407
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 329
    Top = 0
    Height = 407
  end
  object ListBox2: TListBox
    Left = 332
    Top = 0
    Width = 207
    Height = 407
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    TabOrder = 2
  end
  object ListBox3: TListBox
    Left = 124
    Top = 0
    Width = 205
    Height = 407
    Align = alLeft
    ItemHeight = 15
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 124
    Height = 407
    Align = alLeft
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 0
    DesignSize = (
      124
      407)
    object btnDesignTimeFields: TButton
      Left = 8
      Top = 354
      Width = 105
      Height = 49
      Anchors = [akLeft, akBottom]
      Caption = 'Design Time Ref'
      TabOrder = 5
      OnClick = btnDesignTimeFieldsClick
    end
    object btnFieldByName: TButton
      Left = 8
      Top = 298
      Width = 105
      Height = 50
      Anchors = [akLeft, akBottom]
      Caption = 'FieldByName'
      TabOrder = 4
      OnClick = btnFieldByNameClick
    end
    object btnFieldReferences: TButton
      Left = 8
      Top = 188
      Width = 105
      Height = 49
      Anchors = [akLeft, akBottom]
      Caption = 'Pre-reference'
      TabOrder = 2
      OnClick = btnFieldReferencesClick
    end
    object btnGenerate: TButton
      Left = 8
      Top = 8
      Width = 105
      Height = 41
      Caption = 'Generate Random Data'
      TabOrder = 0
      WordWrap = True
      OnClick = btnGenerateClick
    end
    object btnIndexedFields: TButton
      Left = 8
      Top = 243
      Width = 105
      Height = 50
      Anchors = [akLeft, akBottom]
      Caption = 'Fields[index]'
      TabOrder = 3
      OnClick = btnIndexedFieldsClick
    end
    object SpinEdit1: TSpinEdit
      Left = 8
      Top = 55
      Width = 105
      Height = 24
      MaxValue = 5000000
      MinValue = 1000
      TabOrder = 1
      Value = 100000
    end
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select id, name, x0, y0, z0'
      'from starData'
      'order by id')
    Left = 160
    Top = 80
    object FDQuery1_id: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery1_name: TWideStringField
      DisplayLabel = 'name'
      FieldName = 'Name'
      Required = True
      Size = 1024
    end
    object FDQuery1_x0: TFloatField
      FieldName = 'x0'
      Origin = 'x0'
    end
    object FDQuery1_y0: TFloatField
      FieldName = 'y0'
      Origin = 'y0'
    end
    object FDQuery1_z0: TFloatField
      FieldName = 'z0'
      Origin = 'z0'
    end
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Name'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 1024
      end
      item
        Name = 'x0'
        Attributes = [faRequired]
        DataType = ftFloat
        Precision = 10
      end
      item
        Name = 'y0'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'z0'
        Attributes = [faRequired]
        DataType = ftFloat
        Precision = 10
      end
      item
        Name = 'Dist'
        DataType = ftFloat
        Precision = 10
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 288
    Top = 184
  end
  object FDLocalSQL1: TFDLocalSQL
    Connection = FDConnection1
    Active = True
    DataSets = <
      item
        DataSet = FDMemTable1
        Name = 'StarData'
      end>
    Left = 304
    Top = 120
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 296
    Top = 56
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 304
    Top = 240
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select count(*) as cnt '
      'from StarData')
    Left = 160
    Top = 152
    object FDQuery2cnt: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'cnt'
      Origin = 'cnt'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
