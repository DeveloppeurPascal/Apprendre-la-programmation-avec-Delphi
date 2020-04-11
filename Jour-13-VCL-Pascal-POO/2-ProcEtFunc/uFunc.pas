unit uFunc;

interface

function MaFunc1: integer;

function FuncMath(n: integer): integer;

implementation

function MaFunc1: integer;
begin
  // MaFunc1 := 4;
  // exit(5);
  Result := 5;
end;

function FuncMath(n: integer): integer;
begin
  if (n > 0) then
    Result := FuncMath(n - 1) + n
  else
    Result := 0;
end;

end.
