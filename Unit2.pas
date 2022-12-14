unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, ComCtrls, LMDPageControl, StdCtrls, RxCombos,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomMMButton,
  LMDMMButton, LMDCustomButton, LMDButton, LMDButtonControl,
  LMDCustomCheckBox, LMDCheckBox, LMDSBar,  LMDCustomGlyphLabel, ExtCtrls,
  LMDBaseGraphicControl, LMDGraphicControl, LMDCustomGraphicLabel,
  LMDGraphicLabel, acLabels, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDCustomSheetControl, LMDBaseEdit, LMDCustomEdit, LMDEdit;

type
  TForm2 = class(TForm)
    FontDialog1: TFontDialog;
    LMDPageControl1: TLMDPageControl;
    LMDTabSheet1: TLMDTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDCheckBox2: TLMDCheckBox;
    LMDCheckBox3: TLMDCheckBox;
    LMDButton2: TLMDButton;
    LMDButton3: TLMDButton;
    LMDTabSheet2: TLMDTabSheet;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDButton1: TLMDButton;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDCheckBox1: TLMDCheckBox;
    ColorBox3: TColorBox;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDScrollBar1: TLMDScrollBar;
    RxLabel4: TRxLabel;
    LMDCheckBox4: TLMDCheckBox;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    LMDGraphicLabel1: TLMDGraphicLabel;
    RxLabel10: TRxLabel;
    acURLLabel1: TacURLLabel;
    LMDTabSheet3: TLMDTabSheet;
    Memo1: TMemo;
    Label1: TLabel;
    ComboBox1: TComboBox;
    LMDTabSheet4: TLMDTabSheet;
    Label3: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    procedure LMDButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LMDButton3Click(Sender: TObject);
    procedure LMDButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LMDScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure Button1Click(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  ffont=record
          color:Tcolor; // ???? ?????? ???????? ?????
          size:byte;    // ??????
          name_font:string[20];  // ??? ??????
          style:TfontStyles;  // ????? ??????
        end;

    T1=record
       i_prozr:byte; // ????????????
       j:Ffont;  // ????? ?????
       color:TColor; // ????1 ?????
       endcolor:Tcolor;// ????2 ?????
       okant:boolean;  // ???? ?? ?????????
       okant_color:Tcolor; // ???? ?????????
       x:integer; // ????????? ????
       y:integer;// ????????? ????
       icon_in:boolean; // ?????? ? ????
       autorun:boolean; // ????????????
       ischez:boolean; // ???????? ??? ?????????
       t_ischez:byte; //???????? ?????????
       text1:string[50];
     end;

var
  Form2: TForm2;
  Per2:T1;
  f2:file of T1;
  f3:textfile;
  dir:string;
implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.LMDButton1Click(Sender: TObject);
begin
Form2.LMDButton2.Enabled:=true;
Form2.FontDialog1.Execute;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Form_ref:=true;
end;

procedure TForm2.LMDButton3Click(Sender: TObject);
begin
close;
end;

procedure TForm2.LMDButton2Click(Sender: TObject);
begin
// ??????????? ????????? ?????????? Per2 ??? ?????????? ? ????
Per2.i_prozr:=Form2.LMDScrollBar1.Position;

Per2.j.color:=Form2.FontDialog1.Font.Color;
Per2.j.size:=Form2.FontDialog1.Font.Size;
Per2.j.name_font:=Form2.FontDialog1.Font.Name;
Per2.j.style:=Form2.FontDialog1.Font.Style;

Per2.color:=Form2.ColorBox1.Selected;
Per2.endcolor:=Form2.ColorBox2.Selected;

if Form2.LMDCheckBox1.Checked then Per2.okant:=true
                              else Per2.okant:=false;

Per2.okant_color:=Form2.ColorBox3.Selected;

if Form2.LMDCheckBox2.Checked then Per2.icon_in:=true
                              else Per2.icon_in:=false;

if Form2.LMDCheckBox3.Checked then Per2.autorun:=true
                              else Per2.autorun:=false;

if Form2.LMDCheckBox4.Checked then Per2.ischez:=true
                              else Per2.ischez:=false;
Per2.x:=Form1.Left;
Per2.y:=Form1.Top;

Per2.t_ischez:=StrToInt(Form2.ComboBox1.Text);

// ????????? ? ????
dir:=ExtractFileDir(Application.ExeName)+'\';
assignfile(f2,dir+'sys.ini');
  try
    rewrite(f2);
    write(f2,Per2);
    closefile(f2);
  except
  end;
// ????????? ?????????
Form1.AlphaBlendValue:=Per2.i_prozr;

Form1.RxLabel1.Font.Color:=Per2.j.color;
Form1.RxLabel1.Font.Size:=Per2.j.size;
Form1.RxLabel1.Font.Name:=Per2.j.name_font;
Form1.RxLabel1.Font.Style:=Per2.j.style;

Form1.LMDFormShape1.FillObject.Gradient.Color:=Per2.color;
Form1.LMDFormShape1.FillObject.Gradient.EndColor:=Per2.endcolor;

if Per2.okant then Form1.okant:=true
              else Form1.okant:=false;

Form1.okant_color:=Per2.okant_color;

if Per2.icon_in then  Form1.RxTrayIcon1.Active:=true
                else  Form1.RxTrayIcon1.Active:=false;

if Per2.autorun then
                 begin
                  Form1.abfAutoRun1.FileName:=Application.ExeName;
                  Form1.abfAutoRun1.AutoRun:=true;
                 end
                else
                 begin
                  Form1.abfAutoRun1.FileName:=Application.ExeName;
                  Form1.abfAutoRun1.AutoRun:=false;
                 end;

if Per2.ischez then  Form1.ischez:=true
               else  Form1.ischez:=false;
Form1.t1_ischez:=Per2.t_ischez;

Form1.i_prozr:=Per2.i_prozr;
Form1.Form_ref:=true;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
// ????????? ????????? ?? Form1

Form2.LMDScrollBar1.Position:=Form1.i_prozr;
Form2.RxLabel5.Caption:=IntToStr(Form1.i_prozr);

Form2.FontDialog1.Font:=Form1.RxLabel1.Font;

Form2.ColorBox1.Selected:=Form1.LMDFormShape1.FillObject.Gradient.Color;
Form2.ColorBox2.Selected:=Form1.LMDFormShape1.FillObject.Gradient.EndColor;

Form2.ColorBox3.Selected:=Form1.okant_color;

if Form1.okant then Form2.LMDCheckBox1.State:=cbchecked
               else Form2.LMDCheckBox1.State:=cbunchecked;

if Form1.RxTrayIcon1.Active  then  Form2.LMDCheckBox2.State:=cbchecked
                             else Form2.LMDCheckBox2.State:=cbunchecked;

if Form1.abfAutoRun1.AutoRun then Form2.LMDCheckBox3.State:=cbchecked
                             else Form2.LMDCheckBox3.State:=cbunchecked;

if Form1.ischez then Form2.LMDCheckBox4.State:=cbchecked
                else Form2.LMDCheckBox4.State:=cbunchecked;

Form2.Edit2.Text:=Form1.textinbuf;
end;

procedure TForm2.LMDScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
Form2.RxLabel5.Caption:=IntToStr(ScrollPos);

end;

function Decode(S: string; Code: Integer): string;
var
  t: Integer;
begin
  for t := 1 to Length(S) do
    S[t] := Chr(Ord(S[t]) xor Code);
  Result := S;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
// ????????? ? ????
Form1.textinbuf:=Form2.Edit2.Text;
dir:=ExtractFileDir(Application.ExeName)+'\';
assignfile(f3,dir+'buf.ini');
  try
    rewrite(f3);
    write(f3,Decode(Form1.textinbuf,89425));
    closefile(f3);
  except
  end;
end;

end.
