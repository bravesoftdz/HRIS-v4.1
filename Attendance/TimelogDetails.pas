unit TimelogDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Timelog, CollapsiblePanelUtils,
  System.ImageList, Vcl.ImgList;

type
  TfrmTimelogDetails = class(TfrmBasePopup)
    lblDate: TRzLabel;
    pnlOfficelog: TRzPanel;
    pnlOfficeLogHead: TRzPanel;
    RzLabel4: TRzLabel;
    imgOfficelog: TImage;
    pnlUndertime: TRzPanel;
    pnlUndertimeHead: TRzPanel;
    RzLabel2: TRzLabel;
    imgUndertime: TImage;
    pnlLeaves: TRzPanel;
    pnlLeavesHead: TRzPanel;
    RzLabel5: TRzLabel;
    imgLeaves: TImage;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    lblInAm: TRzLabel;
    lblOutAM: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    lblOutPM: TRzLabel;
    lblInPM: TRzLabel;
    lblHolidayWarning: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    lblUTTimeUntilAM: TRzLabel;
    lblUTTimeFromAM: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    lblUTTimeUntilPM: TRzLabel;
    lblUTTimeFromPM: TRzLabel;
    RzLabel3: TRzLabel;
    lblUTTimeReasonAM: TRzLabel;
    RzLabel16: TRzLabel;
    lblUTTimeReasonPM: TRzLabel;
    RzLabel15: TRzLabel;
    lblOvInAm: TRzLabel;
    lblOvOutAM: TRzLabel;
    lblOvInPm: TRzLabel;
    lblOvOutPm: TRzLabel;
    lblOvAmReason: TRzLabel;
    lblOvPmReason: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    lblLvTypeAM: TRzLabel;
    RzLabel23: TRzLabel;
    lblLvRemarksAM: TRzLabel;
    RzLabel25: TRzLabel;
    lblLvTypePM: TRzLabel;
    RzLabel27: TRzLabel;
    lblLvRemarksPM: TRzLabel;
    RzLabel29: TRzLabel;
    lblLvReasonAM: TRzLabel;
    lblLvReasonPM: TRzLabel;
    RzLabel24: TRzLabel;
    lblExpandOfficeLog: TRzLabel;
    lblExpandUndertime: TRzLabel;
    lblExpandLeaves: TRzLabel;
    imageList: TImageList;
    RzLabel22: TRzLabel;
    lblUTAMPaid: TRzLabel;
    RzLabel26: TRzLabel;
    lblUTPMPaid: TRzLabel;
    RzLabel28: TRzLabel;
    lblPaidAM: TRzLabel;
    RzLabel30: TRzLabel;
    lblPaidPM: TRzLabel;
    procedure imgOfficelogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblExpandOfficeLogDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExpandPanel(Sender: TObject; panelState: TPanelState);
    procedure SetCollapsePanelProperties(panel: TRzPanel; image: TImage; var tp: integer); overload;
    procedure SetCollapsePanelProperties(panel: TRzPanel; labl: TRzLabel; var tp: integer); overload;
    procedure SetUnboundControls;
    procedure SetPanelColors;
  public
    { Public declarations }
  end;

var
  frmTimelogDetails: TfrmTimelogDetails;

implementation

{$R *.dfm}

uses
  HRISGlobal, AttendanceUtils, Leave;

procedure TfrmTimelogDetails.SetCollapsePanelProperties(panel: TRzPanel; image: TImage; var tp: integer);
begin
  // panel
  with panel do
  begin
    Left := LEFT_ANCHOR;
    Top  := tp;
    Height := COLLAPSED_HEIGHT;
    Visible := true;
    tp := Top + COLLAPSED_HEIGHT + SPACE;
  end;

  // image
  with image do
  begin
    // imageList.GetBitmap(Integer(psExpand),Picture.Icon);
    image.Picture.Icon := nil;
    imageList.GetIcon(Integer(psExpand), image.Picture.Icon);
    Hint := 'Expand';
    Tag := Integer(psExpand);
  end;
end;

procedure TfrmTimelogDetails.ExpandPanel(Sender: TObject; panelState: TPanelState);
var
  ht, i, tp, sourceTag: integer;
begin
  ht := 0;

  // get the source tag
  if Sender is TImage then sourceTag := (Sender as TImage).Parent.Parent.Tag
  else sourceTag := (Sender as TRzLabel).Parent.Parent.Tag;

  case sourceTag of
    1: ht := 200;
    2: ht := 200;
    3: ht := 200;
  end;

  tp := TOP_ANCHOR;

  for i := 0 to pnlMain.ControlCount - 1 do
  begin
    if pnlMain.Controls[i] is TRzPanel then
    begin
      if (pnlMain.Controls[i] as TRzPanel).Tag = sourceTag then
      begin
        if panelState = psExpand then
        begin
          if Sender is TImage then
          begin
            (Sender as TImage).Parent.Parent.Top := tp;
            (Sender as TImage).Parent.Parent.Height := ht;
            (Sender as TImage).Picture.Icon := nil;
            imageList.GetIcon(0, (Sender as TImage).Picture.Icon);
            (Sender as TImage).Transparent := true;
            // (Sender as TImage).Picture.LoadFromFile(HRIS.AppImagesPath + 'collapse.png');
            (Sender as TImage).Hint := 'Collapse';
            (Sender as TImage).Tag := Integer(psCollapse);
          end
          else
          begin
            (Sender as TRzLabel).Parent.Parent.Top := tp;
            (Sender as TRzLabel).Parent.Parent.Height := ht;
            (Sender as TRzLabel).Caption := '-';
            (Sender as TRzLabel).Hint := 'Collapse';
            (Sender as TRzLabel).Tag := Integer(psCollapse);
          end;
        end
        else
        begin
          if Sender is TImage then
          begin
            (Sender as TImage).Parent.Parent.Height := COLLAPSED_HEIGHT;
            (Sender as TImage).Picture.Icon := nil;
            imageList.GetIcon(1, (Sender as TImage).Picture.Icon);
            (Sender as TImage).Transparent := true;
            // (Sender as TImage).Picture.LoadFromFile(HRIS.AppImagesPath + 'expand.png');
            (Sender as TImage).Hint := 'Expand';
            (Sender as TImage).Tag := Integer(psExpand);
          end
          else
          begin
            (Sender as TRzLabel).Parent.Parent.Height := COLLAPSED_HEIGHT;
            (Sender as TRzLabel).Caption := '+';
            (Sender as TRzLabel).Hint := 'Expand';
            (Sender as TRzLabel).Tag := Integer(psExpand);
          end;
        end;

        if Sender is TImage then
          tp := (Sender as TImage).Parent.Parent.Top + (Sender as TImage).Parent.Parent.Height + SPACE
        else
          tp := (Sender as TRzLabel).Parent.Parent.Top + (Sender as TRzLabel).Parent.Parent.Height + SPACE;
      end
      else
      begin
        if Sender is TImage then
        begin
          case (pnlMain.Controls[i] as TRzPanel).Tag of
            1: SetCollapsePanelProperties(pnlOfficelog,imgOfficelog,tp);
            2: SetCollapsePanelProperties(pnlUndertime,imgUndertime,tp);
            3: SetCollapsePanelProperties(pnlLeaves,imgLeaves,tp);
          end;
        end
        else
        begin
          case (pnlMain.Controls[i] as TRzPanel).Tag of
            1: SetCollapsePanelProperties(pnlOfficelog,lblExpandOfficeLog,tp);
            2: SetCollapsePanelProperties(pnlUndertime,lblExpandUndertime,tp);
            3: SetCollapsePanelProperties(pnlLeaves,lblExpandLeaves,tp);
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmTimelogDetails.SetUnboundControls;
var
  ut: TUndertime;
  ov: TOverride;
  lv: TLeave;
begin
  with tlog do
  begin
    lblDate.Caption := 'Log details for ' + FormatDateTime('mmmm dd, yyyy dddd', tlog.Date);

    // office log
    lblInAm.Caption := TimeInAMFormatted;
    lblOutAm.Caption := TimeOutAMFormatted;
    lblInPm.Caption := TimeInPMFormatted;
    lblOutPm.Caption := TimeOutPMFormatted;

    // override
    if HasOverride then
    begin
      ov := Ovride2[pdMorning];
      if Assigned(ov) then
      begin
        lblOvInAm.Caption := ov.TimeInFormatted;
        lblOvOutAm.Caption := ov.TimeOutFormatted;
        lblOvAMReason.Caption := ov.Reason;
      end;

      ov := Ovride2[pdAfternoon];
      if Assigned(ov) then
      begin
        lblOvInPm.Caption := ov.TimeInFormatted;
        lblOvOutPm.Caption := ov.TimeOutFormatted;
        lblOvPMReason.Caption := ov.Reason;
      end;
    end;

    // undertime
    if HasUndertime then
    begin
      ut := Undertimes2[pdMorning];
      if Assigned(ut) then
      begin
        lblUTTimeFromAM.Caption := ut.TimeFromFormatted;
        lblUTTimeUntilAM.Caption := ut.TimeUntilFormatted;
        lblUTTimeReasonAM.Caption := ut.Reason;
        lblUTAMPaid.Caption := ut.Paid;
      end;

      ut := Undertimes2[pdAfternoon];
      if Assigned(ut) then
      begin
        lblUTTimeFromPM.Caption := ut.TimeFromFormatted;
        lblUTTimeUntilPM.Caption := ut.TimeUntilFormatted;
        lblUTTimeReasonPM.Caption := ut.Reason;
        lblUTPMPaid.Caption := ut.Paid;
      end;
    end;

    // leaves
    if HasLeave then
    begin
      // if leave is whole day
      // populate both morning and after
      lv := Leaves2[pdWholeDay];
      if Assigned(lv) then
      begin
        lblLvTypeAM.Caption := lv.LeaveTypeName;
        lblLvReasonAM.Caption := lv.Reason;
        lblPaidAM.Caption := lv.PaidDescription;
        lblLvRemarksAM.Caption := lv.Remarks;

        lblLvTypePM.Caption := lv.LeaveTypeName;
        lblLvReasonPM.Caption := lv.Reason;
        lblPaidPM.Caption := lv.PaidDescription;
        lblLvRemarksPM.Caption := lv.Remarks;
      end
      else
      begin
        lv := Leaves2[pdMorning];
        if Assigned(lv) then
        begin
          lblLvTypeAM.Caption := lv.LeaveTypeName;
          lblLvReasonAM.Caption := lv.Reason;
          lblPaidAM.Caption := lv.PaidDescription;
          lblLvRemarksAM.Caption := lv.Remarks;
        end;

        lv := Leaves2[pdAfternoon];
        if Assigned(lv) then
        begin
          lblLvTypePM.Caption := lv.LeaveTypeName;
          lblLvReasonPM.Caption := lv.Reason;
          lblPaidPM.Caption := lv.PaidDescription;
          lblLvRemarksPM.Caption := lv.Remarks;
        end;
      end;
    end;

    // holiday
    if IsHoliday then
      if Holiday.IsNational then
        lblHolidayWarning.Caption :=
                'Note: This date is a national holiday (' + Holiday.Name + ').'
      else
        lblHolidayWarning.Caption :=
                'Note: This date is a local holiday (' + Holiday.Name + ').';

    lblHolidayWarning.Visible := IsHoliday;
  end;
end;

procedure TfrmTimelogDetails.SetCollapsePanelProperties(panel: TRzPanel;
  labl: TRzLabel; var tp: integer);
begin
  // panel
  with panel do
  begin
    Left := LEFT_ANCHOR;
    Top  := tp;
    Height := COLLAPSED_HEIGHT;
    Visible := true;
    tp := Top + COLLAPSED_HEIGHT + SPACE;
  end;

  // image
  with labl do
  begin
    labl.Caption := '+';
    Hint := 'Expand';
    Tag := Integer(psExpand);
  end;
end;

procedure TfrmTimelogDetails.SetPanelColors;
var
  enabledColor1, enabledColor2, disabledColor1, disabledColor2: TColor;
begin
  // changes tab colors depending on information availability
  // light blue (transparent) no info is found
  enabledColor1 := $00845F3E; // $0086603E;
  enabledColor2 := $00845F3E; // $00A98867;

  disabledColor1 := $00E3D9CE; // $00C5AE98;
  disabledColor2 := $00E3D9CE; // $00CAB59F;

  // office log
  if (tlog.NoLog) and (not tlog.HasOverride) then
  begin
    pnlOfficeLogHead.GradientColorStart := disabledColor1;
    pnlOfficeLogHead.GradientColorStop := disabledColor2;
  end
  else
  begin
    pnlOfficeLogHead.GradientColorStart := enabledColor1;
    pnlOfficeLogHead.GradientColorStop := enabledColor2;
  end;

  // undertime
  if not tlog.HasUndertime then
  begin
    pnlUndertimeHead.GradientColorStart := disabledColor1;
    pnlUndertimeHead.GradientColorStop := disabledColor2;
  end
  else
  begin
    pnlUndertimeHead.GradientColorStart := enabledColor1;
    pnlUndertimeHead.GradientColorStop := enabledColor2;
  end;

  // leaves
  if not tlog.HasLeave then
  begin
    pnlLeavesHead.GradientColorStart := disabledColor1;
    pnlLeavesHead.GradientColorStop := disabledColor2;
  end
  else
  begin
    pnlLeavesHead.GradientColorStart := enabledColor1;
    pnlLeavesHead.GradientColorStop := enabledColor2;
  end;

  pnlOfficeLogHead.Enabled := not tlog.NoLog;
  pnlUndertimeHead.Enabled := tlog.HasUndertime;
  pnlLeavesHead.Enabled := tlog.HasLeave;
end;

procedure TfrmTimelogDetails.FormCreate(Sender: TObject);
begin
  SetUnboundControls;
  SetPanelColors;

  // expand panel
  if (not tlog.NoLog) or (tlog.HasOverride) then imgOfficelog.OnClick(imgOfficelog) // lblExpandOfficeLog.OnClick(lblExpandOfficeLog)
  else if tlog.HasUndertime then imgUndertime.OnClick(imgUndertime) // lblExpandUndertime.OnClick(lblExpandUndertime)
  else if tlog.HasLeave then imgLeaves.OnClick(imgLeaves); // lblExpandLeaves.OnClick(lblExpandLeaves);

end;

procedure TfrmTimelogDetails.imgOfficelogClick(Sender: TObject);
var
  sndr: TObject;

  procedure FindExpandImage;
  var
    i: integer;
  begin
    for i := 0 to (Sender as TRzPanel).ControlCount - 1 do
      if (Sender as TRzPanel).Controls[i] is TImage then
        sndr := (Sender as TRzPanel).Controls[i];
  end;

begin
  if Sender is TRzPanel then FindExpandImage
  else sndr := Sender;

  ExpandPanel(sndr,TPanelState((sndr as TImage).Tag));
end;

procedure TfrmTimelogDetails.lblExpandOfficeLogDblClick(Sender: TObject);
var
  sndr: TObject;

  procedure FindExpandLabel;
  var
    i: integer;
  begin
    for i := 0 to (Sender as TRzPanel).ControlCount - 1 do
      if (Sender as TRzPanel).Controls[i] is TRzLabel then
        sndr := (Sender as TRzPanel).Controls[i];
  end;

begin
  if Sender is TRzPanel then FindExpandLabel
  else sndr := Sender;

  ExpandPanel(sndr,TPanelState((sndr as TRzLabel).Tag));
end;

end.
