unit Unit3;

interface

type
  TMyProc = procedure;
  TMyProc2 = procedure(AMonParametre: integer);
  TMyFunc = function: integer;

  TMaClFunc = function: integer of object;

  TMaClasse = class
    Toto: TMaClFunc;
    procedure appeltoto;
  end;

  TMAClasse2 = class
    function bidule: integer;
  end;

  TMAClasse3 = class
    function truc: integer;
  end;

  TMaProcAnonyme = reference to procedure(a: integer);

implementation

procedure maprocedure;
begin
end;

procedure maprocedure2(AMonParametre: integer);
begin
end;

function mafonction: integer;
begin
  result := random(high(integer));
end;

var
  MyProc: TMyProc;
  MyProc2: TMyProc2;

  j: integer;

  MyFunc: TMyFunc;

  mc1: TMaClasse;
  mc2: TMAClasse2;
  mc3: TMAClasse3;

  { TMaClasse }

procedure TMaClasse.appeltoto;
var
  i: integer;
begin
  if assigned(Toto) then
    i := Toto;
end;

{ TMAClasse2 }

function TMAClasse2.bidule: integer;
begin
  result := random(high(integer));
end;

{ TMAClasse3 }

function TMAClasse3.truc: integer;
begin
  result := random(high(integer));
end;

procedure maproc6456(Ap1: TMyProc; Ap2: TMyFunc);
var
  i: integer;
begin
  Ap1;
  i := Ap2;
end;

procedure maproc34654532(AParam: TMaProcAnonyme);
begin
  AParam(14);
end;

initialization

MyProc := maprocedure;
maprocedure;
MyProc;

MyFunc := mafonction;
j := mafonction;
j := MyFunc;

mc1 := TMaClasse.Create;
try
  mc2 := TMAClasse2.Create;
  try
    mc3 := TMAClasse3.Create;
    try
      mc1.Toto := mc2.bidule;
      mc1.appeltoto;
      mc1.Toto := mc3.truc;
      mc1.appeltoto;
    finally
      mc3.Free;
    end;
  finally
    mc2.Free;
  end;
finally
  mc1.Free;
end;

maproc6456(maprocedure, MyFunc);

maproc34654532(
  procedure(i: integer)
  begin
    writeln(i);
  end);

end.
