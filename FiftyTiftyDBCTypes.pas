unit FiftyTiftyDBCTypes;

interface

type

  ArrayFixedUint16 = array[0..15] of FixedUInt; //64 bytes in size
  ArrayMatrix4Byte16 = array[0..15, 0..3] of Byte; //64 bytes in size

  DBCHeader = record //20 bytes in size
    WDBC : FixedUInt;
    RecordCount : FixedUInt;
    FieldCount : FixedUInt;
    RecordSize : FixedUInt;
    StringBlockSize : FixedUInt;
  end;

  IntBand = record //136 bytes in size
    EntryID : FixedUInt;
    NumberOfEntries : FixedUInt;
    TimeArray : ArrayFixedUint16;
    ColorArray : ArrayMatrix4Byte16;
  end;

  ptrIntBand = ^IntBand;

implementation

end.
