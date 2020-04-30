program Project1;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  i: integer;
  ch: string;

begin
  try
    randomize;
    i := random(10);
    if i = 1 then
      writeln(i.tostring)
    else if i in [2, 3, 4] then
      writeln(i.tostring)
    else if i = 5 then
      writeln(i.tostring)
    else if i = 6 then
      writeln(i.tostring)
    else if i in [7, 8] then
      writeln(i.tostring)
    else
      writeln('valeur non traitée : ' + i.tostring);

    case i of
      1:
        writeln(i.tostring);
      2, 3, 4:
        writeln(i.tostring);
      5:
        writeln(i.tostring);
      6:
        writeln(i.tostring);
      7, 8:
        writeln(i.tostring);
    else
      writeln('valeur non traitée : ' + i.tostring);
    end;
    readln(ch);
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;

end.
