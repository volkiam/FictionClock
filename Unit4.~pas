unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomButton, LMDButton;

type
  TForm4 = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LMDButton1: TLMDButton;
    procedure LMDButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    time_power:TdateTime;
    yes:boolean;
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.LMDButton1Click(Sender: TObject);
begin
time_power:=now;
time_power:=StrToTime(Form4.ComboBox1.Text+':'+Form4.ComboBox2.Text+':00');
yes:=true;
close;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
Form4.Top:=round(Screen.Height/2-50);
Form4.Left:=round(Screen.Width/2-120);
end;

end.
