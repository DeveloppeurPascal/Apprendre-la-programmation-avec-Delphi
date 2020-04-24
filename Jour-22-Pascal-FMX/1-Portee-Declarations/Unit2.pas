unit Unit2;

interface

type
  Tmachin = class
  private
    FMaValeur: integer;
    procedure privee;
  public
    FBidule: boolean;
    procedure publique;
  end;

procedure MaProc;

var
  Machin: Tmachin;

implementation

procedure MaProc;
begin
  Machin.FMaValeur := 1;
  Machin.privee;
  Machin.publique;
  Machin.FBidule := false;
end;

procedure MaProc2;
begin
  Machin.FBidule := true;
end;

{ Tmachin }

procedure Tmachin.privee;
begin
  FMaValeur := 10;
  FBidule := false;
end;

procedure Tmachin.publique;
begin
  FMaValeur := 5;
  FBidule := false;
end;

initialization

Machin := Tmachin.Create;
MaProc2;

finalization

if assigned(Machin) then
  Machin.Free;

end.
