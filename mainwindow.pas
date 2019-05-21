unit MainWindow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  sebastian.vogt.exampleEvent;

type

  { TForm1 }

  TForm1 = class(TForm)
    counter: TCounter;
    strList: TStringList;
    outputMemo: TMemo;
    runBtn: TButton;
    procedure runBtnClick(Sender: TObject);

    procedure counterStart(Sender: Tobject);
    procedure counterChange(Sender: TObject);
    procedure counterFinish(Sender: Tobject);
  private



  public


  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.runBtnClick(Sender: TObject);
begin
  strList := TStringList.Create;

  counter := TCounter.create;

  counter.onCounterStart := @counterStart;
  counter.onCounterChange := @counterChange;
  counter.onCounterFinish := @counterFinish;

  counter.run;


end;

procedure TForm1.counterStart(Sender: TObject);
var me: TCounter;
begin
  me := TCounter(Sender);
  strList.add('onCounterStart count = ' + intToStr(me.count));
  outputMemo.Lines := strList;

end;

procedure TForm1.counterChange(Sender: TObject);
begin
  strList.add('onCounterChange count = ' + intToStr(TCounter(Sender).count));
  outputMemo.Lines := strList;

end;

procedure TForm1.counterFinish(Sender: TObject);
var me: TCounter;
begin
  me := Sender as TCounter;
  strList.add('onCounterFinish count = ' + intToStr(me.count));
  outputMemo.Lines := strList;

end;

end.

