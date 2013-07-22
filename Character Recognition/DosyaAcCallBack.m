function varargout = DosyaAcCallBack(varargin)
% DOSYAACCALLBACK MATLAB code for DosyaAcCallBack.fig
%      DOSYAACCALLBACK, by itself, creates a new DOSYAACCALLBACK or raises the existing
%      singleton*.
%
%      H = DOSYAACCALLBACK returns the handle to a new DOSYAACCALLBACK or the handle to
%      the existing singleton*.
%
%      DOSYAACCALLBACK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DOSYAACCALLBACK.M with the given input arguments.
%
%      DOSYAACCALLBACK('Property','Value',...) creates a new DOSYAACCALLBACK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DosyaAcCallBack_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DosyaAcCallBack_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DosyaAcCallBack

% Last Modified by GUIDE v2.5 11-Jun-2013 23:59:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DosyaAcCallBack_OpeningFcn, ...
                   'gui_OutputFcn',  @DosyaAcCallBack_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DosyaAcCallBack is made visible.
function DosyaAcCallBack_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DosyaAcCallBack (see VARARGIN)

% Choose default command line output for DosyaAcCallBack

% Update handles structure

guidata(hObject, handles);

% UIWAIT makes DosyaAcCallBack wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DosyaAcCallBack_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
guidata(hObject, handles);


% --- Executes on button press in btn_bul.
function btn_bul_Callback(hObject, eventdata, handles)
% hObject    handle to btn_bul (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%[filename, pathname] = uigetfile('*.jpg', 'Select a image');
%if isequal(filename,0)
   %disp('User selected Cancel')
%else
   %disp(['User selected ', fullfile(pathname, filename)])
%end
%global filename;
%global resimalt;
%[ans,pathname]=uigetfile({'*.jpg';'*.jpeg';'*.png';},'Bir resim se�iniz');
%img=imread([pathname ans]);
%display(size(img));
%img= imresize(img,[1300,1200]);
%mesaj=strcat(pathname,[pathname ans]);%iki mesaj? yatay olarak birle?tirmede kullan?l?r
%mesajalt=[pathname ans];
%img=rgb2gray(img);
%%img=imresize(img,[250 250]);      
%axes(handles.axes1);
%imshow(img);
%resimalt=img;

%filename=uigetdir('C:\','Se�');
%set(handles.edit1,'String',filename)
global dosyayolu
[dosyayolu,pathname]=uigetfile({'*.jpg';'*.jpeg';'*.png';},'Bir resim se�iniz')
img=imread([pathname dosyayolu]);
display(size(img));
set(handles.edit1,'String',[pathname dosyayolu])
%HarfTani(get(handles.edit1,'String'));
guidata(hObject, handles);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global dosyayolu
resim=set(handles.edit1,'String',dosyayolu);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_KarakterTani.
function btn_KarakterTani_Callback(hObject, eventdata, handles)
% hObject    handle to btn_KarakterTani (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
pathname =uigetdir(matlabroot,'MATLAB Root Directory');
KarakterEgitim(pathname);
testpathname=uigetdir('C:\');
Karaktertest(testpathname);


% --- Executes on button press in btn_HarfTani.
function btn_HarfTani_Callback(hObject, eventdata, handles)
% hObject    handle to btn_HarfTani (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
harfpath=get(handles.edit1,'String');
load('YSA.mat');
HarfMatris=zeros(2500,1);
harf=imread(harfpath);
harf=imresize(harf,[50,50]);   
   harf=rgb2gray(harf);
   harf=edge(harf,'sobel');
    harf=double(harf);
     harf=reshape(harf,2500,1);
     HarfMatris(:,1)=harf;
   YSA_Harf=sim(net,HarfMatris);
%harfsonuc=xlsread('Test\harfsonuc.xlsx','Sayfa1');


 enbuyuk=max(YSA_Harf(:))
     [rowsOfMaxes colsOfMaxes] = find(YSA_Harf == enbuyuk);
     
     if(rowsOfMaxes==1)        
        set(handles.text3,'String','O');
     end
     if(rowsOfMaxes==2)
        set(handles.text3,'String','S');
     end
     if(rowsOfMaxes==3)
        set(handles.text3,'String','T');
     end
     if(rowsOfMaxes==4)
        set(handles.text3,'String','X');
     end
