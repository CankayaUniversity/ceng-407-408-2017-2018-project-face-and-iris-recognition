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

% Last Modified by GUIDE v2.5 27-May-2018 13:21:33

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


% --- Executes on button press in btnScanDBPhase.
function btnScanDBPhase_Callback(hObject, eventdata, handles)
% hObject    handle to btnScanDBPhase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
%%SCAN DATABASE

userNum = str2num(get(handles.txtUserNumber,'String')); %numberOfPeople that will be read
datapath = uigetdir('select path of training folder'); %choose dbImages
dbPhasePath = uigetdir('select path of folder that will contain db');%choose dbPhase
imNum = str2num(get(handles.txtImageNumber,'String')); %numberOfImages
phaseCount = 0;
save phaseUser.mat phaseCount; %eþleþtirme kýsmýnda kullanmak için
save dbPhase.mat dbPhasePath; %eþleþtirme kýsmýnda kullanmak için

%Databasedeki klasorleri dolasiyor
for z = 1:userNum 

%tum martisler 86 171 (trancate)
vek = zeros(86,171); %to hold average phase. 

datapath1 = strcat(datapath,'\',int2str(z),'\');
    

%klasorun icindeki diger resimleri dolasiyor
for i = 1:imNum
    
datapath2 = strcat(datapath1,int2str(i),'.jpg');

im = imread(datapath2);
%im = histeq(im1); %Enhance Contrast Using Histogram Equalization 

%bizim oluþturduðumuz db için klasör açýyor
%klasorden okuduðu ilk resmi bizim db ye kopyalýyor(eþleþtirme kýsmýnda göstermek için)
if i==1
    load phaseUser.mat;     %phaseCount ýn silinmemesi için
    phaseCount = phaseCount +1 ;
    wpmk = strcat(dbPhasePath,'\',int2str(phaseCount));
    mkdir(wpmk);
    dbp = strcat(dbPhasePath,'\',int2str(phaseCount),'\1.jpg');
    imwrite(im,dbp);
end
e = edge(im, 'canny');

%gözbebeði
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


%50 tane çemberden merkezi gözbebeðine en yakýn olaný bulmak için
%peak22 contains 50 circle,
%peak11 de gözbebeginin merkezi ve çapý var
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

%Bulduðu çemberi çiziyor
for peak = rPeak
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end

%merkezler ve çaplar

pc1 = peak11(1);
pc2 = peak11(2);
pr = peak11(3);

c1 = rPeak(1);  
c2 = rPeak(2);
r = rPeak(3);

%mask part
pa = ones(2*r+1,2*r+1);
pa1 = getnhood(strel('disk',pr,0));
%0 larý bire 1 leri 0 a çevirme
for j = 1:pr*2
    for k = 1:pr*2
        
        if pa1(j,k) == 0
            pa1(j,k) = 1;
        else
            pa1(j,k) = 0;
        end
    end
end

%gözbebeðinin alt tarafýný alma 
pa(r-pr:r+pr,r-pr:r+pr) = pa1;
a1 = im(c2-r:c2+r,c1-r:c1+r);
a2 = getnhood(strel('disk',r,0));
a21 = uint8(a2);
a3 = a21 .* a1;
pa2 = uint8(pa);
a5 = a3 .* pa2;
a4 = a5(r:2*r,:);
last = a4(1:86,1:171);

%fftshift ve angle phase için
%vek phase deðerlerini topluyor
vek = vek + angle(fftshift(fft2(double(last))));

end

%ortalama almak için
vek = vek/imNum;

load phaseUser.mat;
phaseCount = phaseCount + 1;
save phaseUser.mat phaseCount;

%db e phase i yazýyor
dbp1 = strcat(dbPhasePath,'\',int2str(phaseCount),'\sample.txt');
dlmwrite(dbp1,vek);


end

clear;
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



function txtImageNumber_Callback(hObject, eventdata, handles)
% hObject    handle to txtImageNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtImageNumber as text
%        str2double(get(hObject,'String')) returns contents of txtImageNumber as a double


% --- Executes during object creation, after setting all properties.
function txtImageNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtImageNumber (see GCBO)
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


% --- Executes on button press in btnAddUserPhase.
function btnAddUserPhase_Callback(hObject, eventdata, handles)
% hObject    handle to btnAddUserPhase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   

datapath = uigetdir('select path of training folder');

imNum = str2num(get(handles.txtImageNumber,'String'));

load phaseUser.mat;  
load dbPhase.mat;
phaseCount = phaseCount +1 ;

vek = zeros(86,171); 

datapath1 = strcat(datapath,'\');
    


for i = 1:imNum
    
datapath2 = strcat(datapath1,int2str(i),'.jpg');

im = imread(datapath2);

if i==1
    wpmk = strcat(dbPhasePath,'\',int2str(phaseCount));
    mkdir(wpmk);
    dbp = strcat(dbPhasePath,'\',int2str(phaseCount),'\1.jpg');
    imwrite(im,dbp);
end
e = edge(im, 'canny');


radii = 40:1:65;  
h = circle_hough(e, radii, 'same', 'normalise');
figure, imshow(im)
peak11 = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);
hold on;
for peak = peak11
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end

pNumber = 50;
radii = 85:1:112;
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


vek = vek + angle(fftshift(fft2(double(last))));

end


vek = vek/imNum;

load phaseUser.mat;
phaseCount = phaseCount + 1;
save phaseUser.mat phaseCount;


dbp1 = strcat(dbPhasePath,'\',int2str(phaseCount),'\sample.txt');
dlmwrite(dbp1,vek);


clear;

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



function txtUserNumber_Callback(hObject, eventdata, handles)
% hObject    handle to txtUserNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtUserNumber as text
%        str2double(get(hObject,'String')) returns contents of txtUserNumber as a double


% --- Executes during object creation, after setting all properties.
function txtUserNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtUserNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnAddUserPM.
function btnAddUserPM_Callback(hObject, eventdata, handles)
% hObject    handle to btnAddUserPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

datapath = uigetdir('select path of training folder');

imNum = str2num(get(handles.txtImageNumber,'String'));


load pmUser.mat;  
load dbPM.mat;
pmCount = pmCount +1 ;

vek = zeros(86,171); 

datapath1 = strcat(datapath,'\');
    


for i = 1:imNum
    
datapath2 = strcat(datapath1,int2str(i),'.jpg');

im = imread(datapath2);

if i==1
    wpmk = strcat(dbPMPath,'\',int2str(pmCount));
    mkdir(wpmk);
    dbp = strcat(dbPMPath,'\',int2str(pmCount),'\1.jpg');
    imwrite(im,dbp);
end
e = edge(im, 'canny');


radii = 40:1:65;  
h = circle_hough(e, radii, 'same', 'normalise');
figure, imshow(im)
peak11 = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);
hold on;
for peak = peak11
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end

pNumber = 50;
radii = 85:1:112;
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


vek = vek + fft2(double(last));

end


vek = vek/imNum;

load pmUser.mat;
pmCount = pmCount + 1;
save pmUser.mat pmCount;


dbp1 = strcat(dbPMPath,'\',int2str(pmCount),'\sample.txt');
dlmwrite(dbp1,vek);

clear;


% --- Executes on button press in btnScanDBPM.
function btnScanDBPM_Callback(hObject, eventdata, handles)
% hObject    handle to btnScanDBPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


userNum = str2num(get(handles.txtUserNumber,'String'));
datapath = uigetdir('select path of training folder');
dbPMPath = uigetdir('select path of folder that will contain db');
imNum = str2num(get(handles.txtImageNumber,'String'));
pmCount = 0;
save pmUser.mat pmCount; 
save dbPM.mat dbPMPath; 


for z = 1:userNum 


vek = zeros(86,171); 

datapath1 = strcat(datapath,'\',int2str(z),'\');
    


for i = 1:imNum
    
datapath2 = strcat(datapath1,int2str(i),'.jpg');

im = imread(datapath2);

if i==1
    load pmUser.mat;     
    pmCount = pmCount +1 ;
    wpmk = strcat(dbPMPath,'\',int2str(pmCount));
    mkdir(wpmk);
    dbp = strcat(dbPMPath,'\',int2str(pmCount),'\1.jpg');
    imwrite(im,dbp);
end
e = edge(im, 'canny');


radii = 40:1:65;  
h = circle_hough(e, radii, 'same', 'normalise');
figure, imshow(im)
peak11 = circle_houghpeaks(h, radii, 'nhoodxy', 15, 'nhoodr', 21, 'npeaks', 1);
hold on;
for peak = peak11
    [x, y] = circlepoints(peak(3));
    plot(x+peak(1), y+peak(2), 'g-');
end

pNumber = 50;
radii = 85:1:112;
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


vek = vek + fft2(double(last));

end


vek = vek/imNum;

load pmUser.mat;
pmCount = pmCount + 1;
save pmUser.mat pmCount;


dbp1 = strcat(dbPMPath,'\',int2str(pmCount),'\sample.txt');
dlmwrite(dbp1,vek);


end
clear;


% --- Executes on button press in btnFaceAddUser.
function btnFaceAddUser_Callback(hObject, eventdata, handles)
% hObject    handle to btnFaceAddUser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in btnScanDBFace.
function btnScanDBFace_Callback(hObject, eventdata, handles)
% hObject    handle to btnScanDBFace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA

dbFace = uigetdir('select path of training folder');
save dbFace.mat dbFace;


% --- Executes on button press in btnScanPCA.
function btnScanPCA_Callback(hObject, eventdata, handles)
% hObject    handle to btnScanPCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dbPCA = uigetdir('select path of training folder');
save dbIrisPCA.mat dbPCA;

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
