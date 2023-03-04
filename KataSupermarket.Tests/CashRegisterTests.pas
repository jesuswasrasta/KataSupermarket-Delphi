unit Test;

// Interface
interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  CashRegisterTests = class
  public
    // Sample Methods
    [CashRegisterTests]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Simple single Test
    [Test]
    procedure SetupIsOK;
  end;


//Implementation
implementation

procedure CashRegisterTests.Setup;
begin
end;

procedure CashRegisterTests.TearDown;
begin
end;

procedure CashRegisterTests.SetupIsOK;
begin
  Assert.Pass();
end;

initialization
  TDUnitX.RegisterTestFixture(CashRegisterTests);

end.
