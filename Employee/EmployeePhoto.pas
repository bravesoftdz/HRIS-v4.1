unit EmployeePhoto;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DXSUtil, DSPack, DirectShow9, BaseForm, Vcl.ExtCtrls,
  Vcl.StdCtrls, RzLabel, Employee, Jpeg, RzButton, RzPanel;

type
  TfrmEmployeePhoto = class(TfrmBase)
    CaptureGraph: TFilterGraph;
    SampleGrabber: TSampleGrabber;
    VideoSourceFilter: TFilter;
    VideoWindow: TVideoWindow;
    EmployeePhoto: TImage;
    ListBox: TListBox;
    ListBox2: TListBox;
    pnlTakePhoto: TRzPanel;
    btnTakePhoto: TRzShapeButton;
    pnlCancel: TRzPanel;
    btnCancel: TRzShapeButton;
    pnlPhoto: TRzPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnTakePhotoClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FEmployee: TEmployee;
    VideoDevice: TSysDevEnum;
    VideoMediaTypes: TEnumMediaType;

    procedure SetImageDevice;
    procedure StartCapture;
    procedure GetSnapshot;
    procedure LoadPhoto;
    procedure CancelPhotoCapture;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AEmployee: TEmployee); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  HRISGlobal;

constructor TfrmEmployeePhoto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmEmployeePhoto.btnCancelClick(Sender: TObject);
begin
  inherited;
  CancelPhotoCapture;
end;

procedure TfrmEmployeePhoto.btnTakePhotoClick(Sender: TObject);
begin
  inherited;
  if VideoWindow.Visible then
  begin
    GetSnapshot;
    CancelPhotoCapture;
    LoadPhoto;
  end
  else
  begin
    ListBox.ItemIndex := 0;
    SetImageDevice;
    VideoWindow.Visible := true;
  end;
end;

procedure TfrmEmployeePhoto.CancelPhotoCapture;
begin
  CaptureGraph.Active := false;
  VideoWindow.Visible := false;
end;

constructor TfrmEmployeePhoto.Create(AOwner: TComponent;
  const AEmployee: TEmployee);
begin
  inherited Create(AOwner);
  FEmployee := AEmployee;
end;

procedure TfrmEmployeePhoto.FormCreate(Sender: TObject);
var
  i: integer;
begin
   VideoDevice := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
   for i := 0 to VideoDevice.CountFilters - 1 do
     ListBox.Items.Add(VideoDevice.Filters[i].FriendlyName);

   VideoMediaTypes := TEnumMediaType.Create;

   LoadPhoto;
end;

procedure TfrmEmployeePhoto.GetSnapshot;
var
  path: string;
  filename: string;
  jpg: TJPEGImage;
begin
  jpg := TJPEGImage.Create;
  try
    path := '';

    SampleGrabber.GetBitmap(EmployeePhoto.Picture.Bitmap);

    path := HRIS.AppImagesPath;

    filename := FEmployee.IdNumber + '.jpg';

    // save file
    if not DirectoryExists(path) then CreateDir(path);

    jpg.CompressionQuality := 50;
    jpg.Assign(EmployeePhoto.Picture.Bitmap);
    jpg.SaveToFile(path + filename);

    VideoWindow.Visible := false;
  finally
    jpg.Free;
  end;
end;

procedure TfrmEmployeePhoto.LoadPhoto;
var
  imageFile: string;
  jpg: TJPEGImage;
begin
  jpg := TJPEGImage.Create;
  try
    imageFile := HRIS.AppImagesPath + FEmployee.IdNumber + '.jpg';

    if FileExists(imageFile) then
    begin
      jpg.LoadFromFile(imageFile);
      EmployeePhoto.Picture.Assign(jpg);
      EmployeePhoto.Visible := true;
    end else EmployeePhoto.Visible := false;
  finally
    jpg.Free;
  end;
end;

procedure TfrmEmployeePhoto.SetImageDevice;
var
 PinList: TPinList;
 i: integer;
begin
  if ListBox.Items.Count = 0 then
  begin
    // lblStatus.Caption := 'No imaging device found.';
    Exit;
  end;

  VideoDevice.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if ListBox.ItemIndex <> -1 then
  begin
    // Set the device which we work with
    VideoSourceFilter.BaseFilter.Moniker := VideoDevice.GetMoniker(ListBox.ItemIndex);
    VideoSourceFilter.FilterGraph := CaptureGraph;
    CaptureGraph.Active := true;
    PinList := DXSUtil.TPinList.Create(VideoSourceFilter as IBaseFilter);
    ListBox2.Clear;
    VideoMediaTypes.Assign(PinList.First);

    // Adding permission to ListBox2, which supports device
    for i := 0 to VideoMediaTypes.Count - 1 do
      ListBox2.Items.Add(VideoMediaTypes.MediaDescription[i]);

    CaptureGraph.Active := false;
    PinList.Free;

    ListBox2.ItemIndex := 0;

    StartCapture;
  end;
end;

procedure TfrmEmployeePhoto.StartCapture;
var
 PinList: TPinList;
 intf: IBaseFilter;
begin
  // Activating graph filter, at this stage the source filter is added to the graph
  CaptureGraph.Active := true;

  // The configuration of the output device
  if VideoSourceFilter.FilterGraph <> nil then
  begin
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    if ListBox2.ItemIndex <> -1 then
    with (PinList.First as IAMStreamConfig) do
      SetFormat(VideoMediaTypes.Items[ListBox2.ItemIndex].AMMediaType^);
    PinList.Free;
  end;

  // now render streams
  with CaptureGraph as IcaptureGraphBuilder2 do
  begin
    // Hooking up a preview video (VideoWindow)
    if VideoSourceFilter.BaseFilter.DataLength > 0 then
      if Supports(VideoSourceFilter,IBaseFilter,intf) then
        if Supports(SampleGrabber,IBaseFilter,intf) then
          if Supports(VideoWindow,IBaseFilter,intf) then
      RenderStream(@PIN_CATEGORY_PREVIEW, nil, VideoSourceFilter as IBaseFilter,
        SampleGrabber as IBaseFilter , VideoWindow as IBaseFilter);
   end;

 //Launch video
 CaptureGraph.Play;
end;

end.
