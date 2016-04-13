unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, MPlayer;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Timer2: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer3: TTimer;
    Timer4: TTimer;
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    Timer5: TTimer;
    MediaPlayer3: TMediaPlayer;
    MediaPlayer4: TMediaPlayer;
    Image11: TImage;
    Image12: TImage;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer5Timer(Sender: TObject);
    procedure Image11MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image12MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure readrec();



  private
    { Private declarations }
  public

    { Public declarations }
  end;


var
  Form1: TForm1;
  ud1:boolean;
    ud2:boolean;
  perja:boolean;
  patro:byte;
  kon:boolean;
  nap:byte;
  f:textfile;
  fname: string;
  name:string [20];
  results:string;
   name1,name2,name3,name4,name5,name6,name7,name8,name9,name10:string;
  score1,score2,score3,score4,score5,score6,score7,score8,score9,score10:byte;
implementation

{$R *.dfm}

procedure TForm1.readrec();
begin
fname:='records.txt';
assignfile(f,fname);
reset(f);
readln(f,name1);
readln(f,score1);
readln(f,name2);
readln(f,score2);
readln(f,name3);
readln(f,score3);
readln(f,name4);
readln(f,score4);
readln(f,name5);
readln(f,score5);
readln(f,name6);
readln(f,score6);
readln(f,name7);
readln(f,score7);
readln(f,name8);
readln(f,score8);
readln(f,name9);
readln(f,score9);
readln(f,name10);
readln(f,score10);
closefile(f);
end;


procedure TForm1.FormActivate(Sender: TObject);
begin
//loading Bitmaps
image1.Picture.LoadFromFile('fon1.bmp');
image2.Picture.LoadFromFile('bird1.bmp');
image3.Picture.LoadFromFile('bird2.bmp');
image11.Picture.LoadFromFile('bird3.bmp');
image12.Picture.LoadFromFile('bird4.bmp');

image4.picture.LoadFromFile('cryls.bmp');
image5.Picture.LoadFromFile('patron.bmp');
image6.Picture.LoadFromFile('patron.bmp');
image7.Picture.LoadFromFile('patron.bmp');
image8.Picture.LoadFromFile('patron.bmp');
image9.Picture.LoadFromFile('patron.bmp');
image10.Picture.LoadFromFile('patron.bmp');
//opens audio files
mediaplayer1.FileName :='paf.wav';
mediaplayer2.FileName :='kar.wav';
mediaplayer3.FileName :='null.wav';
mediaplayer4.FileName :='reload.wav';
//loading a file records

readrec;
//standart valuables for
ud1:=false;
ud2:=false;
kon:=false;
patro:=6;
nap:=0;
end;



procedure TForm1.Timer1Timer(Sender: TObject);
begin



  //0 = left moving, 1 = right moving
  if nap=0 then
  begin
  //flying to the left border
  image2.left:=image2.left-8;
  image3.left:=image3.left-8;
  image4.Left:=image4.Left-8;
  image11.Left:=image11.Left-8;
  image12.Left:=image12.Left-8;
  //if Object had crossed Left Border
  if image2.left < -100 then
    begin

    //generic new coordinats
    image2.Left:=random(650)+50;
    image3.Left:=image2.left;
    image4.Left:=image2.left;
    image11.Left:=image2.left;
    image12.Left:=image2.left;

    image2.top:=random(425)+50;
    image3.top:=image2.top;
    image11.top:=image2.top;
    image12.top:=image2.top;
    image4.top:=image2.top-10;
    //generic new destination
    nap:=random(2);
    //hide
    image2.Visible :=false;
    image3.Visible :=false;
    image11.Visible :=false;
    image12.Visible :=false;
    end;
  end;



  if nap=1 then
  begin
  //flying to the right border
  image2.left:=image2.left+8;
  image3.left:=image3.left+8;
  image4.Left:=image4.Left+8;
  image11.Left:=image11.Left+8;
  image12.Left:=image12.Left+8;

  //if Object had crossed Left Border
    if image2.left > 720 then
    begin
    //generic new coordinats
    image2.Left:=random(650)+50;
    image3.Left:=image2.left;
    image4.Left:=image2.left;
    image11.Left:=image2.left;
    image12.Left:=image2.left;

    image2.top:=random(425)+50;
    image3.top:=image2.top;
    image11.top:=image2.top;
    image12.top:=image2.top;
    image4.top:=image2.top-10;
    //generic new destination
    nap:=random(2);
    //hide
    image2.Visible :=false;
    image3.Visible :=false;
    image11.Visible :=false;
    image12.Visible :=false;
    end;
  end;
end;






procedure TForm1.Timer2Timer(Sender: TObject);
//change bird10 to bird11; bird11 to bird10
begin
  if nap=0 then
  begin
    if ud1=true then
    begin
    ud1:=false;
    image3.Visible:=true;
    image2.Visible:=false;
    end
    else
    begin
    ud1:=true;
    image3.Visible:=false;
    image2.Visible:=true;
    end;
  image11.Visible :=false;
  image12.Visible :=false;
  end;
  if nap=1 then
  begin
    if ud2=true then
    begin
    ud2:=false;
    image11.Visible:=true;
    image12.Visible:=false;
    end
    else
    begin
    ud2:=true;
    image11.Visible:=false;
    image12.Visible:=true;
    end;
  image3.Visible :=false;
  image4.Visible :=false;
  end;
end;



procedure TForm1.Timer3Timer(Sender: TObject);
label
scor;

begin
//times left
label3.caption:= inttostr(strtoint(label3.Caption)-1);
//stopping game
if strtoint(label3.caption) = 0 then
begin
timer1.Enabled :=false;
timer2.Enabled :=false;
timer3.Enabled :=false;
kon:=true;
showmessage('Vash scxet '+label1.Caption);

if strtoint(label1.Caption) > score1 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=score9;
name10:=name9;
score9:=score8;
name9:=name8;
score8:=score7;
name8:=name7;
score7:=score6;
name7:=name6;
score6:=score5;
name6:=name5;
score5:=score4;
name5:=name4;
score4:=score3;
name4:=name3;
score3:=score2;
name3:=name2;
score2:=score1;
name2:=name1;
score1:=strtoint(label1.caption);
name1:=name;
goto scor;
end;

if strtoint(label1.Caption) > score2 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=score9;
name10:=name9;
score9:=score8;
name9:=name8;
score8:=score7;
name8:=name7;
score7:=score6;
name7:=name6;
score6:=score5;
name6:=name5;
score5:=score4;
name5:=name4;
score4:=score3;
name4:=name3;
score3:=score2;
name3:=name2;
score2:=strtoint(label1.caption);
name2:=name;
goto scor;
end;

if strtoint(label1.Caption) > score3 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=score9;
name10:=name9;
score9:=score8;
name9:=name8;
score8:=score7;
name8:=name7;
score7:=score6;
name7:=name6;
score6:=score5;
name6:=name5;
score5:=score4;
name5:=name4;
score4:=score3;
name4:=name3;
score3:=strtoint(label1.caption);
name3:=name;
goto scor;
end;

if strtoint(label1.Caption) > score4 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=score9;
name10:=name9;
score9:=score8;
name9:=name8;
score8:=score7;
name8:=name7;
score7:=score6;
name7:=name6;
score6:=score5;
name6:=name5;
score5:=score4;
name5:=name4;
score4:=strtoint(label1.caption);
name4:=name;
goto scor;
end;

if strtoint(label1.Caption) > score5 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=score9;
name10:=name9;
score9:=score8;
name9:=name8;
score8:=score7;
name8:=name7;
score7:=score6;
name7:=name6;
score6:=score5;
name6:=name5;
score5:=strtoint(label1.caption);
name5:=name;
goto scor;
end;

if strtoint(label1.Caption) > score6 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=score9;
name10:=name9;
score9:=score8;
name9:=name8;
score8:=score7;
name8:=name7;
score7:=score6;
name7:=name6;
score6:=strtoint(label1.caption);
name6:=name;
goto scor;
end;

if strtoint(label1.Caption) > score7 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=score9;
name10:=name9;
score9:=score8;
name9:=name8;
score8:=score7;
name8:=name7;
score7:=strtoint(label1.caption);
name7:=name;
goto scor;
end;

if strtoint(label1.Caption) > score8 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=score9;
name10:=name9;
score9:=score8;
name9:=name8;
score8:=strtoint(label1.caption);
name8:=name;
goto scor;
end;

if strtoint(label1.Caption) > score9 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=score9;
name10:=name9;
score9:=strtoint(label1.caption);
name9:=name;
goto scor;
end;

if strtoint(label1.Caption) > score10 then
begin
name:=inputbox('The Win!', 'Press Your Name', '');
score10:=strtoint(label1.caption);
name10:=name;
goto scor;
end;

scor:
fname:='records.txt';
assignfile(f,fname);
rewrite(f);
writeln(f,name1);
writeln(f,score1);
writeln(f,name2);
writeln(f,score2);
writeln(f,name3);
writeln(f,score3);
writeln(f,name4);
writeln(f,score4);
writeln(f,name5);
writeln(f,score5);
writeln(f,name6);
writeln(f,score6);
writeln(f,name7);
writeln(f,score7);
writeln(f,name8);
writeln(f,score8);
writeln(f,name9);
writeln(f,score9);
writeln(f,name10);
writeln(f,score10);

closefile(f);

results:='Records:'+chr(13)+chr(10)+name1+' '+inttostr(score1)+chr(13)+chr(10)+name2+' '+inttostr(score2)+chr(13)+chr(10)+name3+' '+inttostr(score3)+chr(13)+chr(10)+name4+' '+inttostr(score4)+chr(13)+chr(10)+name5+' '+inttostr(score5)+chr(13)+chr(10)+name6+' '+inttostr(score6)+chr(13)+chr(10)+name7+' '+inttostr(score7)+chr(13)+chr(10)+name8+' '+inttostr(score8)+chr(13)+chr(10)+name9+' '+inttostr(score9)+chr(13)+chr(10)+name10+' '+inttostr(score10);
showmessage(results);
if messagedlg('Else One?',mtconfirmation,[mbyes,mbno],0) = mrNo then
close
else
begin
label1.caption:=inttostr(0);
label3.caption:=inttostr(30);
kon:=false;
patro:=6;
readrec;
image2.Left:=random(650)+50;
image3.Left:=image2.left;
image4.Left:=image2.left;
image11.Left:=image2.left;
image12.Left:=image2.left;
image2.top:=random(425)+50;
image3.top:=image2.top;
image11.top:=image2.top;
image12.top:=image2.top;
image4.top:=image2.top-10;
nap:=random(2);
image2.Visible := false;
image3.Visible := false;
image11.Visible := false;
image12.Visible := false;
timer1.Enabled :=true;
timer2.Enabled:=true;
timer3.Enabled :=true;
end;
end;

end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
//showing Perja)
image4.Visible :=false;
perja:=false;
timer4.Enabled:=false;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//checking Game
if kon=false then
begin
//checking Mouse Button
//Shot
if (button = mbLeft) and (patro > 0) then
begin
mediaplayer1.Open;
mediaplayer1.Play;
patro:=patro-1;
end;
//Clip is Empty
if (button = mbLeft) and (patro = 0) then
begin
mediaplayer3.Open;
mediaplayer3.Play;
end;
//Reload Clip
if button = mbRight then
begin
mediaplayer4.Open;
mediaplayer4.Play;
patro:=6;
end;
end;

end;


procedure TForm1.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

if kon=false then
begin
if (button = mbLeft) and (patro > 0) then
begin

label1.Caption := inttostr(strtoint(label1.Caption)+1);
image4.Visible :=true;
perja:=true;
timer4.Enabled :=true;
mediaplayer1.Open;
mediaplayer1.Play;
mediaplayer2.Open;
mediaplayer2.Play;
patro:=patro-1;
//way
nap:=random(2);
//hide
image2.Visible :=false;
image3.Visible :=false;
image11.Visible :=false;
image12.Visible :=false;
//generic koordinats
image2.Left:=random(650)+50;
image3.Left:=image2.left;
image4.Left:=image2.left;
image11.Left:=image2.Left;
image12.Left:=image2.Left;
image2.top:=random(425)+50;
image3.top:=image2.top;
image11.top:=image2.top;
image12.top:=image2.top;
image4.top:=image2.top-10;
end;

if (button = mbLeft) and (patro = 0) then
begin
mediaplayer3.Open;
mediaplayer3.Play;
end;

if button = mbRight then
begin
mediaplayer4.Open;
mediaplayer4.Play;
patro:=6;
end;
end;

end;


procedure TForm1.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if kon=false then
begin
if (button = mbLeft) and (patro > 0) then
begin
label1.Caption := inttostr(strtoint(label1.Caption)+1);
image4.Visible :=true;
perja:=true;
timer4.Enabled :=true;
mediaplayer1.Open;
mediaplayer1.Play;
mediaplayer2.Open;
mediaplayer2.Play;
patro:=patro-1;
//way
nap:=random(2);
//hide
image2.Visible :=false;
image3.Visible :=false;
image11.Visible :=false;
image12.Visible :=false;
//generic koordinats
image2.Left:=random(650)+50;
image3.Left:=image2.left;
image4.Left:=image2.left;
image11.Left:=image2.Left;
image12.Left:=image2.Left;
image2.top:=random(425)+50;
image3.top:=image2.top;
image11.top:=image2.top;
image12.top:=image2.top;
image4.top:=image2.top-10;
end;

if (button = mbLeft) and (patro = 0) then
begin
mediaplayer3.Open;
mediaplayer3.Play;
end;

if button = mbRight then
begin
mediaplayer4.Open;
mediaplayer4.Play;
patro:=6;
end;
end;

end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin

case patro of
6:
begin
image5.visible :=true;
image6.visible :=true;
image7.visible :=true;
image8.visible :=true;
image9.visible :=true;
image10.visible :=true;
end;
5:
begin
image5.visible :=false;
image6.visible :=true;
image7.visible :=true;
image8.visible :=true;
image9.visible :=true;
image10.visible :=true;
end;
4:
begin
image5.visible :=false;
image6.visible :=false;
image7.visible :=true;
image8.visible :=true;
image9.visible :=true;
image10.visible :=true;
end;
3:
begin
image5.visible :=false;
image6.visible :=false;
image7.visible :=false;
image8.visible :=true;
image9.visible :=true;
image10.visible :=true;
end;
2:
begin
image5.visible :=false;
image6.visible :=false;
image7.visible :=false;
image8.visible :=false;
image9.visible :=true;
image10.visible :=true;
end;
1:
begin
image5.visible :=false;
image6.visible :=false;
image7.visible :=false;
image8.visible :=false;
image9.visible :=false;
image10.visible :=true;
end;
0:
begin
image5.visible :=false;
image6.visible :=false;
image7.visible :=false;
image8.visible :=false;
image9.visible :=false;
image10.visible :=false;
end;

end;

end;



procedure TForm1.Image11MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if kon=false then
begin
if (button = mbLeft) and (patro > 0) then
begin
label1.Caption := inttostr(strtoint(label1.Caption)+1);
image4.Visible :=true;
perja:=true;
timer4.Enabled :=true;
mediaplayer1.Open;
mediaplayer1.Play;
mediaplayer2.Open;
mediaplayer2.Play;
patro:=patro-1;
//way
nap:=random(2);
//hide
image2.Visible :=false;
image3.Visible :=false;
image11.Visible :=false;
image12.Visible :=false;
//generic koordinats
image2.Left:=random(650)+50;
image3.Left:=image2.left;
image4.Left:=image2.left;
image11.Left:=image2.Left;
image12.Left:=image2.Left;
image2.top:=random(425)+50;
image3.top:=image2.top;
image11.top:=image2.top;
image12.top:=image2.top;
image4.top:=image2.top-10;
end;

if (button = mbLeft) and (patro = 0) then
begin
mediaplayer3.Open;
mediaplayer3.Play;
end;

if button = mbRight then
begin
mediaplayer4.Open;
mediaplayer4.Play;
patro:=6;
end;
end;

end;

procedure TForm1.Image12MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if kon=false then
begin
if (button = mbLeft) and (patro > 0) then
begin
label1.Caption := inttostr(strtoint(label1.Caption)+1);
image4.Visible :=true;
perja:=true;
timer4.Enabled :=true;
mediaplayer1.Open;
mediaplayer1.Play;
mediaplayer2.Open;
mediaplayer2.Play;
patro:=patro-1;
//way
nap:=random(2);
//hide
image2.Visible :=false;
image3.Visible :=false;
image11.Visible :=false;
image12.Visible :=false;
//generic koordinats
image2.Left:=random(650)+50;
image3.Left:=image2.left;
image4.Left:=image2.left;
image11.Left:=image2.Left;
image12.Left:=image2.Left;
image2.top:=random(425)+50;
image3.top:=image2.top;
image11.top:=image2.top;
image12.top:=image2.top;
image4.top:=image2.top-10;
end;

if (button = mbLeft) and (patro = 0) then
begin
mediaplayer3.Open;
mediaplayer3.Play;
end;

if button = mbRight then
begin
mediaplayer4.Open;
mediaplayer4.Play;
patro:=6;
end;
end;

end;

end.
