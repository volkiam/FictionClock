unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomComponent, LMDTimer, RXCtrls,
  LMDWndProcComponent, LMDCustomFormFill, LMDFormFill, LMDFormShape, Menus,
  LMDPopupMenu, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomGlyphLabel, LMDGlyphLabel, RXShell, abfComponents,
  LMDCustomHint, LMDCustomShapeHint, LMDMessageHint, LMDShapeHint, ExtCtrls,
  DateUtil,ShellApi, LMDNativeHint,CLIPBrd;

type
  TForm1 = class(TForm)
    RxLabel1: TRxLabel;
    LMDHiTimer1: TLMDHiTimer;
    LMDFormShape1: TLMDFormShape;
    LMDPopupMenu1: TLMDPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    RxTrayIcon1: TRxTrayIcon;
    abfShutdown1: TabfShutdown;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    abfAutoRun1: TabfAutoRun;
    N101: TMenuItem;
    N201: TMenuItem;
    N301: TMenuItem;
    N401: TMenuItem;
    N501: TMenuItem;
    N11: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N102: TMenuItem;
    N202: TMenuItem;
    N302: TMenuItem;
    N402: TMenuItem;
    N502: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N103: TMenuItem;
    N203: TMenuItem;
    N303: TMenuItem;
    N403: TMenuItem;
    N503: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    LMDShapeHint1: TLMDShapeHint;
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure LMDHiTimer1Timer(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure RxLabel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N201Click(Sender: TObject);
    procedure N301Click(Sender: TObject);
    procedure N401Click(Sender: TObject);
    procedure N501Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N102Click(Sender: TObject);
    procedure N202Click(Sender: TObject);
    procedure N302Click(Sender: TObject);
    procedure N402Click(Sender: TObject);
    procedure N502Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N103Click(Sender: TObject);
    procedure N203Click(Sender: TObject);
    procedure N303Click(Sender: TObject);
    procedure N403Click(Sender: TObject);
    procedure N503Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure LMDPopupMenu1Popup(Sender: TObject);
    procedure RxLabel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure WMQueryEndSession(var Msg: TWMQueryEndSession); message WM_QUERYENDSESSION;
  public
    { Public declarations }
    Power:boolean;
    shut_type:byte;
    form_ref:boolean;
    okant:boolean;
    okant_color:TColor;
    icon_in:boolean;
    i_prozr:byte;
    ischez:boolean;
    t1_ischez:byte;
    textinbuf:string;
    procedure change_border;
    procedure Form_refresh;
  end;

type
  ffont=record
          color:Tcolor; // цвет шрифта цифровых часов
          size:byte;    // размер
          name_font:string[20];  // имя шрифта
          style:TfontStyles;  // стиль шрифта
        end;
                                                     
    T1=record
       i_prozr:byte; // прозрачность
       j:Ffont;  // шрифт часов
       color:TColor; // цвет1 формы
       endcolor:Tcolor;// цвет2 формы
       okant:boolean;  // есть ли окантовка
       okant_color:Tcolor; // цвет окантовки
       x:integer; // положение окна
       y:integer;// положение окна
       icon_in:boolean; // иконка в трее
       autorun:boolean; // автозагрузка
       ischez:boolean; // исчезать при наведении
       t_ischez:byte; //интервал исчезания
     end;

               
var
  Form1: TForm1;
  time_power, time1:TdateTime;
  dir:string;
  okant_new:byte;
  f1:file of T1;
  Per1:T1;
  hint_tekst:string;
  break1, tt1,tt2:boolean;
 

implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}





function Decode(S: string; Code: Integer): string;
var
  t: Integer;
begin
  for t := 1 to Length(S) do
    S[t] := Chr(Ord(S[t]) xor Code);
  Result := S;
end;

{Перехватывает информацию о завершении Windows}
procedure TForm1.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
  Form1.Close;
  Msg.Result :=1;
end;

Procedure mouse_in;
var
 pt: TPoint;
begin
 if not break1 then
  begin
   GetCursorPos(pt);
   if PtInRect(Rect(Form1.Left, Form1.Top,Form1.Left + Form1.Width, Form1.Top + Form1.Height),pt) then
        begin
          tt1:=true;
          tt2:=false;
          if Form1.AlphaBlendValue=Form1.i_prozr then Form1.Timer2.Enabled:=true;
        end
             else
       begin
          tt2:=true;
          tt1:=false;
          if Form1.AlphaBlendValue=0 then Form1.Timer2.Enabled:=true;
       end;
   end;     
end;


function prov_time(s:string):string;
begin
  if copy(s,2,1)=':' then s:='0'+s;
  if copy(s,5,1)=':' then s:=copy(s,1,2)+'0'+copy(s,4,length(s)-3);
  prov_time:=s;
end;

procedure TForm1.change_border;
begin
 Form1.Canvas.Pen.Color:=okant_color;
 Form1.Canvas.Pen.Width:=3;
 Form1.Canvas.Brush.Style:=bsClear;
 Form1.Canvas.Rectangle(0,0,Form1.Width,Form1.Height);
 Form1.Canvas.Refresh;
end;

Procedure shutdown(i:byte);
begin
  if i=1 then Form1.abfShutdown1.ActionType:=aatShutdown;
  if i=2 then Form1.abfShutdown1.ActionType:=aatReboot;
  if i=3 then Form1.abfShutdown1.ActionType:=aatSuspend;
  Form1.ShowHint:=false;
  Form1.Power:=false;
  Form1.abfShutdown1.Execute;
end;

Procedure TForm1.Form_refresh;
Begin
Form1.Width:=Form1.RxLabel1.Width+14;
Form1.Height:=Form1.RxLabel1.Height+7;
Form1.RxLabel1.Left:=7;
Form1.RxLabel1.Top:=3;
okant_new:=1;
Form1.change_border;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
with Application do
begin
ShowWindow(Handle, SW_HIDE);
SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW);
end; {With}
SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW);
SetWindowPos(Form1.Handle, hwnd_TopMost, Form1.Left, Form1.Top, Form1.Width, Form1.Height,  0);
i_prozr:=255;
t1_ischez:=10;
dir:=ExtractFileDir(Application.ExeName)+'\';
Form1.LMDHiTimer1.Enabled:=true;
assignfile(f1,dir+'sys.ini');
if fileexists(dir+'sys.ini') then
 begin
 try
    reset(f1);
    read(f1,Per1);
    closefile(f1);
  except
  end;
    // Применяем настройки
i_prozr:=Per1.i_prozr;

Form1.RxLabel1.Font.Color:=Per1.j.color;
Form1.RxLabel1.Font.Size:=Per1.j.size;
Form1.RxLabel1.Font.Name:=Per1.j.name_font;
Form1.RxLabel1.Font.Style:=Per1.j.style;
Form1.Width:=Form1.RxLabel1.Width+14;
Form1.Height:=Form1.RxLabel1.Height+7;
Form1.RxLabel1.Left:=7;
Form1.RxLabel1.Top:=3;

Form1.LMDFormShape1.FillObject.Gradient.Color:=Per1.color;
Form1.LMDFormShape1.FillObject.Gradient.EndColor:=Per1.endcolor;



Form1.okant:=Per1.okant;

Form1.okant_color:=Per1.okant_color;

Form1.RxTrayIcon1.Active:=Per1.icon_in;

Form1.abfAutoRun1.AutoRun:=Per1.autorun;

Form1.ischez:=Per1.ischez;
t1_ischez:=Per1.t_ischez;

Form1.Left:=Per1.x;
Form1.Top:=Per1.y;
 end;
Form_ref:=true;
Form1.AlphaBlendValue:=Per1.i_prozr;
                                                            
//Считываем текст для копирования в буфер обмена
dir:=ExtractFileDir(Application.ExeName)+'\';
if fileexists(dir+'buf.ini') then                
   begin
    assignfile(f3,dir+'buf.ini');
    try
        reset(f3);
        readln(f3,Form1.textinbuf);
        closefile(f3);
        Form1.textinbuf:=Decode(Form1.textinbuf,89425);
    except
    end;
   end;
end;
{_____________________________________________________________________}

procedure TForm1.LMDHiTimer1Timer(Sender: TObject);
var
    systime: TSystemTime;
    times:string;
    time_diff,time2:TdateTime;
begin
     if ischez then mouse_in;
     GetLocalTime(systime);
     time1:=SystemTimeToDateTime(systime);
     times:=timetostr(time1);
     Form1.RxLabel1.Caption:='  '+Prov_time(times)+'  ';
     if Power then
       begin
         time2:=StrToTime(times);
         time_diff:=time_power-time2;
         Form1.Hint:=hint_tekst+TimeToStr(time_diff);
         Form1.RxTrayIcon1.Hint:=Form1.Hint;
         if TimeToStr(Time_diff)='0:01:00' then
          begin
            Form3.Show;
          end;
         if TimeToStr(Time_diff)='0:00:00' then shutdown(shut_type);
       end;
      if form_ref then
        begin
          form_refresh;
          form_ref:=false;
        end;
     if okant_new<=2 then
        begin
            if (okant_new=2) and okant then Form1.change_border
                                       else Form1.Canvas.Refresh; 
          inc(okant_new);
        end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
Form2.show;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
break1:=false;
Form1.AlphaBlendValue:=i_prozr;
close
end;

procedure TForm1.RxLabel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 const SC_DragMove = $F012;  { a magic number }
begin
    Clipboard.AsText:='r_Root^Pass';
    break1:=true;
    ReleaseCapture;
    Form1.perform(WM_SysCommand, SC_DragMove, 0);
    break1:=false;
    Form1.change_border;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Присваиваем настройки переменной Per1 для сохранения в файл
Per1.i_prozr:=Form1.AlphaBlendValue;

Per1.j.color:=Form1.RxLabel1.Font.Color;
Per1.j.size:=Form1.RxLabel1.Font.Size;
Per1.j.name_font:=Form1.RxLabel1.Font.Name;
Per1.j.style:=Form1.RxLabel1.Font.Style;

Per1.color:=Form1.LMDFormShape1.FillObject.Gradient.Color;
Per1.endcolor:=Form1.LMDFormShape1.FillObject.Gradient.EndColor;

if Form1.okant then Per1.okant:=true
               else Per1.okant:=false;

Per1.okant_color:=Form1.okant_color;

if Form1.RxTrayIcon1.Active then  Per1.icon_in:=true
                            else Per1.icon_in:=false;

if Form1.abfAutoRun1.AutoRun then Per1.autorun:=true
                             else Per1.autorun:=false;

Per1.ischez:=ischez;
Per1.x:=Form1.Left;
Per1.y:=Form1.Top;

Per1.t_ischez:=form1.t1_ischez;

// Сохраняем в файл
dir:=ExtractFileDir(Application.ExeName)+'\';
assignfile(f1,dir+'sys.ini');
try
rewrite(f1);
write(f1,Per1);
closefile(f1);
except
end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
Form1.abfShutdown1.ActionType:=aatShutdown;
Form1.abfShutdown1.Execute;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
Form1.abfShutdown1.ActionType:=aatReboot;
Form1.abfShutdown1.Execute;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
Form1.abfShutdown1.ActionType:=aatSuspend;
Form1.abfShutdown1.Execute;
end;

procedure TForm1.N101Click(Sender: TObject);
begin
shut_type:=1;
Power:=true;
time_power:=IncTime(time1,0,10,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До выключения: ';
end;

procedure TForm1.N201Click(Sender: TObject);
begin
shut_type:=1;
Power:=true;
time_power:=IncTime(time1,0,20,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До выключения: ';
end;

procedure TForm1.N301Click(Sender: TObject);
begin
shut_type:=1;
Power:=true;
time_power:=IncTime(time1,0,30,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До выключения: ';
end;

procedure TForm1.N401Click(Sender: TObject);
begin
shut_type:=1;
Power:=true;
time_power:=IncTime(time1,0,40,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До выключения: ';
end;

procedure TForm1.N501Click(Sender: TObject);
begin
shut_type:=1;
Power:=true;
time_power:=IncTime(time1,0,50,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До выключения: ';
end;

procedure TForm1.N11Click(Sender: TObject);
begin
shut_type:=1;
Power:=true;
time_power:=IncTime(time1,1,0,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До выключения: ';
end;

procedure TForm1.N10Click(Sender: TObject);
begin
Power:=false;
Form1.ShowHint:=false;
Form1.RxTrayIcon1.Hint:='';
end;



procedure TForm1.N102Click(Sender: TObject);
begin
shut_type:=2;
Power:=true;
time_power:=IncTime(time1,0,10,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До перезагрузки: ';
end;

procedure TForm1.N202Click(Sender: TObject);
begin
shut_type:=2;
Power:=true;
time_power:=IncTime(time1,0,20,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До перезагрузки: ';
end;

procedure TForm1.N302Click(Sender: TObject);
begin
shut_type:=2;
Power:=true;
time_power:=IncTime(time1,0,30,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До перезагрузки: ';
end;

procedure TForm1.N402Click(Sender: TObject);
begin
shut_type:=2;
Power:=true;
time_power:=IncTime(time1,0,40,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До перезагрузки: ';
end;

procedure TForm1.N502Click(Sender: TObject);
begin
shut_type:=2;
Power:=true;
time_power:=IncTime(time1,0,50,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До перезагрузки: ';
end;

procedure TForm1.N13Click(Sender: TObject);
begin
shut_type:=2;
Power:=true;
time_power:=IncTime(time1,1,0,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До перезагрузки: ';
end;

procedure TForm1.N103Click(Sender: TObject);
begin
shut_type:=3;
Power:=true;
time_power:=IncTime(time1,0,10,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До ждущего режима: ';
end;

procedure TForm1.N203Click(Sender: TObject);
begin
shut_type:=3;
Power:=true;
time_power:=IncTime(time1,0,20,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До ждущего режима: ';
end;

procedure TForm1.N303Click(Sender: TObject);
begin
shut_type:=3;
Power:=true;
time_power:=IncTime(time1,0,30,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До ждущего режима: ';
end;

procedure TForm1.N403Click(Sender: TObject);
begin
shut_type:=3;
Power:=true;
time_power:=IncTime(time1,0,40,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До ждущего режима: ';
end;

procedure TForm1.N503Click(Sender: TObject);
begin
shut_type:=3;
Power:=true;
time_power:=IncTime(time1,0,50,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До ждущего режима: ';
end;

procedure TForm1.N15Click(Sender: TObject);
begin
shut_type:=3;
Power:=true;
time_power:=IncTime(time1,1,0,0,0);
Form1.ShowHint:=true;
Hint_tekst:='До ждущего режима: ';
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
if not break1 then
begin
 if tt1 and (Form1.AlphaBlendValue>0 ) then
  if Form1.AlphaBlendValue>=t1_ischez then
                                   Form1.AlphaBlendValue:=Form1.AlphaBlendValue-t1_ischez
                               else
                                   Form1.AlphaBlendValue:=0;
 if tt2 and (Form1.AlphaBlendValue<i_prozr ) then
  if Form1.alphablendValue<=255-t1_ischez then
                                   Form1.AlphaBlendValue:=Form1.AlphaBlendValue+t1_ischez
                                else
                                    Form1.AlphaBlendValue:=255;

 if Form1.AlphaBlendValue>=i_prozr then
   begin
     Form1.Timer2.Enabled:=false;
     Form1.AlphaBlendValue:=i_prozr;
   end;

 if Form1.AlphaBlendValue=0 then
   begin
     Form1.Timer2.Enabled:=false;
   end;
end;

end;

procedure TForm1.LMDPopupMenu1Popup(Sender: TObject);
begin
break1:=false;
Form1.AlphaBlendValue:=i_prozr;
end;

procedure TForm1.RxLabel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
break1:=false;
Form1.AlphaBlendValue:=i_prozr;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
form4.showmodal;
if Form4.yes then
 begin
   shut_type:=1;
   Power:=true;
   time_power:=Form4.time_power;
   Form1.ShowHint:=true;
   Hint_tekst:='До выключения: ';
 end;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
form4.showmodal;
if Form4.yes then
 begin
   shut_type:=2;
   Power:=true;
   time_power:=Form4.time_power;
   Form1.ShowHint:=true;
   Hint_tekst:='До перезагрузки: ';
 end;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
form4.showmodal;
if Form4.yes then
 begin
   shut_type:=3;
   Power:=true;
   time_power:=Form4.time_power;
   Form1.ShowHint:=true;
   Hint_tekst:='До ждущего режима: ';
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 with Form1 do
  SetWindowPos(Handle,
    HWND_TOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

end.
