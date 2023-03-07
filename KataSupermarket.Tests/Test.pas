unit Test;

// Interface
interface

uses
  DUnitX.TestFramework;

type
  TOffertaMele = record
    quantita: integer;
    sconto: integer;
  end;

  TRegistratore = class
  private
    FTotale: Integer;
    FTotaleMele: Integer;
  public
    constructor create;
    procedure scansiona (const Prodotto: string); overload;
    procedure scansiona (const Prodotto: string; Quantita: Integer); overload;
    function totale: integer;
    procedure applicaSconti;
  end;

  [TestFixture]
  Setup = class
  public
    // Sample Methods
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Simple single Test
    [Test]
    procedure UnaMelaCosta50Centesimi;
    [Test]
    procedure UnaPeraCosta30Centesimi;
    [Test]
    procedure UnAnanasCosta220Centesimi;
    [Test]
    procedure UnaBananaCosta60Centesimi;
    [Test]
    procedure DuePereCostano60Centesimi;
    [Test]
    procedure DueMeleCostano100CentesimiConScansioneSeparate;
    [Test]
    procedure DuePereCostano60CentesimiConScansioneSeparate;
    [Test]
    procedure DueBananeCostano120CentesimiConScansioniSeparate;
    [Test]
    procedure DueAnanasCostano440CentesimiConScansioniSeparate;
    [Test]
    procedure TreMeleCostano130Anziche150;
  end;


//Implementation
implementation

uses
  System.SysUtils;

procedure Setup.DueAnanasCostano440CentesimiConScansioniSeparate;
var
  registratore: TRegistratore;
  risultatoAtteso, totale: Integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 440;
    registratore.scansiona('pineapple');
    registratore.scansiona('pineapple');
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;
end;

procedure Setup.DueBananeCostano120CentesimiConScansioniSeparate;
var
  registratore: TRegistratore;
  risultatoAtteso, totale: Integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 120;
    registratore.scansiona('banana');
    registratore.scansiona('banana');
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;
end;

procedure Setup.DueMeleCostano100CentesimiConScansioneSeparate;
var
  registratore: TRegistratore;
  risultatoAtteso, totale: Integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 100;
    registratore.scansiona('apple');
    registratore.scansiona('apple');
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;
end;

procedure Setup.DuePereCostano60Centesimi;
var
  registratore: TRegistratore;
  risultatoAtteso, totale: Integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 60;
    registratore.scansiona('pear', 2);
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;
end;

procedure Setup.DuePereCostano60CentesimiConScansioneSeparate;
var
  registratore: TRegistratore;
  risultatoAtteso, totale: Integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 60;
    registratore.scansiona('pear');
    registratore.scansiona('pear');
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;
end;

procedure Setup.Setup;
begin
end;

procedure Setup.TearDown;
begin
end;

procedure Setup.TreMeleCostano130Anziche150;
var
  registratore: TRegistratore;
  risultatoAtteso, totale: Integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 130;
    registratore.scansiona('apple', 3);
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;
end;

procedure Setup.UnaBananaCosta60Centesimi;
var
  registratore: TRegistratore;
  totale: integer;
  risultatoAtteso : integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 60;
    registratore.scansiona('banana');
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;

end;

procedure Setup.UnaMelaCosta50Centesimi;
var
  registratore: TRegistratore;
  totale: integer;
  risultatoAtteso : integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 50;
    registratore.scansiona('apple');
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;
end;

procedure Setup.UnAnanasCosta220Centesimi;
var
  registratore: TRegistratore;
  totale: integer;
  risultatoAtteso : integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 220;
    registratore.scansiona('pineapple');
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;
end;

procedure Setup.UnaPeraCosta30Centesimi;
var
  registratore: TRegistratore;
  totale: integer;
  risultatoAtteso : integer;
begin
  registratore := TRegistratore.Create;
  try
    risultatoAtteso := 30;
    registratore.scansiona('pear');
    totale := registratore.totale;
    Assert.AreEqual(risultatoAtteso,totale);
  finally
    registratore.free;
  end;
end;

{ TRegistratore }

procedure TRegistratore.scansiona(const Prodotto: string);
begin
  if ( Prodotto='apple') then
    FTotale := FTotale + 50
  else if ( Prodotto='pineapple') then
    FTotale := FTotale + 220
  else if ( Prodotto='banana') then
    FTotale := FTotale + 60
  else if ( Prodotto='pear') then
    FTotale := FTotale + 30
  else
    raise Exception.Create('Prodotto non gestito');
end;

procedure TRegistratore.applicaSconti;
var
  LOffertaMele: TOffertaMele;
begin
  LOffertaMele.quantita := 3;
  LOffertaMele.sconto := 20;

  if FTotaleMele = LOffertaMele.quantita then
    FTotale := FTotale - LOffertaMele.sconto;
end;

constructor TRegistratore.create;
begin
  FTotale :=0;
end;

procedure TRegistratore.scansiona(const Prodotto: string; Quantita: Integer);
begin
  if Prodotto = 'apple' then
    FTotaleMele := Quantita;

  Scansiona(Prodotto);
  FTotale := FTotale * Quantita;

  applicaSconti;
end;

function TRegistratore.totale: integer;
begin
  result := FTotale;
end;

initialization
  TDUnitX.RegisterTestFixture(Setup);

end.
