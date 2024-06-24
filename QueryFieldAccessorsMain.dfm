object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Query Field Accessors Demonstration'
  ClientHeight = 473
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    624
    473)
  TextHeight = 15
  object btnFieldByName: TButton
    Left = 8
    Top = 160
    Width = 105
    Height = 41
    Caption = 'FieldByName'
    TabOrder = 0
    OnClick = btnFieldByNameClick
  end
  object ListBox2: TListBox
    Left = 382
    Top = 8
    Width = 234
    Height = 455
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    TabOrder = 1
  end
  object btnIndexedFields: TButton
    Left = 8
    Top = 207
    Width = 105
    Height = 50
    Caption = 'Fields[index]'
    TabOrder = 2
    OnClick = btnIndexedFieldsClick
  end
  object btnFieldReferences: TButton
    Left = 8
    Top = 263
    Width = 105
    Height = 49
    Caption = 'Pre-reference'
    TabOrder = 3
    OnClick = btnFieldReferencesClick
  end
  object btnDesignTimeFields: TButton
    Left = 8
    Top = 318
    Width = 105
    Height = 49
    Caption = 'Design Time Ref'
    TabOrder = 4
    OnClick = btnDesignTimeFieldsClick
  end
  object ListBox3: TListBox
    Left = 128
    Top = 8
    Width = 248
    Height = 453
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 15
    TabOrder = 5
  end
  object btnGenerate: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 49
    Caption = 'Generate Data'
    TabOrder = 6
    OnClick = btnGenerateClick
  end
  object SpinEdit1: TSpinEdit
    Left = 8
    Top = 64
    Width = 105
    Height = 24
    MaxValue = 5000000
    MinValue = 1000
    TabOrder = 7
    Value = 100000
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
    Connected = True
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
