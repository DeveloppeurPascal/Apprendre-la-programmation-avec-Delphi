unit Unit4;

interface

procedure OuvreForm3;

implementation

uses UForm3;

procedure OuvreForm3;
var
  f: tform3;
begin
  f := tform3.create(nil);
  try
    f.ShowModal;
  finally
    f.Free;
  end;
end;

end.
