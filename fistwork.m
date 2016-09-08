function varargout = fistwork(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fistwork_OpeningFcn, ...
                   'gui_OutputFcn',  @fistwork_OutputFcn, ...
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


% --- Executes just before fistwork is made visible.
function fistwork_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = fistwork_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)



% --------------------------------------------------------------------
function opensteadyfile_Callback(hObject, eventdata, handles)
global originalfile;
filename='长河落日.jpg';
originalfile=imread(filename);
subplot(4,4,1);
imshow(originalfile);
title('直接打开的原图像');
changedfile=imread(originalfile);

% --------------------------------------------------------------------
function imagechange_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function imagegrayprocess_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
%imfinfo(originafile);
changedfile=rgb2gray(originalfile);
subplot(4,4,2);
imshow(changedfile);
title('灰度化后的图像');

% --------------------------------------------------------------------
function imagebinarization_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
changedfile=im2bw(originalfile,0.5);
subplot(4,4,3);
imshow(changedfile);
title('二值化后的图像');

% --------------------------------------------------------------------
function openchoosefile_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
[filename,pathname]=uigetfile('*.jpg','打开图片','');
originalfile=imread(filename);
subplot(4,4,1);
imshow(originalfile);
title('选择的原始图像');
changedfile=imread(originalfile);

% --------------------------------------------------------------------
function savefile_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
imwrite(changedfile,'直接保存的图片.jpg','jpg');

% --------------------------------------------------------------------
function saveasfile_Callback(hObject, eventdata, handles)
global changedfile;
[filename,pathname]=uiputfile('*.jpg','另存为');
if isequal(filename,0)||isequal(pathname,0)
    return;
else
    fpath=fullfile(pathname,filename);
end
imwrite(changedfile,fpath,'jpg');

figure
imshow(changedfile);
title('此图片为刚保存的图像');


% --------------------------------------------------------------------
function imggeometryoperate_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function imagealgebraoperate_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function averagenoisereduce_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
global changedfile1;
changedfile=imnoise(originalfile,'gaussian',0.02);
subplot(4,4,8);
imshow(changedfile);
title('添加噪声后的含噪声图像');
changedfile1=imadd(originalfile,changedfile);
subplot(4,4,9);
imshow(changedfile1);
title('两图相加后的图像');


% --------------------------------------------------------------------
function finitedifferencemethod_Callback(hObject, eventdata, handles)
global originalfile;
global originalfile1;
global changedfile;
[filename,pathname]=uigetfile('*.jpg','打开图片','');
originalfile=imread(filename);
subplot(4,4,10);
imshow(originalfile);
title('需要相减的第一幅图');

[filename,pathname]=uigetfile('*.jpg','打开图片','');
originalfile1=imread(filename);
subplot(4,4,11);
imshow(originalfile1);
title('需要相减的第二幅图');

changedfile=imsubtract(originalfile,originalfile1);
subplot(4,4,12);
imshow(changedfile);
figure
imshow(changedfile);
title('两图相减后的图像');




% --------------------------------------------------------------------
function imagezoom_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
changedfile=imresize(originalfile,0.5,'nearest');
figure,
imshow(changedfile);
title('最邻近插值法');
changedfile=imresize(originalfile,0.5,'bilinear');
figure
imshow(changedfile);
title('双线性插值法');
changedfile=imresize(originalfile,0.5,'bicubic');
figure
imshow(changedfile);
title('双三次插值法');

% --------------------------------------------------------------------
function imagerotate_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
changedfile=imrotate(originalfile,45,'nearest');
subplot(4,4,4);
imshow(changedfile);
title('旋转后的图像');


% --------------------------------------------------------------------
function imagemirror_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function imagereverse_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
[m,n]=size(originalfile);
for i=1:m
    for j=1:n
        changedfile(i,j)=originalfile(m-i+1,n-j+1);
    end
end
subplot(4,4,7);
%figure
imshow(changedfile);
title('反向后的图像');

% --------------------------------------------------------------------
function horizontalmirror_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
[m,n]=size(originalfile);
for i=1:m
    for j=1:n
        changedfile(i,j)=originalfile(i,n-j+1);
    end
end
subplot(4,4,5);
%figure
imshow(changedfile);
title('水平镜像后的图像');


% --------------------------------------------------------------------
function verticalmirror_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
[m,n]=size(originalfile);
for i=1:m
    for j=1:n
        changedfile(i,j)=originalfile(m-i+1,j);
    end
end
subplot(4,4,6);
%figure
imshow(changedfile);
title('垂直镜像后的图像');


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function imageadd_Callback(hObject, eventdata, handles)
global originalfile;
global originalfile1;
global changedfile;
[filename,pathname]=uigetfile('*.jpg','打开图片','');
originalfile=imread(filename);
subplot(4,4,13);
imshow(originalfile);
title('需要相加的第一幅图');

[filename,pathname]=uigetfile('*.jpg','打开图片','');
originalfile1=imread(filename);
subplot(4,4,14);
imshow(originalfile1);
title('需要相加的第二幅图');

changedfile=imadd(originalfile,originalfile1);
subplot(4,4,15);
imshow(changedfile);
figure
imshow(changedfile);
title('两图相加后的图像');


% --------------------------------------------------------------------
function fouriertransform_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function creatimage_Callback(hObject, eventdata, handles)
global originalfile;
originalfile=zeros(256,256);
originalfile(126:130,126:130)=255;
imshow(originalfile);
title('生成都图像');


% --------------------------------------------------------------------
function fastfouriertransform_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
originalfile=zeros(256,256);
originalfile(126:130,126:130)=255;

figure;
subplot(2,2,1);
changedfile=abs(originalfile);
imshow(changedfile);
title('原图像');


changedfile=fft2(abs(originalfile));
subplot(2,2,2);
changedfile=abs(changedfile);
imshow(changedfile,[]);
title('二维快速傅立叶变换后的图像');



changedfile=fft2(abs(originalfile));
changedfile=fftshift(abs(changedfile));
subplot(2,2,3);
changedfile=abs(changedfile);
imshow(changedfile,[]);
title('中心化后的图像');




changedfile=fft2(abs(originalfile));
changedfile=fftshift(abs(changedfile));
changedfile=log(abs(changedfile));
subplot(2,2,4);
changedfile=abs(changedfile);
imshow(changedfile,[]);
title('对数增强后的图像');


% --------------------------------------------------------------------
function comparetowimage_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
originalfile=zeros(256,256);
originalfile(56:200,56:200)=255;

[m,n]=size(originalfile);
for x=1:m
    for y=1:n
        changedfile(x,y)=((-1)^(x+y))*originalfile(x,y);
    end
end
figure;
subplot(1,2,1);
imshow(originalfile);
subplot(1,2,2);
imshow(changedfile);


% --------------------------------------------------------------------
function fouriertransformgraph_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function fastfouriertransformgraph_Callback(hObject, eventdata, handles)
global originalfile;
global changedfile;
originalfile=zeros(256,256);
originalfile(126:130,126:130)=255;

changedfile=abs(originalfile);
n=256;
x=1:n;
y=1:n;
figure;
subplot(2,2,1);
mesh(x,y,changedfile(x,y));
title('原图像的三维网格');


changedfile=fft2(abs(originalfile));
changedfile=abs(changedfile);
n=256;
x=1:n;
y=1:n;
subplot(2,2,2);
mesh(x,y,changedfile(x,y));
title('二维快速傅立叶变换化后的三维网格');


changedfile=fft2(abs(originalfile));
changedfile=fftshift(abs(changedfile)); 
%f=abs(f);
n=256;
x=1:n;
y=1:n;
%figure;
subplot(2,2,3);
mesh(x,y,changedfile(x,y));
title('中心化后的三维网格');

changedfile=fft2(abs(originalfile));
changedfile=fftshift(abs(changedfile)); 
changedfile=abs(changedfile);
changedfile=log(changedfile);
n=256;
x=1:n;
y=1:n;
%figure;
subplot(2,2,4);
mesh(x,y,changedfile(x,y));
title('对数强化后的三维网格');
