unit QueryFieldAccessorsMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, System.Diagnostics,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait, Vcl.StdCtrls, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys.SQLiteVDataSet, Vcl.Samples.Spin,
  FireDAC.Stan.StorageBin, FireDAC.Comp.UI;

type
  TForm1 = class(TForm)
    FDQuery1: TFDQuery;
    btnFieldByName: TButton;
    ListBox2: TListBox;
    btnIndexedFields: TButton;
    FDQuery1_x0: TFloatField;
    FDQuery1_y0: TFloatField;
    FDQuery1_z0: TFloatField;
    btnFieldReferences: TButton;
    btnDesignTimeFields: TButton;
    ListBox3: TListBox;
    FDQuery1_id: TLargeintField;
    FDMemTable1: TFDMemTable;
    btnGenerate: TButton;
    FDLocalSQL1: TFDLocalSQL;
    FDConnection1: TFDConnection;
    FDQuery1_name: TWideStringField;
    SpinEdit1: TSpinEdit;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery2: TFDQuery;
    FDQuery2cnt: TLargeintField;
    procedure btnFieldByNameClick(Sender: TObject);
    procedure btnIndexedFieldsClick(Sender: TObject);
    procedure btnFieldReferencesClick(Sender: TObject);
    procedure btnDesignTimeFieldsClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FStopWatch: TStopWatch;
    procedure StartTimer(Sender: TObject);
    procedure EndTimer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.Math;

const
  C_SampleData = 'QueryFieldData.db';

function GenerateAlienText(CharCount: Integer): string;
const
  AlienAlphabets: array[0..1] of string = (
    '⏣⎌⛫⎋⎉⎅⎇⎀⎁⏢⏦⏧⏥⏠⏞⏜⏛⏚⏕⎔⎊⎉⌽⍙⍘⍗⍖⍕⍔⛶⛕⛖⛋⛌⛍⛐⛒⛣⌤⌙⌭⌮⌯⌰⌱⌲⌳⌴',
    '░▒▓█♡♥♦♣♠▪▫➢∞✩✪✫✬✭✮✯✰⁂⌘ૐ࿃࿄࿅࿆࿇࿈࿉࿊࿋࿇࿈࿎࿏࿐࿑࿒࿓࿔᠀᠁᠂᠃᠄᠅᠆᠇᠈᠉᠊᠋᠌᠍᠎᠏᠐᠑᠒᠓᠔᠕᠖᠗᠘᠙');
  AlienAlphabet3Codes: array[0..49] of Word = (
      $2591, $2592, $2593, $2588, $2580, $2584, $258C, $2590, $25A0, $25A1,  // Block Elements
      $25CB, $25CF, $25C6, $25D8, $25D9, $2665, $2660, $2666, $2663, $2605,  // Geometric Shapes and Misc. Symbols
      $2701, $2702, $2703, $2704, $2706, $2707, $2708, $2709, $2710, $2711,  // Dingbats
      $2712, $2713, $2714, $2715, $2716, $2717, $2718, $2719, $2720, $2721,  // Dingbats
      $2722, $2723, $2724, $2725, $2726, $2727, $2736, $2729, $2744, $2745   // Dingbats and Misc. Symbols
    );

begin
  var ChosenAlphabetIndex := Random(3);

  Result := '';
  for var i := 1 to CharCount do
  case ChosenAlphabetIndex of
    0,1:  Result := Result + AlienAlphabets[ChosenAlphabetIndex][Random(Length(AlienAlphabets[ChosenAlphabetIndex])) + 1];
    2:  Result := Result + Chr(AlienAlphabet3Codes[random(Length(AlienAlphabet3Codes))]);
  end;
end;

function GenerateStarName: string;
const
  Prefixes: array[0..9] of string = ('Alpha', 'Beta', 'Gamma', 'Delta', 'Epsilon', 'Zeta', 'Eta', 'Theta', 'Iota', 'Kappa');
  Suffixes: array[0..9] of string = ('Prime', 'Major', 'Minor', 'Nebula', 'Abyss', 'Nexus', 'Forge', 'Sentinel', 'Crucible', 'Beacon');
  Constellations: array[0..9] of string = ('Cygnus', 'Orion', 'Draco', 'Ursa Major', 'Ursa Minor', 'Lyra', 'Aquila', 'Cassiopeia', 'Pegasus', 'Hydra');
  ScifiThemes: array[0..9] of string = ('Sol Invictus', 'Terra Nova', 'Eden Prime', 'Arcturus Station', 'Luminara', 'Xandar', 'Krypton', 'Vega Prime', 'Reach', 'New Eden');
begin
  var Prefix := Prefixes[Random(Length(Prefixes))];
  var Suffix := Suffixes[Random(Length(Suffixes))];
  var NumberString := '';

  if random(4) = 0 then
    Exit(GenerateAlienText(Random(20)+5));

  if Random(3) = 0 then
    NumberString := IntToStr(Random(1000)); // Random number between 0 and 999

  Prefix := Prefix + NumberString;

  if Random(2) = 0 then
  begin
    var ConstellationOrTheme: String;
    if Random(2) = 0 then
      ConstellationOrTheme := ScifiThemes[Random(Length(ScifiThemes))]
    else
      ConstellationOrTheme := Constellations[Random(Length(Constellations))];

    Result := Prefix + ' ' + Suffix + ' (' + ConstellationOrTheme + ')';
  end else
   Result := Prefix + ' ' + Suffix;
end;

procedure TForm1.btnFieldByNameClick(Sender: TObject);
begin
  StartTimer(Sender);
  try
    while not FDQuery1.Eof do
    begin
      var calcDist := Sqrt(
          Sqr(FDQuery1.FieldByName('x0').AsFloat) +
          Sqr(FDQuery1.FieldByName('y0').AsFloat) +
          Sqr(FDQuery1.FieldByName('z0').AsFloat));
      if calcDist > 1000 then
        ListBox3.Items.Add(FDQuery1.FieldByName('Name').AsString);
      FDQuery1.Next;
    end;

  finally
    EndTimer;
  end;
end;

procedure TForm1.btnIndexedFieldsClick(Sender: TObject);
begin
  StartTimer(Sender);
  try
    while not FDQuery1.Eof do
    begin
      var calcDist := Sqrt(
          Sqr(FDQuery1.Fields[2].AsFloat) +
          Sqr(FDQuery1.Fields[3].AsFloat) +
          Sqr(FDQuery1.Fields[4].AsFloat));
      if calcDist > 1000 then
        ListBox3.Items.Add(FDQuery1.Fields[1].AsString);
      FDQuery1.Next;
    end;

  finally
    EndTimer;
  end;
end;

procedure TForm1.btnGenerateClick(Sender: TObject);
begin
  Randomize;
  Cursor := crSQLWait;
  Enabled := False;
  try
    FDMemTable1.Close;
    FDMemTable1.CreateDataSet;
    for var i := 1 to SpinEdit1.Value do
      FDMemTable1.InsertRecord(
        [i, GenerateStarName,
         random * Random(900),
         random * Random(900),
         random * Random(900)]);
    FDMemTable1.SaveToFile(C_SampleData, sfBinary);
    FDLocalSQL1.Active := True;
    FDQuery1.Open; // pre-cache
    FDQuery2.Open;
    ListBox2.Items.Add(FormatFloat('#,##0', FDQuery2cnt.AsInteger) + ' records generated');
  finally
    Cursor := crDefault;
    Enabled := True;
  end;
end;

procedure TForm1.btnFieldReferencesClick(Sender: TObject);
begin
  StartTimer(Sender);
  try
    var x0_field := FDQuery1.FieldByName('x0');
    var y0_field := FDQuery1.FieldByName('y0');
    var z0_field := FDQuery1.FieldByName('z0');
    var name_field := FDQuery1.FieldByName('name');

    while not FDQuery1.Eof do
    begin
      var calcDist := Sqrt(
          Sqr(x0_field.AsFloat) +
          Sqr(y0_field.AsFloat) +
          Sqr(z0_field.AsFloat));
      if calcDist > 1000 then
        ListBox3.Items.Add(name_field.AsString);
      FDQuery1.Next;
    end;

  finally
    EndTimer;
  end;
end;

procedure TForm1.btnDesignTimeFieldsClick(Sender: TObject);
begin
  StartTimer(Sender);
  try
    while not FDQuery1.Eof do
    begin
      var calcDist := Sqrt(
          Sqr(FDQuery1_x0.AsFloat) +
          Sqr(FDQuery1_y0.AsFloat) +
          Sqr(FDQuery1_z0.AsFloat));
      if calcDist > 1000 then
        ListBox3.Items.Add(FDQuery1_Name.AsString);
      FDQuery1.Next;
    end;

  finally
    EndTimer;
  end;
end;

procedure TForm1.EndTimer;
begin
  FStopWatch.Stop;
  FDQuery1.Close;
  ListBox2.Items.Add('Ticks: ' + FormatFloat('#,##0', FStopWatch.ElapsedTicks));
  ListBox2.Items.Add('Count: ' + ListBox3.Count.ToString);
  ListBox2.Items.Add('-----');
  ListBox3.Items.EndUpdate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if FileExists(C_SampleData) then
  begin
    FDMemTable1.LoadFromFile(C_SampleData,sfBinary);
    FDQuery1.Open; // pre-cache
    FDQuery2.Open;
    ListBox2.Items.Add(FormatFloat('#,##0', FDQuery2cnt.AsInteger) + ' records loaded');
  end
  else
    ListBox2.Items.Add('NO records loaded!');
  ListBox2.Items.Add('-----');
end;

procedure TForm1.StartTimer(Sender: TObject);
begin
  FDQuery1.Open();
  ListBox3.Clear;
  ListBox2.Items.Add((Sender as TButton).Caption);
  ListBox3.Items.BeginUpdate;
  FStopWatch := TStopwatch.StartNew;
end;

end.
