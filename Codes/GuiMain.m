function varargout = GuiMain(varargin)

% GUIMAIN MATLAB code for GuiMain.fig
%      GUIMAIN, by itself, creates a new GUIMAIN or raises the existing
%      singleton*.
%
%      H = GUIMAIN returns the handle to a new GUIMAIN or the handle to
%      the existing singleton*.
%
%      GUIMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIMAIN.M with the given input arguments.
%
%      GUIMAIN('Property','Value',...) creates a new GUIMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GuiMain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GuiMain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GuiMain

% Last Modified by GUIDE v2.5 27-May-2018 13:18:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GuiMain_OpeningFcn, ...
                   'gui_OutputFcn',  @GuiMain_OutputFcn, ...
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


% --- Executes just before GuiMain is made visible.
function GuiMain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GuiMain (see VARARGIN)

% Choose default command line output for GuiMain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GuiMain wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GuiMain_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

GuiAdmin;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnIrisPhase.
function btnIrisPhase_Callback(hObject, eventdata, handles)
% hObject    handle to btnIrisPhase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear;
clc;
%resim seçme
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
image = strcat(pathname, filename);

im = imread(image);
%im = histeq(im1);

name = '';
%Tanýnacak resmi iþleme
e = edge(im, 'canny');
radii = 40:1:65;  %kucuk circle ýn min max capý
h = circle_hough(e, radii, 'same', 'normalise');
figure, imshow(im)
peak11 = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);
hold on;
for peak = peak11
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end
pNumber = 50;
radii = 85:1:112; % buyuk circle ýn min ve max capý
h = circle_hough(e, radii, 'same', 'normalise');
peak22 = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', pNumber);

    X = [peak22(1,1),peak22(2,1);peak11(1),peak11(2)];
    dist = pdist(X,'euclidean');
    min = dist;
    rPeak = [peak22(1,1);peak22(2,1);peak22(3,1)];
for pk = 2:pNumber
    X = [peak22(1,pk),peak22(2,pk);peak11(1),peak11(2)];
    dist = pdist(X,'euclidean');
    if(dist < min)
        min = dist;
        rPeak = [peak22(1,pk);peak22(2,pk);peak22(3,pk)];
    end
end
for peak = rPeak
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end


pc1 = peak11(1);
pc2 = peak11(2);
pr = peak11(3);

c1 = rPeak(1);
c2 = rPeak(2);
r = rPeak(3);

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

pa(r-pr:r+pr,r-pr:r+pr) = pa1;
a1 = im(c2-r:c2+r,c1-r:c1+r);
a2 = getnhood(strel('disk',r,0));
a21 = uint8(a2);
a3 = a21 .* a1;
pa2 = uint8(pa);
a5 = a3 .* pa2;
a4 = a5(r:2*r,:);
last = a4(1:86,1:171);
phUser = angle(fftshift(fft2(double(last))));

load phaseUser.mat
max=0;

load dbPhase.mat;

for i=1:phaseCount  
   phasepath = strcat(dbPhasePath,'\',int2str(i),'\sample.txt');
   
   phase = dlmread(phasepath);
   
 
   Sum = phUser .* phase;
   Sum = sum(Sum);
   Sum = sum(Sum);
   if max < Sum
       max = Sum;
       name = int2str(i);
   end
   
end

name
found = imread(strcat(dbPhasePath,'\',name,'\1.jpg'));
figure, imshow(found);
% --- Executes on button press in btnIrisPM.
function btnIrisPM_Callback(hObject, eventdata, handles)
% hObject    handle to btnIrisPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear;
clc;
%resim seçme
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
image = strcat(pathname, filename);

im = imread(image);
%im = histeq(im1);

name = '';
%Tanýnacak resmi iþleme
e = edge(im, 'canny');
radii = 40:1:65;  %kucuk circle ýn min max capý
h = circle_hough(e, radii, 'same', 'normalise');
figure, imshow(im)
peak11 = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);
hold on;
for peak = peak11
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end
pNumber = 50;
radii = 85:1:112; % buyuk circle ýn min ve max capý
h = circle_hough(e, radii, 'same', 'normalise');
peak22 = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', pNumber);

    X = [peak22(1,1),peak22(2,1);peak11(1),peak11(2)];
    dist = pdist(X,'euclidean');
    min = dist;
    rPeak = [peak22(1,1);peak22(2,1);peak22(3,1)];
for pk = 2:pNumber
    X = [peak22(1,pk),peak22(2,pk);peak11(1),peak11(2)];
    dist = pdist(X,'euclidean');
    if(dist < min)
        min = dist;
        rPeak = [peak22(1,pk);peak22(2,pk);peak22(3,pk)];
    end
end
for peak = rPeak
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end


pc1 = peak11(1);
pc2 = peak11(2);
pr = peak11(3);

c1 = rPeak(1);
c2 = rPeak(2);
r = rPeak(3);

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

pa(r-pr:r+pr,r-pr:r+pr) = pa1;
a1 = im(c2-r:c2+r,c1-r:c1+r);
a2 = getnhood(strel('disk',r,0));
a21 = uint8(a2);
a3 = a21 .* a1;
pa2 = uint8(pa);
a5 = a3 .* pa2;
a4 = a5(r:2*r,:);
last = a4(1:86,1:171);
phUser = fft2(double(last));

load pmUser.mat;
max=0;

load dbPM.mat;

for i=1:pmCount 
   phasepath = strcat(dbPMPath,'\',int2str(i),'\sample.txt');
   
   phase = dlmread(phasepath);
   
 
   Sum = phUser .* phase;
   Sum = sum(Sum);
   Sum = sum(Sum);
   if max < Sum
       max = Sum;
       name = int2str(i);
   end
   
end

name
found = imread(strcat(dbPMPath,'\',name,'\1.jpg'));
figure, imshow(found);

% --- Executes on button press in btnFaceRec.
function btnFaceRec_Callback(hObject, eventdata, handles)
% hObject    handle to btnFaceRec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load dbFace.mat;
datapath = dbFace;
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
givenImage = strcat(pathname, filename);

resutImage = facerecog(datapath,givenImage);
resultPath = strcat(datapath,'\',resutImage);
showResultImage = imread(resultPath);
imshow(showResultImage);
title('Result Image');
showGivenImage = imread(givenImage);
figure,imshow(showGivenImage);
title('Given Image');

result = strcat('the result image is : ',resutImage);
disp(result);


% --- Executes on button press in btnIrisPCA.
function btnIrisPCA_Callback(hObject, eventdata, handles)
% hObject    handle to btnIrisPCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


load dbIrisPCA.mat;
datapath = dbPCA;
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
givenImage = strcat(pathname, filename);

resutImage = irisPCA(datapath,givenImage);
resultPath = strcat(datapath,'\',resutImage);
showResultImage = imread(resultPath);
imshow(showResultImage);
title('Result Image');
showGivenImage = imread(givenImage);
figure,imshow(showGivenImage);
title('Given Image');

result = strcat('the result image is : ',resutImage);
disp(result);
