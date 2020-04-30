program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.math;

var
  ch: string;
  i: integer;

begin
  try
    if random(10) = 5 then
      ch := '5'
    else
      ch := 'autre';
    // équivalent à
    ch := ifthen(random(10) = 5, '5', 'autre');

    if random(10) = 5 then
      i := 5
    else
      i := 0;
    // équivalent à
    i := ifthen(random(10) = 5, 5, 0);

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
