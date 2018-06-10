unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, ADODB, DB, Vcl.StdCtrls, acPNG,
  Vcl.Mask, Vcl.Samples.Spin, Vcl.Buttons, Vcl.ComCtrls, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADODataSet1: TADODataSet;
    ADOQuery1: TADOQuery;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    Edit5: TLabeledEdit;
    Edit4: TEdit;
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    Edit3: TEdit;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    Button2: TButton;
    DBGrid3: TDBGrid;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button3: TButton;
    Button4: TButton;
    DataSource4: TDataSource;
    DBGrid4: TDBGrid;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit6: TEdit;
    Edit9: TLabeledEdit;
    Edit7: TEdit;
    Button5: TButton;
    DateTimePicker2: TDateTimePicker;
    Edit8: TEdit;
    Button6: TButton;
    Shape1: TShape;
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    ADOQuery4: TADOQuery;
    Edit10: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit11: TEdit;
    Label13: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    TrackBar1: TTrackBar;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Label1DblClick(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
   i:=0;
   for I := 0 to 1 do begin

ADOQuery2.Insert;
ADOQuery2.FieldByName('������������ ���������').AsString:=Edit2.Text;
ADOQuery2.FieldByName('����').AsInteger:=StrToInt(Edit5.Text);
 ADOQuery2.FieldByName('��������������').AsInteger:=StrToInt(Edit4.Text);
ADOQuery2.FieldByName('�����������').AsInteger:=StrToInt(Edit3.Text);
 ADOQuery2.FieldByName('����').AsDateTime:=DateTimePicker1.DateTime;
   end;
          Button2.Click ;
   showmessage('������� ��������');
end;

procedure TForm1.Button2Click(Sender: TObject);
var kolvo, mest, itog: integer;
const
  s1: string = 'Select `�����(��������)` FROM ����� WHERE Id_������=';
begin
 ADOQuery3.Active := False;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Text := 'Select `�����(��������)` FROM ����� WHERE Id_������=' + Edit3.Text;
  ADOQuery3.Active := True;
       kolvo:= StrToInt(Edit4.Text);
   //  edit6.Text:=  dbgrid3.Fields[0].AsString;
     mest:= dbgrid3.Fields[0].AsInteger; //  strtoint(edit6.Text);
       if mest<kolvo then begin showmessage('���������� ��������� ���������� ���-�� �� ������'); exit; end;
    itog:= mest - kolvo;
   // edit6.Text:= inttostr(mest);
  //  edit7.Text:=  inttostr(kolvo);
  //   edit8.Text:=  inttostr(itog);
     //    showmessage(inttostr(mest));
         ADOQuery3.Edit;
          ADOQuery3.FieldByName('�����(��������)').AsInteger:= itog;
Adoquery3.Post;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DBGrid4.visible:=false;
    ADOQuery1.Active := False;




ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('SELECT * FROM �����');




    ADOQuery1.Active := True;
     DBGrid1.visible:=true;
  DBGrid1.DataSource := DataSource1;
  DBNavigator1.DataSource := DataSource1;

  //  Label3.visible:=true;    Label4.visible:=true;  Label1.visible:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     DBGrid1.visible:=false;
     DBGrid4.visible:=true;
         ADOQuery4.Active := False;



        ADOQuery4.SQL.Clear;
ADOQuery4.SQL.Add('select `��� ���������`, `������������ ���������`, `����`, `��������������`, `�����������`, `����` from ���������');




    ADOQuery4.Active := True;
  DBNavigator1.DataSource := DataSource4;
 // Label3.visible:=false;     Label4.visible:=false;   Label1.visible:=false;
end;

procedure TForm1.Button5Click(Sender: TObject);
var kolvo, mest, itog: integer;
begin
    if Edit7.Text<>'0' then Button6.Click ;
begin
if Edit7.Text='0' then  begin
 try
if Application.MessageBox('����������� ��������?',' ',MB_YESNO)=IDYES then
begin
ADOQuery4.Delete;
end;
except
on e:Exception do   showmessage('���� ����� ��������');
 end; end;   end;


    ADOQuery3.Active := False;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Text := 'Select `��������������` FROM ��������� WHERE �����������=' + Edit8.Text;
  ADOQuery3.Active := True;
       kolvo:= StrToInt(Edit7.Text);
   //  edit6.Text:=  dbgrid3.Fields[0].AsString;
     mest:= dbgrid3.Fields[0].AsInteger;
    if mest<kolvo then begin showmessage('���������� ����������� ��������� ���-�� �� ������'); exit; end; //  strtoint(edit6.Text);
    itog:= mest - kolvo;
   // edit6.Text:= inttostr(mest);
  //  edit7.Text:=  inttostr(kolvo);
  //   edit8.Text:=  inttostr(itog);
     //    showmessage(inttostr(mest));
         ADOQuery3.Edit;
          ADOQuery3.FieldByName('��������������').AsInteger:= itog;
Adoquery3.Post;

     showmessage('������� ���������');









end;

procedure TForm1.Button6Click(Sender: TObject);
var kolvo, mest, itog: integer;
begin
 ADOQuery3.Active := False;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Text := 'Select `�����(��������)` FROM ����� WHERE Id_������=' + Edit8.Text;
  ADOQuery3.Active := True;
       kolvo:= StrToInt(Edit7.Text);
   //  edit6.Text:=  dbgrid3.Fields[0].AsString;
     mest:= dbgrid3.Fields[0].AsInteger; //  strtoint(edit6.Text);
    itog:= mest + kolvo;
   // edit6.Text:= inttostr(mest);
  //  edit7.Text:=  inttostr(kolvo);
  //   edit8.Text:=  inttostr(itog);
     //    showmessage(inttostr(mest));
         ADOQuery3.Edit;
          ADOQuery3.FieldByName('�����(��������)').AsInteger:= itog;
Adoquery3.Post;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
   timer1.Enabled:=false;
      timer1.Enabled:=true;
if (DBGrid1.DataSource=DataSource1) then  begin
   Label3.Caption:='����� � : '+ dbgrid1.Fields[0].AsString;
Label1.Caption:='���������� ����: '+ dbgrid1.Fields[3].AsString;
    Label4.Caption:='��������� ����: '+ dbgrid1.Fields[4].AsString;
    if DBGrid1.DataSource=DataSource4 then  begin
           Label3.Caption:='����� � : '+ dbgrid1.Fields[5].AsString;
Label1.Caption:='���������� ����: '+ dbgrid1.Fields[1].AsString;



    end;
end;


end;

procedure TForm1.DBGrid4CellClick(Column: TColumn);
var i,ans :integer;
begin
 Label4.Caption:= dbgrid4.Fields[1].AsString;
           Label3.Caption:='����� � : '+ dbgrid4.Fields[4].AsString;
Label1.Caption:='���������� ����: '+ dbgrid4.Fields[3].AsString;


      Shape1.Brush.Style := bsSolid;
         timer1.Enabled:=false;
   timer1.Enabled:=true;


Edit6.Text:=ADOQuery4.FieldByName('������������ ���������').AsString;
Edit9.Text:=IntToStr(ADOQuery4.FieldByName('����').AsInteger);
Edit7.Text:=ADOQuery4.FieldByName('��������������').AsString;
Edit8.Text:=IntToStr(ADOQuery4.FieldByName('�����������').AsInteger);
DateTimePicker2.DateTime:= ADOQuery4.FieldByName('����').AsDateTime;












end;


procedure TForm1.Edit10Change(Sender: TObject);
begin
ADOQuery1.Active :=false;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('SELECT * FROM ����� WHERE Id_������ LIKE' +QuotedStr('%'+Edit10.Text+'%')+ 'or ����� LIKE' +QuotedStr('%'+Edit10.Text+'%')+'or ���������� LIKE' +QuotedStr('%'+Edit10.Text+'%')+'or `�����(�����)` LIKE' +QuotedStr('%'+Edit10.Text+'%')+'or `�����(��������)` LIKE' +QuotedStr('%'+Edit10.Text+'%'));

ADOQuery1.Active :=true;
end;

procedure TForm1.Edit11Change(Sender: TObject);
begin
  ADOQuery4.Active :=false;
ADOQuery4.SQL.Clear;
ADOQuery4.SQL.Add('SELECT `��� ���������`, `������������ ���������`, `����`, `��������������`, `�����������`, `����` FROM ��������� WHERE `��� ���������` LIKE' +QuotedStr('%'+Edit11.Text+'%')+ 'or `������������ ���������` LIKE' +QuotedStr('%'+Edit11.Text+'%')+'or `����` LIKE' +QuotedStr('%'+Edit11.Text+'%')+'or `��������������` LIKE' +QuotedStr('%'+Edit11.Text+'%')+'or `�����������` LIKE' +QuotedStr('%'+Edit11.Text+'%')+'or `����` LIKE' +QuotedStr('%'+Edit11.Text+'%'));

ADOQuery4.Active :=true;
end;

procedure TForm1.Edit1DblClick(Sender: TObject);
var i:integer;
begin
edit1.Visible:=false;
i:=10;
  if Application.MessageBox('��������?',' ',MB_YESNO)=IDYES then  begin
  if edit1.Text <> ''  then begin
  edit1.Text:= inttostr(strtoint(edit1.Text)+i); end;
   Label1.Caption:= '���������� ����: '+ edit1.Text;
    ADOQuery1.Edit;
ADOQuery1.FieldByName('�����').AsString:=Edit1.Text;
Adoquery1.Post;  edit1.Visible:=false;  end else exit;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then begin
edit1.Visible:=false;
      if Application.MessageBox('��������?',' ',MB_YESNO)=IDYES then  begin
     Label1.Caption:= '���� �����: '+ edit1.Text;
    ADOQuery1.Edit;
ADOQuery1.FieldByName('�����').AsString:=Edit1.Text;
Adoquery1.Post;  edit1.Visible:=false;  end else exit;
end;    end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
  label11.Visible := not label11.Visible;   label12.Visible := not label12.Visible;  label13.Visible := not label13.Visible;
   edit10.Visible := not edit10.Visible;  edit11.Visible := not edit11.Visible;
end;

procedure TForm1.Label1DblClick(Sender: TObject);
begin
edit1.visible:=true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var ans:integer;
begin


randomize;
ans:=random(7);


case ans of
  0: begin  Shape3.Brush.Color := clGreen;  Shape2.Brush.Color := clWhite; Shape4.Brush.Color := clBlue; label1.Font.Color:=clBlue; Label4.Font.Color:=clGreen;  Shape1.Shape := stSquare; Shape1.Brush.Color := clFuchsia; Shape1.Pen.color:=clRed;  Shape1.Brush.Style := bsVertical;  Shape1.Shape := stRectangle;    Shape1.Pen.Style := psDashDot; end;
  1: begin   Shape3.Brush.Color := clWhite; Shape2.Brush.Color := clBlue;label1.Font.Color:=clGreen; Label4.Font.Color:=clBlue; Shape1.Shape := stEllipse; Shape1.Brush.Color := clWhite; Shape1.Pen.Style := psDot;    Shape1.Brush.Style := bsHorizontal;  Shape1.Pen.color:=clYellow;    Shape1.Pen.Style := psDashDotDot; end;
  2:begin   Shape4.Brush.Color := clWhite; Shape2.Brush.Color := clBlue;label1.Font.Color:=clBlack; Label4.Font.Color:=clRed; Shape1.Shape := stCircle ; Shape1.Brush.Color := clRed; Shape1.Pen.Style := psDash ;  Shape1.Brush.Style := bsClear; Shape1.Pen.color:=clBlue;      Shape1.Pen.Style := psDash; end;
  3: begin  Shape2.Brush.Color := clRed;  Shape3.Brush.Color := clWhite;label1.Font.Color:=clBlack; Label4.Font.Color:=clGreen; Shape1.Shape := stRectangle; Shape1.Brush.Color := clBlue;   Shape1.Pen.Style := psDashDot;    Shape1.Brush.Style := bsSolid; Shape1.Pen.color:=clGreen;    Shape1.Pen.Style := psDash ;  end;
  4: begin  Shape2.Brush.Color := clYellow;  Shape3.Brush.Color := clRed; Shape4.Brush.Color := clWhite;label1.Font.Color:=clYellow; Label4.Font.Color:=clRed; Shape1.Shape := stRoundSquare; Shape1.Brush.Color := clSilver;  Shape1.Pen.Style := psClear;  Shape1.Brush.Style := bsCross; Shape1.Pen.color:=clGreen;    Shape1.Pen.Style := psSolid; end;
   5: begin  Shape3.Brush.Color := clYellow; Shape4.Brush.Color := clBlack; Shape2.Brush.Color := clWhite; label1.Font.Color:=clGray; Label4.Font.Color:=clSilver; Shape1.Shape := stEllipse; Shape1.Brush.Color := clBlue;  Shape1.Pen.Style := psClear;  Shape1.Brush.Style := bsCross; Shape1.Pen.color:=clGreen;    Shape1.Pen.Style := psSolid; end;
6: begin   Shape3.Brush.Color := clWhite; Shape2.Brush.Color := clRed; Shape4.Brush.Color := clBlack; label1.Font.Color:=clFuchsia; Label4.Font.Color:=clWhite; Shape1.Shape := stSquare; Shape1.Brush.Color := clRed; Shape1.Pen.color:=clBlue;  Shape1.Brush.Style := bsVertical;  Shape1.Shape := stRectangle;    Shape1.Pen.Style := psDashDot; end;


end;end;

procedure TForm1.TrackBar1Change(Sender: TObject);
var i:integer;
begin
i:=Trackbar1.Position;
case i of
  0: begin timer1.Interval:=0; end;
  1:    begin timer1.Interval:=5000;   end;
   2:     begin  timer1.Interval:=4000;end;
    3:     begin  timer1.Interval:=3500;end;
      4:    begin timer1.Interval:=3000; end;
        5:    begin timer1.Interval:=2500; end;
        6:    begin timer1.Interval:=2000; end;
         7:    begin timer1.Interval:=1500; end;
          8:    begin timer1.Interval:=1000; end;
           9:    begin timer1.Interval:=500; end;
            10:    begin timer1.Interval:=100; end;


end;end;


end.
