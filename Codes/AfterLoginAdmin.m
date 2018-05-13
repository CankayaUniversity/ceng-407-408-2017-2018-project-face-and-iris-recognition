function varargout = AfterLoginAdmin(varargin)
% AFTERLOGINADMIN MATLAB code for AfterLoginAdmin.fig
%      AFTERLOGINADMIN, by itself, creates a new AFTERLOGINADMIN or raises the existing
%      singleton*.
%
%      H = AFTERLOGINADMIN returns the handle to a new AFTERLOGINADMIN or the handle to
%      the existing singleton*.
%
%      AFTERLOGINADMIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AFTERLOGINADMIN.M with the given input arguments.
%
%      AFTERLOGINADMIN('Property','Value',...) creates a new AFTERLOGINADMIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AfterLoginAdmin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AfterLoginAdmin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AfterLoginAdmin

% Last Modified by GUIDE v2.5 13-May-2018 23:14:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AfterLoginAdmin_OpeningFcn, ...
                   'gui_OutputFcn',  @AfterLoginAdmin_OutputFcn, ...
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


% --- Executes just before AfterLoginAdmin is made visible.
function AfterLoginAdmin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AfterLoginAdmin (see VARARGIN)

% Choose default command line output for AfterLoginAdmin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AfterLoginAdmin wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AfterLoginAdmin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fileName = get(handles.edit2,'String');
imageNumber = get(handles.edit3,'String');

fp1 = get(handles.edit4,'String');
imNum = str2num(imageNumber); 
for z = 0:999
z
if z<10
    fileName = strcat('00',int2str(z));
elseif z>99
    fileName = strcat(int2str(z));
else
    fileName = strcat('0',int2str(z));
end

vek = zeros(86,171);  %106,211

try
    
for i = 0:(imNum-1)
%fp1 = 'C:\Users\eurus\Desktop\IrisRec\dbs\';
filepath = strcat(fp1,fileName,'\');
n2 = int2str(i);
n3 = '.jpg';
n4 = strcat(filepath,'S6',fileName,'S0',n2,n3);
im = imread(n4);
e = edge(im, 'canny');
radii = 40:1:65;  %50,60  :110, 110 
h = circle_hough(e, radii, 'same', 'normalise');
%figure, imshow(im)
peaks = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);

%hold on;
for peak1 = peaks
    [x, y] = circlepoints(peak1(3));
    %plot(x+peak1(1), y+peak1(2), 'g-');
end

radii = 85:1:112;  %50,60  :110, 110 
h = circle_hough(e, radii, 'same', 'normalise');
peaks = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);
for peak2 = peaks
    [x, y] = circlepoints(peak2(3));
    %plot(x+peak2(1), y+peak2(2), 'g-');
end
%%peak2(3)
pc1 = peak1(1);
pc2 = peak1(2);
pr = peak1(3);

c1 = peak2(1);
c2 = peak2(2);
r = peak2(3);

pa = ones(2*r+1,2*r+1);

pa1 = getnhood(strel('disk',pr,0));
for j = 1:pr*2
    for k = 1:pr*2
        
        if pa1(j,k) == 0
            pa1(j,k) = 1;
        else
            pa1(j,k) = 0;
        end
    end
end

%%imshow(pa1);
pa(r-pr:r+pr,r-pr:r+pr) = pa1;
%%im2 = rgb2gray(im);


a1 = im(c2-r:c2+r,c1-r:c1+r);

a2 = getnhood(strel('disk',r,0));
%%imshow(a1);
%%a5 =
a21 = uint8(a2);
a3 = a21 .* a1;
pa2 = uint8(pa);
a5 = a3 .* pa2;
a4 = a5(r:2*r,:);
last = a4(1:86,1:171);
%%imshow(pa)
%figure, imshow(a4);
%%figure, imshow(a4)
%fftB = fft(last);
vek = vek + angle(fftshift(fft(last)));
end
vek = vek/imNum;
load user.mat;
userCount = userCount + 1;
wp1 = get(handles.edit5,'String');  %C:\Users\eurus\Desktop\IrisRec\dbm\
imn1 = int2str(userCount);
save user.mat userCount;
wpath = strcat(wp1,imn1,'\phase.txt');
wpmk = strcat(wp1,imn1);
mkdir(wpmk);
%imwrite(vek,wpath);
dlmwrite(wpath,vek);
catch
    load user.mat;
    userCount = userCount + 1;
    save user.mat userCount;
end

end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fileName = get(handles.edit2,'String');
imageNumber = get(handles.edit3,'String');
fp1 = get(handles.edit4,'String');
imNum = str2num(imageNumber); 
for i = 0:(imNum-1)
%fp1 = 'C:\Users\eurus\Desktop\IrisRec\dbs\';
filepath = strcat(fp1,fileName,'\');
n2 = int2str(i);
n3 = '.jpg';
n4 = strcat(filepath,'S6',fileName,'S0',n2,n3);
im = imread(n4);
e = edge(im, 'canny');
radii = 40:1:65;  %50,60  :110, 110 
h = circle_hough(e, radii, 'same', 'normalise');
%figure, imshow(im)
peaks = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);

%hold on;
for peak1 = peaks
    [x, y] = circlepoints(peak1(3));
    %plot(x+peak1(1), y+peak1(2), 'g-');
end

radii = 85:1:112;  %50,60  :110, 110 
h = circle_hough(e, radii, 'same', 'normalise');
peaks = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);
for peak2 = peaks
    [x, y] = circlepoints(peak2(3));
    %plot(x+peak2(1), y+peak2(2), 'g-');
end
%%peak2(3)
pc1 = peak1(1);
pc2 = peak1(2);
pr = peak1(3);

c1 = peak2(1);
c2 = peak2(2);
r = peak2(3);

pa = ones(2*r+1,2*r+1);

pa1 = getnhood(strel('disk',pr,0));
for j = 1:pr*2
    for k = 1:pr*2
        
        if pa1(j,k) == 0
            pa1(j,k) = 1;
        else
            pa1(j,k) = 0;
        end
    end
end

%%imshow(pa1);
pa(r-pr:r+pr,r-pr:r+pr) = pa1;
%%im2 = rgb2gray(im);


a1 = im(c2-r:c2+r,c1-r:c1+r);

a2 = getnhood(strel('disk',r,0));
%%imshow(a1);
%%a5 =
a21 = uint8(a2);
a3 = a21 .* a1;
pa2 = uint8(pa);
a5 = a3 .* pa2;
a4 = a5(r:2*r,:);
last = a4(1:86,1:171);
%%imshow(pa)
%figure, imshow(a4);
%%figure, imshow(a4)
%fftB = fft(last);
vek = vek + angle(fftshift(fft(last)));
end
vek = vek/imNum;
load user.mat;
userCount = userCount + 1;
wp1 = get(handles.edit5,'String');
imn1 = int2str(userCount);
save user.mat userCount;
wpath = strcat(wp1,imn1,'\phase.txt');
wpmk = strcat(wp1,imn1);
mkdir(wpmk);
%imwrite(vek,wpath);
dlmwrite(wpath,vek);
load user.mat;
userCount = userCount + 1;
save user.mat userCount;



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
