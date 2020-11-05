function varargout = begin(varargin)
% BEGIN MATLAB code for begin.fig
%      BEGIN, by itself, creates a new BEGIN or raises the existing
%      singleton*.
%
%      H = BEGIN returns the handle to a new BEGIN or the handle to
%      the existing singleton*.
%
%      BEGIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEGIN.M with the given input arguments.
%
%      BEGIN('Property','Value',...) creates a new BEGIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before begin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to begin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help begin

% Last Modified by GUIDE v2.5 08-Dec-2019 00:05:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @begin_OpeningFcn, ...
                   'gui_OutputFcn',  @begin_OutputFcn, ...
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


% --- Executes just before begin is made visible.
function begin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to begin (see VARARGIN)

% Choose default command line output for begin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes begin wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes2)
matlabImage = imread('image.png');
image(matlabImage)
axis off
axis image

% --- Outputs from this function are returned to the command line.
function varargout = begin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Random.
function Random_Callback(hObject, eventdata, handles)
% hObject    handle to Random (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignII


% --- Executes on button press in input.
function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assign


% --- Executes on button press in read.
function read_Callback(hObject, eventdata, handles)
% hObject    handle to read (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignIII
