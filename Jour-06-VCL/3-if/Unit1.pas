unit Unit1;

interface

implementation

procedure ok;
begin
end;

procedure notok;
begin
end;

var
  i, j: integer;
  z: bolean;

initialization

if (i < j) then
  ok
else
  notok;

if (i < j) then
  ok;
if not(i < j) then
  notok;

if (i < j) then
  if (j < 10) then
    ok
  else
    notok
else
  notok;

if (i < j) and (j < 10) then
  ok
else
  notok;

if (i < j) then
begin
  if (j < 10) then
    ok
  else
    notok;
end
else
  notok;

if (i < j) then
  ok
else if (i > 15) then
  ok
else
  notok;

end.
