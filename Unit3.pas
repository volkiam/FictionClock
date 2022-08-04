unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomButton, LMDButton, RXCtrls,
  LMDCustomComponent, LMDWndProcComponent, LMDFormShape, LMDTimer, MMSystem;

type
  TForm3 = class(TForm)
    LMDFormShape1: TLMDFormShape;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    LMDButton1: TLMDButton;
    LMDButton2: TLMDButton;
    LMDHiTimer1: TLMDHiTimer;
    procedure LMDButton1Click(Sender: TObject);
    procedure LMDButton2Click(Sender: TObject);
    procedure LMDHiTimer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  i:byte;
implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.LMDButton1Click(Sender: TObject);
begin
Form3.LMDHiTimer1.Enabled:=false;
close;
end;

procedure TForm3.LMDButton2Click(Sender: TObject);
begin
Form1.Power:=false;
Form3.LMDHiTimer1.Enabled:=false;
Form1.ShowHint:=false;
close;
end;

procedure TForm3.LMDHiTimer1Timer(Sender: TObject);
begin
 inc(i);
 Form3.RxLabel3.Caption:=IntToStr(60-i)+' секунд';
 //if (i>=50) and (i<59) then
   // if i mod 2 = 0 then PlaySound(PChar('ding.wav'), 0, SND_FILENAME);
 if i=59 then
  begin
    Form3.LMDHiTimer1.Enabled:=false;
    Form3.Close;
  end;  
end;

procedure TForm3.FormShow(Sender: TObject);
begin
Form3.Top:=round(Screen.Height/2-50);
Form3.Left:=round(Screen.Width/2-120);
i:=0;
if Form1.Shut_type=1 then Form3.RxLabel1.Caption:='До выключения ';
if Form1.Shut_type=2 then Form3.RxLabel1.Caption:='До перезагрузки ';
if Form1.Shut_type=3 then Form3.RxLabel1.Caption:='До перехода в ждущий режим ';
Form3.LMDHiTimer1.Enabled:=true;
end;

end.
