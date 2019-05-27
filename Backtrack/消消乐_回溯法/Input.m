function varargout = Input(varargin)
% INPUT MATLAB code for Input.fig
%      INPUT, by itself, creates a new INPUT or raises the existing
%      singleton*.
%
%      H = INPUT returns the handle to a new INPUT or the handle to
%      the existing singleton*.
%
%      INPUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INPUT.M with the given input arguments.
%
%      INPUT('Property','Value',...) creates a new INPUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Input_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Input_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Input

% Last Modified by GUIDE v2.5 27-May-2019 02:19:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Input_OpeningFcn, ...
                   'gui_OutputFcn',  @Input_OutputFcn, ...
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


% --- Executes just before Input is made visible.
function Input_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Input (see VARARGIN)

% Choose default command line output for Input
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Input wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Input_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
K =  str2num(get(handles.edit1,'string'));
M =  str2num(get(handles.edit2,'string'));
N =  str2num(get(handles.edit3,'string'));
Step =  str2num(get(handles.edit2,'string'));
[MeanMaxScore,MeanRuntime,StartMatrix,FinalMatrix]=main(K,M,N,Step);
set(handles.text5,'string',num2str(MeanRuntime));
set(handles.text6,'string',num2str(MeanMaxScore));

column = size(StartMatrix,2);
row = size(StartMatrix,1);


for i = 1:row
    for j = 1:column
        axes(handles.axes1);
        t = 0:0.1:2*pi;
        y = -0.5 + i + 0.5 * sin(t);
        x = -0.5 + j + 0.5 * cos(t);
        fd=line(x,y);
%         f1 = ezplot('line(x,y)',[0,column,0,row]);
          
        if StartMatrix(i,j) == 1
            set(fd,'Color','r');
        elseif StartMatrix(i,j) == 2
            set(fd,'Color','y');
        elseif StartMatrix(i,j) == 3
            set(fd,'Color','b');
        elseif StartMatrix(i,j) == 4
            set(fd,'Color','g');
        elseif StartMatrix(i,j) == 0
            set(fd,'Color','w');
        end
        set(fd,'LineWidth',0.5);
        grid on;
    end
end


for i = 1:row
    for j = 1:column
        axes(handles.axes2);
        t = 0:0.1:2*pi;
        y = 0.5 + i + 0.5 * sin(t);
        x = 0.5 + j + 0.5 * cos(t);
        fd=line(x,y);
%         f1 = ezplot(fd,[0,column,0,row]);
        if FinalMatrix(i,j) == 1
            set(fd,'Color','r');
        elseif FinalMatrix(i,j) == 2
            set(fd,'Color','y');
        elseif FinalMatrix(i,j) == 3
            set(fd,'Color','b');
        elseif FinalMatrix(i,j) == 4
            set(fd,'Color','g');
        elseif FinalMatrix(i,j) == 0
            set(fd,'Color','w');
        end
        set(fd,'LineWidth',0.5);
        grid on;
    end
end

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
