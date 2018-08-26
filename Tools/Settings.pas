unit Settings;

interface

uses
  Vcl.Graphics, IniFiles, SysUtils, AppUtil;

type
  TCalendarColours = class
  strict private
    FHoliday: TColor;
    FComplete: TColor;
    FIncomplete: TColor;
    FOverride: TColor;
    FUndertime: TColor;
    FLeave: TColor;
    FBusinessTrip: TColor;
    FSunday: TColor;
    FGridLine: TColor;
  public
    property Holiday: TColor read FHoliday write FHoliday;
    property Complete: TColor read FComplete write FComplete;
    property Incomplete: TColor read FIncomplete write FIncomplete;
    property Ovrride: TColor read FOverride write FOverride;
    property Undertime: TColor read FUndertime write FUndertime;
    property Leave: TColor read FLeave write FLeave;
    property BusinessTrip: TColor read FBusinessTrip write FBusinessTrip;
    property Sunday: TColor read FSunday write FSunday;
    property GridLine: TColor read FGridLine write FGridLine;

    procedure LoadDefaults;
  end;

type
  TSettings = class
  private
    FCalendarColours: TCalendarColours;
  public
    property CalendarColours: TCalendarColours read FCalendarColours write FCalendarColours;

    constructor Create;

    procedure Save;
    procedure Load;
  end;

implementation

{ TSettings }

constructor TSettings.Create;
begin
  FCalendarColours := TCalendarColours.Create;
end;

procedure TSettings.Load;
var
  ini: TIniFile;
  section: string;
begin
  ini := GetIniFile;

  // calendar colours
  section := 'CALENDAR COLORS';
  with CalendarColours do
  begin
    if ini.SectionExists(section) then
    begin
      Holiday := StringToColor(ini.ReadString(section,'Holiday','$00FF972F'));
      Complete := StringToColor(ini.ReadString(section,'Complete','$0054A800'));
      Incomplete := StringToColor(ini.ReadString(section,'Incomplete','$0051FFA8'));
      Ovrride := StringToColor(ini.ReadString(section,'Override',''));
      Undertime := StringToColor(ini.ReadString(section,'Undertime',''));
      Leave := StringToColor(ini.ReadString(section,'Leave',''));
      BusinessTrip := StringToColor(ini.ReadString(section,'Business Trip','$000080FF'));
      Sunday := StringToColor(ini.ReadString(section,'Sunday',''));
      GridLine := StringToColor(ini.ReadString(section,'GridLine','clMenu'));
    end
    else LoadDefaults;
  end;
end;

procedure TSettings.Save;
var
  ini: TIniFile;
  section: string;
begin
  ini := GetIniFile;

  // calendar colours
  section := 'CALENDAR COLORS';
  ini.WriteString(section,'Holiday',ColorToString(FCalendarColours.Holiday));
  ini.WriteString(section,'Complete',ColorToString(FCalendarColours.Complete));
  ini.WriteString(section,'Incomplete',ColorToString(FCalendarColours.Incomplete));
  ini.WriteString(section,'Override',ColorToString(FCalendarColours.Ovrride));
  ini.WriteString(section,'Undertime',ColorToString(FCalendarColours.Undertime));
  ini.WriteString(section,'Leave',ColorToString(FCalendarColours.Leave));
  ini.WriteString(section,'BusinessTrip',ColorToString(FCalendarColours.BusinessTrip));
  ini.WriteString(section,'Sunday',ColorToString(FCalendarColours.Sunday));
  ini.WriteString(section,'GridLine',ColorToString(FCalendarColours.GridLine));
end;

{ TCalendarColours }

procedure TCalendarColours.LoadDefaults;
begin
  FHoliday := $00FF972F;
  FComplete := $0054A800;
  FIncomplete := $0051FFA8;
  FOverride := $000DFFFF;
  FUndertime := $00FF4AA5;
  FLeave := $004242FF;
  FBusinessTrip := $000080FF;
  FSunday := $0054ABAB;
  FGridLine := clMenu;
end;

end.
