unit FiftyTiftyDBCReader;

interface

uses
System.SysUtils, System.Variants, System.Classes, Dialogs, FiftyTiftyDBCTypes;

function GetHeader(streamDBC: TMemoryStream): DBCHeader;

procedure GetAllIntBands(streamDBC: TMemoryStream; iBeginningOffset, iAddToOffset, iNumEntries: integer; var arrayEntries: array of IntBand);

implementation

  function GetHeader(streamDBC: TMemoryStream): DBCHeader;
  var
    dbcheaderHeader: DBCHeader;

  begin

    streamDBC.Position := 0;
    streamDBC.Read(dbcheaderHeader, SizeOf(DBCHeader)); //DBC file header is always 20 bytes in size
    streamDBC.Position := 0;

    //ShowMessage(IntToStr(dbcheaderHeader.FieldCount));

    Result := dbcheaderHeader;

  end;

  function GetIntBand(streamDBC: TMemoryStream; iOffset: integer): IntBand;
  var
    intbandEntry: IntBand;
  begin

    streamDBC.Position := iOffset;
    streamDBC.Read(intbandEntry, SizeOf(IntBand));

    Result := intbandEntry;

  end;

  procedure GetAllIntBands(streamDBC: TMemoryStream; iBeginningOffset, iAddToOffset, iNumEntries: integer; var arrayEntries: array of IntBand);
  var
    intbandEntry: IntBand;
    iCounter: integer;

  begin

    //ShowMessage('Starting GetIntBand loop');
    for iCounter := 0 to iNumEntries - 1 do begin

      streamDBC.Position := 0;

      if iCounter = 0 then
        intbandEntry := GetIntBand(streamDBC, iBeginningOffset)
      else
        intbandEntry := GetIntBand(streamDBC, iBeginningOffset + (iCounter * iAddToOffset) );

      arrayEntries[iCounter] := intbandEntry;

    end;



  end;

end.
