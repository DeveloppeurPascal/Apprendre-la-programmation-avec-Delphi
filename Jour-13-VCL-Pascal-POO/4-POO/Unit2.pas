unit Unit2;

interface

type
  TMaClasse = class(TObject)
  public
    procedure MaClasseProc;
    function MaFunc: integer; virtual;
  end;

  TMaClasse2 = class(TMaClasse)
  private
    procedure MaClasse2ProcPriv;
  public
    procedure MaClasse2Proc; overload;
    procedure MaClasse2Proc(i: integer); overload;
  end;

  TMaClasse3 = class(TMaClasse2)
  private
    FUnEntier: integer;
    procedure SetUnEntier(const Value: integer);
    function GetValeurAleatoire: integer;
  public
    function MaFunc: integer; override;
    property UnEntier: integer read FUnEntier write SetUnEntier;
    property ValeurAleatoire: integer read GetValeurAleatoire;
  end;

implementation

{ TMaClasse3 }

function TMaClasse3.GetValeurAleatoire: integer;
begin
  Result := random(1000);
end;

function TMaClasse3.MaFunc: integer;
begin
  Result := 10;
end;

procedure TMaClasse3.SetUnEntier(const Value: integer);
begin
  FUnEntier := Value;
end;

{ TMaClasse }

procedure TMaClasse.MaClasseProc;
var
  i: integer;
begin
  i := MaFunc;
end;

function TMaClasse.MaFunc: integer;
begin
  Result := 5;
end;

{ TMaClasse2 }

procedure TMaClasse2.MaClasse2Proc;
begin

end;

procedure TMaClasse2.MaClasse2Proc(i: integer);
begin

end;

procedure TMaClasse2.MaClasse2ProcPriv;
begin

end;

initialization

{$IFDEF DEBUG}
  reportmemoryleaksonshutdown := true;
{$ENDIF}

end.
