unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TPoint3D = record
    x: Real;
    y: Real;
    z: Real;
  end;

  TMatrix = array[1..3, 1..3] of Integer;

  TCara = record
    Points: array[1..4] of TPoint3D;
    Visible: boolean;
    Color: TColor;
  end;


  TCubie = record
    Caras: array[1..6] of TCara; // Represents the faces of a cubie
    Shown: boolean;
  end;

  TRubik = record
    Cubes: array[1..27] of TCubie;

    TopLayer: TMatrix;
    MidHLayer: TMatrix;
    BottomLayer: TMatrix;

    FrontLayer: TMatrix;
    MidVLayer: TMatrix;
    BackLayer: TMatrix;

    LeftLayer: TMatrix;
    MidFLayer: TMatrix;
    RightLayer: TMatrix;

    VisibleFaces: array[1..56] of TCara;
  end;

  TVector3D = record
    x, y, z: Real;
  end;





  TForm4 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    Button37: TButton;
    Timer1: TTimer;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    Button41: TButton;
    Button42: TButton;
    Button43: TButton;
    Button44: TButton;
    Button45: TButton;
    Button46: TButton;
    Button47: TButton;
    Button48: TButton;
    Button49: TButton;
    Button50: TButton;
    Button51: TButton;
    Button52: TButton;
    Button53: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Button55: TButton;
    Button56: TButton;
    Button57: TButton;
    Button58: TButton;
    Button59: TButton;
    Button54: TButton;
    procedure Button59Click(Sender: TObject);
    procedure Button58Click(Sender: TObject);
    procedure Button57Click(Sender: TObject);
    procedure Button56Click(Sender: TObject);
    procedure Button55Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button54Click(Sender: TObject);
    procedure Button53Click(Sender: TObject);
    procedure Button51Click(Sender: TObject);
    procedure Button52Click(Sender: TObject);
    procedure Button50Click(Sender: TObject);
    procedure Button49Click(Sender: TObject);
    procedure Button48Click(Sender: TObject);
    procedure Button47Click(Sender: TObject);
    procedure Button43Click(Sender: TObject);
    procedure Button46Click(Sender: TObject);
    procedure Button45Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure Button44Click(Sender: TObject);
    procedure Button41Click(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure Button38Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Rubik: TRubik;
  Order: array[1..56] of Integer;
  OrderCubie: array[1..6] of Integer;
  CaraPant: Array[1..4] of TPoint;
  XPantalla,
  YPantalla: Integer;
  EyeToObj, EyeToScreen: Real;
  alpha : Real;
  Xaxis, Yaxis, Zaxis : TVector3D;
  rep, LayerR: Integer;

const
  TopL = 1;
  MidH = 2;
  Bottom = 3;

  LeftL = 4;
  MidV = 5;
  Right = 6;

  Front = 7;
  MidF = 8;
  Back = 9;

  //Rotation Cases
  TopClock = 1;
  MidHClock = 2;
  BottomClock = 3;

  LeftClock = 4;
  MidVClock = 5;
  RightClock = 6;

  FrontClock = 7;
  MidFClock = 8;
  BackClock = 9;

  TopCounter = 10;
  MidHCounter = 11;
  BottomCounter = 12;

  LeftCounter = 13;
  MidVCounter = 14;
  RightCounter = 15;

  FrontCounter = 16;
  MidFCounter = 17;
  BackCounter = 18;

implementation

{$R *.dfm}

//Point3D
function Point3D(X, Y, Z: Real): TPoint3D;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

//Vecvtor Functions
function Vector3D(x, y, z: Real): TVector3D;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
end;

function DotProduct(v1, v2: TVector3D): Real;
begin
  Result := v1.x * v2.x + v1.y * v2.y + v1.z * v2.z;
end;

function CrossProduct(v1, v2: TVector3D): TVector3D;
begin
  Result.x := v1.y * v2.z - v1.z * v2.y;
  Result.y := v1.z * v2.x - v1.x * v2.z;
  Result.z := v1.x * v2.y - v1.y * v2.x;
end;


//Defines starting points and visible faces
procedure StartCubie(var Cube: TCubie; x, y, z: Real; cubie: Integer);
begin
  //Front White
  Cube.Caras[1].Points[1] := Point3D(x-6, y-6, z-6);
  Cube.Caras[1].Points[2] := Point3D(x-6, y+6, z-6);
  Cube.Caras[1].Points[3] := Point3D(x+6, y+6, z-6);
  Cube.Caras[1].Points[4] := Point3D(x+6, y-6, z-6);

  Cube.Caras[1].Color := clWhite;
  //Back Yellow
  Cube.Caras[2].Points[1] := Point3D(x-6, y-6, z+6);
  Cube.Caras[2].Points[2] := Point3D(x-6, y+6, z+6);
  Cube.Caras[2].Points[3] := Point3D(x+6, y+6, z+6);
  Cube.Caras[2].Points[4] := Point3D(x+6, y-6, z+6);

  Cube.Caras[2].Color := clYellow;
  //Top Green
  Cube.Caras[3].Points[1] := Point3D(x-6, y-6, z+6);
  Cube.Caras[3].Points[2] := Point3D(x-6, y-6, z-6);
  Cube.Caras[3].Points[3] := Point3D(x+6, y-6, z-6);
  Cube.Caras[3].Points[4] := Point3D(x+6, y-6, z+6);

  Cube.Caras[3].Color := clGreen;
  //Bottom Blue
  Cube.Caras[4].Points[1] := Point3D(x-6, y+6, z+6);
  Cube.Caras[4].Points[2] := Point3D(x-6, y+6, z-6);
  Cube.Caras[4].Points[3] := Point3D(x+6, y+6, z-6);
  Cube.Caras[4].Points[4] := Point3D(x+6, y+6, z+6);

  Cube.Caras[4].Color := clBlue;
  //Right Orange
  Cube.Caras[5].Points[1] := Point3D(x+6, y-6, z-6);
  Cube.Caras[5].Points[2] := Point3D(x+6, y+6, z-6);
  Cube.Caras[5].Points[3] := Point3D(x+6, y+6, z+6);
  Cube.Caras[5].Points[4] := Point3D(x+6, y-6, z+6);

  Cube.Caras[5].Color := clOlive;
  //Left Red
  Cube.Caras[6].Points[1] := Point3D(x-6, y-6, z-6);
  Cube.Caras[6].Points[2] := Point3D(x-6, y+6, z-6);
  Cube.Caras[6].Points[3] := Point3D(x-6, y+6, z+6);
  Cube.Caras[6].Points[4] := Point3D(x-6, y-6, z+6);
  Cube.Caras[6].Color := clRed;

  case cubie of
    1:
    begin
      Cube.Caras[1].Visible := True; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := True; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := True; //Left
    end;

    2:
    begin
      Cube.Caras[1].Visible := True; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := True; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    3:
    begin
      Cube.Caras[1].Visible := True; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := True; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := True; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    4:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := True; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := True; //Left
    end;

    5:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := True; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    6:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := True; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := True; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    7:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := True; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := True; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := True; //Left
    end;

    8:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := True; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := True; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    9:
    begin

      Cube.Caras[1].Visible := True; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := True; //Bottom
      Cube.Caras[5].Visible := True; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    10:
    begin
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := True; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := True; //Left
    end;

    11:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := True; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    12:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := True; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := True; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    13:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := True; //Left
    end;

    14:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    15:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := True; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    16:
    begin
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := True; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := True; //Left
    end;

    17:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := True; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    18:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := False; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := True; //Bottom
      Cube.Caras[5].Visible := True; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    //Tercera Capa
    19:
    begin
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := True; //Back
      Cube.Caras[3].Visible := True; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := True; //Left
    end;

    20:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := True; //Back
      Cube.Caras[3].Visible := True; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    21:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := True; //Back
      Cube.Caras[3].Visible := True; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := True; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    22:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := True; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := True; //Left
    end;

    23:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := True; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    24:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := True; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := False; //Bottom
      Cube.Caras[5].Visible := True; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    25:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := True; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := True; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := True; //Left
    end;

    26:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := True; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := True; //Bottom
      Cube.Caras[5].Visible := False; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

    27:
    begin
    //Esquina blanca verde y roja
      Cube.Caras[1].Visible := False; //Front
      Cube.Caras[2].Visible := True; //Back
      Cube.Caras[3].Visible := False; //Top
      Cube.Caras[4].Visible := True; //Bottom
      Cube.Caras[5].Visible := True; //Right
      Cube.Caras[6].Visible := False; //Left
    end;

  end;

end;

//Starts the entire Rubiks Cube
procedure StartRubik();
var
  i,j,k,n,l: Integer;
  //x,y,z: Real;
  //OutputFile, OutputFile2: TextFile;
begin

    Xaxis := Vector3D(1,0,0);
    Yaxis := Vector3D(0,1,0);
    Zaxis := Vector3D(0,0,1);

    StartCubie(Rubik.Cubes[1], -12, -12, -12, 1);
    StartCubie(Rubik.Cubes[2],  0, -12, -12, 2);
    StartCubie(Rubik.Cubes[3], 12, -12, -12, 3);
    StartCubie(Rubik.Cubes[4], -12,   0, -12, 4);
    StartCubie(Rubik.Cubes[5],  0,   0, -12, 5);
    StartCubie(Rubik.Cubes[6], 12,   0, -12, 6);
    StartCubie(Rubik.Cubes[7], -12,  12, -12, 7);
    StartCubie(Rubik.Cubes[8], 0,  12, -12, 8);
    StartCubie(Rubik.Cubes[9], 12,  12, -12, 9);


    StartCubie(Rubik.Cubes[10], -12, -12,  0, 10);
    StartCubie(Rubik.Cubes[11], 0, -12,  0, 11);
    StartCubie(Rubik.Cubes[12], 12, -12,  0, 12); //This one
    StartCubie(Rubik.Cubes[13], -12,   0,  0, 13);
    StartCubie(Rubik.Cubes[14], 0, 0, 0, 14);
    StartCubie(Rubik.Cubes[15], 12,   0,  0, 15);
    StartCubie(Rubik.Cubes[16], -12,  12,  0, 16);
    StartCubie(Rubik.Cubes[17],  0,  12,  0, 17);
    StartCubie(Rubik.Cubes[18], 12,  12,  0, 18);

    StartCubie(Rubik.Cubes[19], -12, -12, 12, 19);
    StartCubie(Rubik.Cubes[20],  0, -12, 12, 20);
    StartCubie(Rubik.Cubes[21], 12, -12, 12, 21);
    StartCubie(Rubik.Cubes[22], -12,   0, 12, 22);
    StartCubie(Rubik.Cubes[23], 0,   0, 12, 23);
    StartCubie(Rubik.Cubes[24], 12,   0, 12, 24);
    StartCubie(Rubik.Cubes[25], -12,  12, 12, 25);
    StartCubie(Rubik.Cubes[26], 0,  12, 12, 26);
    StartCubie(Rubik.Cubes[27], 12,  12, 12, 27);

    n := 1; // Initialize index for Rubik.VisibleFaces array
    for i := 1 to 27 do
    begin
      for j := 1 to 6 do
      begin
        if Rubik.Cubes[i].Caras[j].Visible then
        begin
          // Save visible face to Rubik.VisibleFaces array
          Rubik.VisibleFaces[n] := Rubik.Cubes[i].Caras[j];
          Inc(n); // Increment the index for the next visible face
        end;
      end;
    end;

    //Initialize Layer
    //Front Layers
    for i := 1 to 3 do
    begin
      for j := 1 to 3 do
      begin
        Rubik.FrontLayer[i,j] := 1 + (j-1) + 3*(i-1);
        Rubik.MidFLayer[i,j] := 10 + (j-1) + 3*(i-1);
        Rubik.BackLayer[i,j] := 19 + (j-1) + 3*(i-1);
      end;
    end;

    //Vertical Layers
    for i := 1 to 3 do
    begin
      for j := 1 to 3 do
      begin
        Rubik.LeftLayer[i,j] := 19- 9*(j-1) + 3*(i-1);
        Rubik.MidVLayer[i,j] := 20- 9*(j-1) + 3*(i-1);
        Rubik.RightLayer[i,j] := 21- 9*(j-1) + 3*(i-1);
      end;
    end;

    //Horizontal Layers
    for i := 1 to 3 do
    begin
      for j := 1 to 3 do
      begin
        Rubik.TopLayer[i,j] := 19- 9*(i-1) + (j-1);
        Rubik.MidHLayer[i,j] := 22- 9*(i-1) + (j-1);
        Rubik.BottomLayer[i,j] := 25- 9*(i-1) + (j-1);
      end;
    end;

end;

//Order Planes
procedure OrderRubik();
var
  i, j, temp: Integer;
  xAux, yAux, zAux, auxDist: Real;
  Distance: array[1..56] of Real;
begin
  // Loop through each visible face
  for i := 1 to 56 do
  begin
    // Calculate midpoint of the face
    xAux := (Rubik.VisibleFaces[i].Points[1].x + Rubik.VisibleFaces[i].Points[3].x) / 2.0;
    yAux := (Rubik.VisibleFaces[i].Points[1].y + Rubik.VisibleFaces[i].Points[3].y) / 2.0;
    zAux := ((Rubik.VisibleFaces[i].Points[1].z + Rubik.VisibleFaces[i].Points[3].z) / 2.0) + EyeToObj;

    // Calculate distance to observer and store it in the Distance array
    Distance[i] := Sqrt((xAux * xAux) + (yAux * yAux) + (zAux * zAux));

    // Store the face index for sorting
    Order[i] := i;
  end;

  // Bubble sort to sort faces based on distance in descending order
  for i := 1 to 55 do
  begin
    for j := 1 to 55 - i do
    begin
      if Distance[j] < Distance[j + 1] then
      begin
        // Swap distances
        auxDist := Distance[j];
        Distance[j] := Distance[j + 1];
        Distance[j + 1] := auxDist;

        // Swap face indices
        temp := Order[j];
        Order[j] := Order[j + 1];
        Order[j + 1] := temp;
      end;
    end;
  end;

end;

//Perspective
procedure Perspective(x, y, z: Real; var xP, yP: Integer);
  var
    zAux: Real;
  begin
    zAux := EyeToObj + z;
    xP := Round((EyeToScreen * x) / zAux * 200) + XPantalla;
    yP := Round((EyeToScreen * y) / zAux * 200) + YPantalla;
end;

//Draw the entirety of the Rubiks Cube
procedure DrawRubik();
var
  i, j,n, a: Integer;
  OutputFile: TextFile;
begin
  //Clear the canvas
  Form4.Image1.Canvas.Brush.Color := clWhite;
  Form4.Image1.Canvas.FillRect(Rect(0, 0, Form4.Image1.Width, Form4.Image1.Height));

  n := 1; // Initialize index for Rubik.VisibleFaces array
    for i := 1 to 27 do
    begin
      for j := 1 to 6 do
      begin
        if Rubik.Cubes[i].Caras[j].Visible then
        begin
          // Save visible face to Rubik.VisibleFaces array
          Rubik.VisibleFaces[n] := Rubik.Cubes[i].Caras[j];
          Inc(n); // Increment the index for the next visible face
        end;
      end;
    end;

   //Order visible faces
  OrderRubik();

  for i := 1 to 56 do
    begin
      a := Order[i];
      for j := 1 to 4 do
      begin
        Perspective(Rubik.VisibleFaces[a].Points[j].x, Rubik.VisibleFaces[a].Points[j].y, Rubik.VisibleFaces[a].Points[j].z, CaraPant[j].X, CaraPant[j].Y);
      end;
      Form4.Image1.Canvas.Brush.Color := Rubik.VisibleFaces[a].Color;
      Form4.Image1.Canvas.Polygon(CaraPant);
    end;
end;


//Order Cubie planes
procedure OrderCube(Cubie: TCubie);
var
  i, j, auxOrden: Integer;
  xAux, yAux, zAux, auxDistance: Real;
  Distance: array[1..6] of Real;
begin
  // Calculate midpoint and distance to the observer for each face
  for i := 1 to 6 do
  begin
    OrderCubie[i] := i;
    xAux := (Cubie.Caras[i].Points[1].x + Cubie.Caras[i].Points[3].x) / 2.0;
    yAux := (Cubie.Caras[i].Points[1].y + Cubie.Caras[i].Points[3].y) / 2.0;
    zAux := ((Cubie.Caras[i].Points[1].z + Cubie.Caras[i].Points[3].z) / 2.0) + EyeToObj;
    Distance[i] := Sqrt((xAux * xAux) + (yAux * yAux) + (zAux * zAux));
  end;

  // Bubble sort to sort faces based on distance
  for i := 1 to 6 do
    for j := 1 to 6 - 1 do
      if (Distance[j] < Distance[j + 1]) then
      begin
        auxDistance := Distance[j];
        auxOrden := OrderCubie[j];
        Distance[j] := Distance[j + 1];
        OrderCubie[j] := OrderCubie[j + 1];
        Distance[j + 1] := auxDistance;
        OrderCubie[j + 1] := auxOrden;
      end;
end;

//Draw Cubie
procedure DrawCubie(Cubie: TCubie);
var
  f,l,n: Integer;
begin
  //Clear the canvas
  Form4.Image1.Canvas.Brush.Color := clWhite;
  Form4.Image1.Canvas.FillRect(Rect(0, 0, Form4.Image1.Width, Form4.Image1.Height));
  for f := 1 to 6 do
    begin
      OrderCube(Cubie);
      n := OrderCubie[f];
      for l := 1 to 4 do
        Perspective(Cubie.Caras[n].Points[l].x, Cubie.Caras[n].Points[l].y, Cubie.Caras[n].Points[l].z, CaraPant[l].X, CaraPant[l].Y);
      Form4.Image1.Canvas.Brush.Color := Cubie.Caras[n].Color; // Set face color
      Form4.Image1.Canvas.Polygon(CaraPant); // Draw face
    end;
end;
//Rotations of the whole Cube-----------------------------------------------------------------------
procedure RotateCubie(var Cubie: TCubie; angle: Real; axis: TVector3D);
var
  i, j: Integer;
  sinA, cosA: Real;
  crossProd: TVector3D;
  dotProd: Real;
  newPoint: TVector3D;
begin
  // Translate cubie to origin and calculate sine and cosine of the angle
  sinA := Sin(angle);
  cosA := Cos(angle);

  for i := 1 to 6 do
  begin
    for j := 1 to 4 do
    begin
      // Convert Point3D to Vector3D
      newPoint := Vector3D(Cubie.Caras[i].Points[j].x, Cubie.Caras[i].Points[j].y, Cubie.Caras[i].Points[j].z);
      dotProd := DotProduct(newPoint, axis);
      crossProd := CrossProduct(newPoint, axis);

      // Apply Rodrigues' rotation formula
      newPoint.x := newPoint.x * (cosA) +
                    crossProd.x * (sinA) +
                    axis.x * dotProd * (1 - cosA);

      newPoint.y := newPoint.y * (cosA) +
                    crossProd.y * (sinA) +
                    axis.y * dotProd * (1 - cosA);

      newPoint.z := newPoint.z * (cosA) +
                    crossProd.z * (sinA) +
                    axis.z * dotProd * (1 - cosA);

      // Update the point coordinates
      Cubie.Caras[i].Points[j].x := newPoint.x;
      Cubie.Caras[i].Points[j].y := newPoint.y;
      Cubie.Caras[i].Points[j].z := newPoint.z;
    end;
  end;



end;


// Update the axes after cube rotation
procedure UpdateAxesAfterCubeRotation(axis: TVector3D; angle: Real);
var
  sinA, cosA: Real;
  crossProd: TVector3D;
  dotProd: Real;

begin

  sinA := sin(angle);
  cosA := cos(angle);
  //X axis
  dotProd := DotProduct(Xaxis, axis);
  crossProd := CrossProduct(Xaxis, axis);

  Xaxis.x := Xaxis.x * cosA +
                    crossProd.x * sinA +
                    axis.x * dotProd * (1 - cosA);

      Xaxis.y := Xaxis.y * cosA +
                    crossProd.y * sinA +
                    axis.y * dotProd * (1 - cosA);

      Xaxis.z := Xaxis.z * cosA +
                    crossProd.z * sinA +
                    axis.z * dotProd * (1 - cosA);
  //Y axis
  dotProd := DotProduct(Yaxis, axis);
  crossProd := CrossProduct(Yaxis, axis);


  Yaxis.x := Yaxis.x * cosA +
                    crossProd.x * sinA +
                    axis.x * dotProd * (1 - cosA);

      Yaxis.y := Yaxis.y * cosA +
                    crossProd.y * sinA +
                    axis.y * dotProd * (1 - cosA);

      Yaxis.z := Yaxis.z * cosA +
                    crossProd.z * sinA +
                    axis.z * dotProd * (1 - cosA);

  //zAXIS
  dotProd := DotProduct(Zaxis, axis);
  crossProd := CrossProduct(Zaxis, axis);

  Zaxis.x := Zaxis.x * cosA +
                    crossProd.x * sinA +
                    axis.x * dotProd * (1 - cosA);

      Zaxis.y := Zaxis.y * cosA +
                    crossProd.y * sinA +
                    axis.y * dotProd * (1 - cosA);

      Zaxis.z := Zaxis.z * cosA +
                    crossProd.z * sinA +
                    axis.z * dotProd * (1 - cosA);

end;

//Matrix Rotation
procedure RotateMatrixCounter(var A: TMatrix);
var
  i, j, temp: Integer;
begin
  // Transpose the matrix
  for i := 1 to 3 do
    for j := i to 3 do
    begin
      temp := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := temp;
    end;

  // Reverse the order of rows
  for i := 1 to 3 do
    for j := 1 to 3 div 2 do
    begin
      temp := A[i,j];
      A[i,j] := A[i, 3 - j + 1];
      A[i,3 - j + 1] := temp;
    end;
end;

procedure RotateMatrixClock(var A: TMatrix);
var
  i, j, temp: Integer;
begin
  // Transpose the matrix
  for i := 1 to 3 do
    for j := i to 3 do
    begin
      temp := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := temp;
    end;

  // Reverse the order of columns
  for j := 1 to 3 do
    for i := 1 to 3 div 2 do
    begin
      temp := A[i,j];
      A[i,j] := A[3 - i + 1,j];
      A[3 - i + 1,j] := temp;
    end;
end;




//Layer Rotation
procedure RotateLayer(Layer: Integer; Dir: Integer);
var
  i,j,k: Integer;
  alpha: real;
  OutputFile: TextFile;
begin
  alpha := (Dir)*((30*Pi) / 180);
  case Layer of
    TopL:
    begin
      for i := 1 to 3 do
      begin
        for k := 1 to 3 do
        begin
          j := Rubik.TopLayer[i,k];
          RotateCubie(Rubik.Cubes[j], alpha, Yaxis);
        end;
      end;

      //Layer Update

      if Dir < 0 then
      begin
        RotateMatrixClock(Rubik.TopLayer);
      end
      else
      begin
        RotateMatrixCounter(Rubik.TopLayer);
      end;

      for i := 1 to 3 do
      begin
        //FrontLayer
        Rubik.FrontLayer[1,i] := Rubik.TopLayer[3,i];
        //LeftLayer
        Rubik.LeftLayer[1,i] := Rubik.TopLayer[i,1];
        //RightLayer
        Rubik.RightLayer[1,i] := Rubik.TopLayer[i,3];
        //MiddleFLayer
        Rubik.MidFLayer[1,i] := Rubik.TopLayer[2,i];
        //BackLayer
        Rubik.BackLayer[1,i] := Rubik.TopLayer[1,i];
        //MiddleVLayer
        Rubik.MidVLayer[1,i] := Rubik.TopLayer[i,2];
      end;

    end;

    MidH:
    begin
      for i := 1 to 3 do
      begin
        for k := 1 to 3 do
        begin
          j := Rubik.MidHLayer[i,k];
          RotateCubie(Rubik.Cubes[j], alpha, Yaxis);
        end;
      end;

      //Layer Update

      if Dir < 0 then
      begin
        RotateMatrixClock(Rubik.MidHLayer);
      end
      else
      begin
        RotateMatrixCounter(Rubik.MidHLayer);
      end;

      for i := 1 to 3 do
      begin
        //FrontLayer
        Rubik.FrontLayer[2,i] := Rubik.MidHLayer[3,i];
        //LeftLayer
        Rubik.LeftLayer[2,i] := Rubik.MidHLayer[i,1];
        //RightLayer
        Rubik.RightLayer[2,i] := Rubik.MidHLayer[i,3];
        //MiddleFLayer
        Rubik.MidFLayer[2,i] := Rubik.MidHLayer[2,i];
        //MiddleVLayer
        Rubik.MidVLayer[2,i] := Rubik.MidHLayer[i,2];
        //BackLayer
        Rubik.BackLayer[2,i] := Rubik.MidHLayer[1,i];

      end;

    end;

    Bottom:
    begin
      for i := 1 to 3 do
      begin
        for k := 1 to 3 do
        begin
          j := Rubik.BottomLayer[i,k];
          RotateCubie(Rubik.Cubes[j], alpha, Yaxis);
        end;
      end;

      //Layer Update

      if Dir < 0 then
      begin
        RotateMatrixClock(Rubik.BottomLayer);
      end
      else
      begin
        RotateMatrixCounter(Rubik.BottomLayer);
      end;

      for i := 1 to 3 do
      begin
        //FrontLayer
        Rubik.FrontLayer[3,i] := Rubik.BottomLayer[3,i];
        //LeftLayer
        Rubik.LeftLayer[3,i] := Rubik.BottomLayer[i,1];
        //RightLayer
        Rubik.RightLayer[3,i] := Rubik.BottomLayer[i,3];
        //MiddleFLayer
        Rubik.MidFLayer[3,i] := Rubik.BottomLayer[2,i];
        //BackLayer
        Rubik.BackLayer[3,i] := Rubik.BottomLayer[1,i];
        //MiddleVLayer
        Rubik.MidVLayer[3,i] := Rubik.BottomLayer[i,2];
      end;
    end;

    LeftL:
    begin
      for i := 1 to 3 do
      begin
        for k := 1 to 3 do
        begin
          j := Rubik.LeftLayer[i,k];
          RotateCubie(Rubik.Cubes[j], alpha, Xaxis);
        end;
      end;


    //Layer Update

      if Dir < 0 then
      begin
        RotateMatrixClock(Rubik.LeftLayer);
      end
      else
      begin
        RotateMatrixCounter(Rubik.LeftLayer);
      end;

      for i := 1 to 3 do
      begin
        //FrontLayer
        Rubik.FrontLayer[i,1] := Rubik.LeftLayer[i,3];
        //BottomLayer
        Rubik.BottomLayer[i,1] := Rubik.LeftLayer[3,i];
        //TopLayer
        Rubik.TopLayer[i,1] := Rubik.LeftLayer[1,i];
        //MiddleFLayer
        Rubik.MidFLayer[i,1] := Rubik.LeftLayer[i,2];
        //BackLayer
        Rubik.BackLayer[i,1] := Rubik.LeftLayer[i,1];
        //MiddleHLayer
        Rubik.MidHLayer[i,1] := Rubik.LeftLayer[2,i];
      end;
    end;

    MidV:
    begin
      for i := 1 to 3 do
      begin
        for k := 1 to 3 do
        begin
          j := Rubik.MidVLayer[i,k];
          RotateCubie(Rubik.Cubes[j], alpha, Xaxis);
        end;
      end;

      //Layer Update

      if Dir < 0 then
      begin
        RotateMatrixClock(Rubik.MidVLayer);
      end
      else
      begin
        RotateMatrixCounter(Rubik.MidVLayer);
      end;

      for i := 1 to 3 do
      begin
        //FrontLayer
        Rubik.FrontLayer[i,2] := Rubik.MidVLayer[i,3];
        //BottomLayer
        Rubik.BottomLayer[i,2] := Rubik.MidVLayer[3,i];
        //TopLayer
        Rubik.TopLayer[i,2] := Rubik.MidVLayer[1,i];
        //MiddleFLayer
        Rubik.MidFLayer[i,2] := Rubik.MidVLayer[i,2];
        //BackLayer
        Rubik.BackLayer[i,2] := Rubik.MidVLayer[i,1];
        //MiddleHLayer
        Rubik.MidHLayer[i,2] := Rubik.MidVLayer[2,i];
      end;
    end;

    Right:
    begin
      for i := 1 to 3 do
      begin
        for k := 1 to 3 do
        begin
          j := Rubik.RightLayer[i,k];
          RotateCubie(Rubik.Cubes[j], alpha, Xaxis);
        end;
      end;
      //Layer Update

      if Dir < 0 then
      begin
        RotateMatrixClock(Rubik.RightLayer);
      end
      else
      begin
        RotateMatrixCounter(Rubik.RightLayer);
      end;

      for i := 1 to 3 do
      begin
        //FrontLayer
        Rubik.FrontLayer[i,3] := Rubik.RightLayer[i,3];
        //BottomLayer
        Rubik.BottomLayer[i,3] := Rubik.RightLayer[3,i];
        //TopLayer
        Rubik.TopLayer[i,3] := Rubik.RightLayer[1,i];
        //MiddleFLayer
        Rubik.MidFLayer[i,3] := Rubik.RightLayer[i,2];
        //BackLayer
        Rubik.BackLayer[i,3] := Rubik.RightLayer[i,1];
        //MiddleHLayer
        Rubik.MidHLayer[i,3] := Rubik.RightLayer[2,i];
      end;
    end;

    Front:
    begin
      for i := 1 to 3 do
      begin
        for k := 1 to 3 do
        begin
          j := Rubik.FrontLayer[i,k];
          RotateCubie(Rubik.Cubes[j], alpha, Zaxis);
        end;
      end;

      //Update faces
      if Dir < 0 then
      begin
        RotateMatrixClock(Rubik.FrontLayer);
      end
      else
      begin
        RotateMatrixCounter(Rubik.FrontLayer);
      end;


      for i := 1 to 3 do
      begin
        //RightLayer
        Rubik.RightLayer[i,3] := Rubik.FrontLayer[i,3];
        //LeftLayer
        Rubik.LeftLayer[i,3] := Rubik.FrontLayer[i,1];
        //TopLayer
        Rubik.TopLayer[3,i] := Rubik.FrontLayer[1,i];
        //MiddleLayer
        Rubik.MidVLayer[i,3] := Rubik.FrontLayer[i,2];
        //BottomLayer
        Rubik.BottomLayer[3,i] := Rubik.FrontLayer[3,i];
        //MiddleLayer
        Rubik.MidHLayer[3,i] := Rubik.FrontLayer[2,i];
      end;
    end;

    MidF:
    begin
      for i := 1 to 3 do
      begin
        for k := 1 to 3 do
        begin
          j := Rubik.MidFLayer[i,k];
          RotateCubie(Rubik.Cubes[j], alpha, Zaxis);
        end;
      end;

      //Update faces
      if Dir < 0 then
      begin
        RotateMatrixClock(Rubik.MidFLayer);
      end
      else
      begin
        RotateMatrixCounter(Rubik.MidFLayer);
      end;


      for i := 1 to 3 do
      begin
        //RightLayer
        Rubik.RightLayer[i,2] := Rubik.MidFLayer[i,3];
        //LeftLayer
        Rubik.LeftLayer[i,2] := Rubik.MidFLayer[i,1];
        //TopLayer
        Rubik.TopLayer[2,i] := Rubik.MidFLayer[1,i];
        //MiddleLayer
        Rubik.MidVLayer[i,2] := Rubik.MidFLayer[i,2];
        //BottomLayer
        Rubik.BottomLayer[2,i] := Rubik.MidFLayer[3,i];
        //MiddleLayer
        Rubik.MidHLayer[2,i] := Rubik.MidFLayer[2,i];
      end;
    end;

    Back:
    begin
      for i := 1 to 3 do
      begin
        for k := 1 to 3 do
        begin
          j := Rubik.BackLayer[i,k];
          RotateCubie(Rubik.Cubes[j], alpha, Zaxis);
        end;
      end;

      //Layer Update

      if Dir < 0 then
      begin
        RotateMatrixClock(Rubik.BackLayer);
      end
      else
      begin
        RotateMatrixCounter(Rubik.BackLayer);
      end;

      for i := 1 to 3 do
      begin
        //RightLayer
        Rubik.RightLayer[i,1] := Rubik.BackLayer[i,3];
        //LeftLayer
        Rubik.LeftLayer[i,1] := Rubik.BackLayer[i,1];
        //TopLayer
        Rubik.TopLayer[1,i] := Rubik.BackLayer[1,i];
        //MiddleLayer
        Rubik.MidVLayer[i,1] := Rubik.BackLayer[i,2];
        //BottomLayer
        Rubik.BottomLayer[1,i] := Rubik.BackLayer[3,i];
        //MiddleLayer
        Rubik.MidHLayer[1,i] := Rubik.BackLayer[2,i];
      end;
    end;

  end;

  DrawRubik();
end;

//Solve
{procedure Solve();
var
  i,j,k: Integer;
begin
  //Initialize Layer
    //Front Layers
    for i := 1 to 3 do
    begin
      for j := 1 to 3 do
      begin
        Rubik.FrontLayer[i,j] := 1 + (j-1) + 3*(i-1);
        Rubik.MidFLayer[i,j] := 10 + (j-1) + 3*(i-1);
        Rubik.BackLayer[i,j] := 19 + (j-1) + 3*(i-1);
        Rubik.TopLayer[i,j] := 19- 9*(i-1) + (j-1);
        Rubik.MidHLayer[i,j] := 22- 9*(i-1) + (j-1);
        Rubik.BottomLayer[i,j] := 25- 9*(i-1) + (j-1);
        Rubik.LeftLayer[i,j] := 19- 9*(j-1) + 3*(i-1);
        Rubik.MidVLayer[i,j] := 20- 9*(j-1) + 3*(i-1);
        Rubik.RightLayer[i,j] := 21- 9*(j-1) + 3*(i-1);
      end;
    end;

    i:=1;
    for j := 1 to 3 do
    begin
      for k := 1 to 3 do
      begin
        Rubik.Cubes[i] := Rubik.Cubes[Rubik.FrontLayer[j,k]];
        Inc(i);
      end;
    end;

    for j := 1 to 3 do
    begin
      for k := 1 to 3 do
      begin
        Rubik.Cubes[i] := Rubik.Cubes[Rubik.MidFLayer[j,k]];
        Inc(i);
      end;
    end;

    for j := 1 to 3 do
    begin
      for k := 1 to 3 do
      begin
        Rubik.Cubes[i] := Rubik.Cubes[Rubik.BottomLayer[j,k]];
        Inc(i);
      end;
    end;

    DrawRubik();


end;}

procedure RotateCube(var Cubie: TCubie; angle: Real; axis: TVector3D);
var
  i, j: Integer;
  sinA, cosA, centerX, centerY, centerZ : Real;
  crossProd: TVector3D;
  dotProd: Real;
  newPoint: TVector3D;
begin

  // Find the center of the cubie
  centerX := 0;
  centerY := 0;
  centerZ := 0;
  for i := 1 to 6 do
    for j := 1 to 4 do
    begin
      centerX := centerX + Cubie.Caras[i].Points[j].x;
      centerY := centerY + Cubie.Caras[i].Points[j].y;
      centerZ := centerZ + Cubie.Caras[i].Points[j].z;
    end;
  centerX := centerX / 24; // Average of x-coordinates of vertices
  centerY := centerY / 24; // Average of y-coordinates of vertices
  centerZ := centerZ / 24; // Average of z-coordinates of vertices

  // Translate cubie to origin
  for i := 1 to 6 do
    for j := 1 to 4 do
    begin
      Cubie.Caras[i].Points[j].x := Cubie.Caras[i].Points[j].x - centerX;
      Cubie.Caras[i].Points[j].y := Cubie.Caras[i].Points[j].y - centerY;
      Cubie.Caras[i].Points[j].z := Cubie.Caras[i].Points[j].z - centerZ;
    end;

  // Calculate sine and cosine of the angle
  sinA := Sin(angle);
  cosA := Cos(angle);

  for i := 1 to 6 do
    for j := 1 to 4 do
    begin
       // Convert Point3D to Vector3D
      newPoint := Vector3D(Cubie.Caras[i].Points[j].x, Cubie.Caras[i].Points[j].y, Cubie.Caras[i].Points[j].z);
      dotProd := DotProduct(newPoint, axis);
      crossProd := CrossProduct(newPoint, axis);

      // Apply Rodrigues' rotation formula
      newPoint.x := newPoint.x * cosA +
                    crossProd.x * sinA +
                    axis.x * dotProd * (1 - cosA);

      newPoint.y := newPoint.y * cosA +
                    crossProd.y * sinA +
                    axis.y * dotProd * (1 - cosA);

      newPoint.z := newPoint.z * cosA +
                    crossProd.z * sinA +
                    axis.z * dotProd * (1 - cosA);


      // Update the point coordinates
      Cubie.Caras[i].Points[j].x := newPoint.x;
      Cubie.Caras[i].Points[j].y := newPoint.y;
      Cubie.Caras[i].Points[j].z := newPoint.z;
    end;

  for i := 1 to 6 do
    for j := 1 to 4 do
    begin
      Cubie.Caras[i].Points[j].x := Cubie.Caras[i].Points[j].x + centerX;
      Cubie.Caras[i].Points[j].y := Cubie.Caras[i].Points[j].y + centerY;
      Cubie.Caras[i].Points[j].z := Cubie.Caras[i].Points[j].z + centerZ;
    end;
end;

//Buttons-------------------------------------------------------
procedure TForm4.Button10Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[10]);
end;

procedure TForm4.Button11Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[11]);
end;

procedure TForm4.Button12Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[12]);
end;

procedure TForm4.Button13Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[13]);
end;

procedure TForm4.Button14Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[14]);
end;


procedure TForm4.Button15Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[15]);
end;

procedure TForm4.Button16Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[16]);
end;

procedure TForm4.Button17Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[17]);
end;

procedure TForm4.Button18Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[18]);
end;

procedure TForm4.Button19Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[19]);
end;

//Draw Rubiks Cube
procedure TForm4.Button1Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[1]);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[2]);
end;

procedure TForm4.Button20Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[20]);
end;

procedure TForm4.Button21Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[21]);
end;

procedure TForm4.Button22Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[22]);
end;

procedure TForm4.Button23Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[23]);
end;

procedure TForm4.Button24Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[24]);
end;

procedure TForm4.Button25Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[25]);
end;

procedure TForm4.Button26Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[26]);
end;

procedure TForm4.Button27Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[27]);
end;

procedure TForm4.Button28Click(Sender: TObject);
begin
  DrawRubik();
end;


//Rotar X+
procedure TForm4.Button29Click(Sender: TObject);
var
  i: Integer;
begin
  alpha := -((5*Pi) / 180);
  UpdateAxesAfterCubeRotation(Vector3D(1,0,0), alpha);
  // Rotate each cubie around the center of the Rubik's Cube
  for i := 1 to 27 do
    begin
        RotateCubie(Rubik.Cubes[i], alpha, Vector3D(1,0,0));
    end;

  // Redraw the Rubik's Cube
  DrawRubik();
end;



//Rotate X-
procedure TForm4.Button30Click(Sender: TObject);
var
  i: Integer;
begin
  alpha := ((5*Pi) / 180);
  UpdateAxesAfterCubeRotation(Vector3D(1,0,0), alpha);
  // Rotate each cubie around the center of the Rubik's Cube
  for i := 1 to 27 do
    begin
        RotateCubie(Rubik.Cubes[i], alpha, Vector3D(1,0,0));
    end;

  // Redraw the Rubik's Cube
  DrawRubik();
end;

//Rotate Y+
procedure TForm4.Button31Click(Sender: TObject);
var
  i: Integer;
begin
  alpha := -((5*Pi) / 180);
  UpdateAxesAfterCubeRotation(Vector3D(0,1,0), alpha);
  // Rotate each cubie around the center of the Rubik's Cube
  for i := 1 to 27 do
    begin
        RotateCubie(Rubik.Cubes[i], alpha, Vector3D(0,1,0));
    end;

  // Redraw the Rubik's Cube
  DrawRubik();
end;

//Rotate Y-
procedure TForm4.Button32Click(Sender: TObject);
var
  i: Integer;
begin
  alpha := ((5*Pi) / 180);
  UpdateAxesAfterCubeRotation(Vector3D(0,1,0), alpha);
  // Rotate each cubie around the center of the Rubik's Cube
  for i := 1 to 27 do
    begin
        RotateCubie(Rubik.Cubes[i], alpha, Vector3D(0,1,0));
    end;

  // Redraw the Rubik's Cube
  DrawRubik();
end;

//Rotate Z+
procedure TForm4.Button33Click(Sender: TObject);
var
  i: Integer;
begin
  alpha := -((5*Pi) / 180);
  UpdateAxesAfterCubeRotation(Vector3D(0,0,1), alpha);
  // Rotate each cubie around the center of the Rubik's Cube
  for i := 1 to 27 do
    begin
        RotateCubie(Rubik.Cubes[i], alpha, Vector3D(0,0,1));
    end;

  // Redraw the Rubik's Cube
  DrawRubik();
end;

//Rotate Z-
procedure TForm4.Button34Click(Sender: TObject);
var
  i: Integer;
begin
  alpha := ((5*Pi) / 180);
  UpdateAxesAfterCubeRotation(Vector3D(0,0,1), alpha);
  // Rotate each cubie around the center of the Rubik's Cube
  for i := 1 to 27 do
    begin
        RotateCubie(Rubik.Cubes[i], alpha, Vector3D(0,0,1));
    end;

  // Redraw the Rubik's Cube
  DrawRubik();
end;

//Rotate Front Clockwise
procedure TForm4.Button35Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := FrontClock;

end;

//Rotate Front CounterClockwise
procedure TForm4.Button36Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := FrontCounter;
end;

//Rotate Right Clock
procedure TForm4.Button37Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := RightClock;
end;

//Rotate Right Counter
procedure TForm4.Button38Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := RightCounter;
end;

//Rotate Top Clock
procedure TForm4.Button39Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := TopClock;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[3]);
end;

//Top Counter
procedure TForm4.Button40Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := TopCounter;
end;

//Middle Front Clock
procedure TForm4.Button41Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := MidFClock;
end;

//Middle Vertical Clock
procedure TForm4.Button42Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := MidVClock;
end;

//Middle Horizontal Clock
procedure TForm4.Button43Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := MidHClock;
end;

//Middle Front Counter
procedure TForm4.Button44Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := MidFCounter;
end;

//Middle Vertical Counter
procedure TForm4.Button45Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := MidVCounter;
end;

//Middle Horizontal Counter
procedure TForm4.Button46Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := MidHCounter;
end;

//Bottom Clock
procedure TForm4.Button47Click(Sender: TObject);
begin
rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := BottomClock;
end;

//Left Clock
procedure TForm4.Button48Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := LeftClock;
end;

//Back Clock
procedure TForm4.Button49Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := BackClock;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[4]);
end;

procedure TForm4.Button50Click(Sender: TObject);
begin
  StartRubik();
  DrawRubik();
end;

//Back Counter
procedure TForm4.Button51Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := BackCounter;
end;

//Left Counter
procedure TForm4.Button52Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := LeftCounter;
end;

//Bottom Counter
procedure TForm4.Button53Click(Sender: TObject);
begin
  rep := 0;
  Timer1.Interval := 200; // Set interval to 1 second
  Timer1.Enabled := True; // Start the timer
  LayerR := BottomCounter;
end;


//Rotate Cubie on X+
procedure TForm4.Button54Click(Sender: TObject);
var
  cube: Integer;
begin
  alpha := -((5*Pi) / 180);
  cube := StrToInt(Edit1.Text);
  RotateCube(Rubik.Cubes[cube],alpha, Xaxis);
  DrawRubik();
end;

//Rotate Cubie X-
procedure TForm4.Button55Click(Sender: TObject);
var
  cube: Integer;
begin
  alpha := ((5*Pi) / 180);
  cube := StrToInt(Edit1.Text);
  RotateCube(Rubik.Cubes[cube],alpha, Xaxis);
  DrawRubik();
end;

procedure TForm4.Button56Click(Sender: TObject);
var
  cube: Integer;
begin
  alpha := -((5*Pi) / 180);
  cube := StrToInt(Edit1.Text);
  RotateCube(Rubik.Cubes[cube],alpha, Yaxis);
  DrawRubik();
end;

procedure TForm4.Button57Click(Sender: TObject);
var
  cube: Integer;
begin
  alpha := ((5*Pi) / 180);
  cube := StrToInt(Edit1.Text);
  RotateCube(Rubik.Cubes[cube],alpha, Yaxis);
  DrawRubik();
end;

procedure TForm4.Button58Click(Sender: TObject);
var
  cube: Integer;
begin
  alpha := -((5*Pi) / 180);
  cube := StrToInt(Edit1.Text);
  RotateCube(Rubik.Cubes[cube],alpha, Zaxis);
  DrawRubik();
end;

procedure TForm4.Button59Click(Sender: TObject);
var
  cube: Integer;
begin
  alpha := ((5*Pi) / 180);
  cube := StrToInt(Edit1.Text);
  RotateCube(Rubik.Cubes[cube],alpha, Zaxis);
  DrawRubik();
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[5]);
end;

procedure TForm4.Button6Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[6]);
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[7]);
end;

procedure TForm4.Button8Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[8]);
end;

procedure TForm4.Button9Click(Sender: TObject);
begin
  DrawCubie(Rubik.Cubes[9]);
end;

//Form is created
procedure TForm4.FormCreate(Sender: TObject);
begin
  XPantalla := 200;
  YPantalla := 200;
  EyeToObj := 300.0;
  EyeToScreen := 5;
  StartRubik();

end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  if rep < 3 then // Check if we've rotated three times
  begin
    case LayerR of

      FrontClock:
      begin
        RotateLayer(Front, -1); // Rotate the cube
      end;
      FrontCounter:
      begin
        RotateLayer(Front, 1); // Rotate the cube
      end;

      RightClock:
      begin
        RotateLayer(Right, -1);
      end;
      RightCounter:
      begin
        RotateLayer(Right, 1);
      end;

      TopClock:
      begin
        RotateLayer(TopL, -1);
      end;

      TopCounter:
      begin
        RotateLayer(TopL, 1);
      end;

      MidFClock:
      begin
        RotateLayer(MidF, -1);
      end;
      MidFCounter:
      begin
        RotateLayer(MidF, 1);
      end;

      MidHClock:
      begin
        RotateLayer(MidH, -1);
      end;
      MidHCounter:
      begin
        RotateLayer(MidH, 1);
      end;

      MidVClock:
      begin
        RotateLayer(MidV, -1);
      end;
      MidVCounter:
      begin
        RotateLayer(MidV, 1);
      end;

      BottomClock:
      begin
        RotateLayer(Bottom, -1);
      end;
      BottomCounter:
      begin
        RotateLayer(Bottom, 1);
      end;

      LeftClock:
      begin
        RotateLayer(LeftL, -1);
      end;
      LeftCounter:
      begin
        RotateLayer(LeftL, 1);
      end;

      BackClock:
      begin
        RotateLayer(Back, -1);
      end;
      BackCounter:
      begin
        RotateLayer(Back, 1);
      end;

    end;

    Inc(rep); // Increment the rotation count
  end
  else
  begin
    Timer1.Enabled := False; // Stop the timer after three rotations
  end;
end;

end.
