function varargout = assign3(varargin)
%ASSIGN3 MATLAB code file for assign3.fig
%      ASSIGN3, by itself, creates a new ASSIGN3 or raises the existing
%      singleton*.
%
%      H = ASSIGN3 returns the handle to a new ASSIGN3 or the handle to
%      the existing singleton*.
%
%      ASSIGN3('Property','Value',...) creates a new ASSIGN3 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to assign3_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ASSIGN3('CALLBACK') and ASSIGN3('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ASSIGN3.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assign3

% Last Modified by GUIDE v2.5 08-Dec-2019 15:42:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @assign3_OpeningFcn, ...
                   'gui_OutputFcn',  @assign3_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before assign3 is made visible.
function assign3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for assign3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assign3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assign3_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function Button_Callback(hObject, eventdata, handles)
% hObject    handle to Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    [filename, pathname] = uigetfile({'*.txt'},'File Selector');
    if ~ischar(filename)
        return; 
    end
    file = fullfile(pathname, filename);
    [fid, msg] = fopen(file, 'r');
    if fid == -1
        error(msg);
    end
    
    A = fscanf(fid, '%d %d %d %d %d\n', [5, inf]);
    fclose(fid);
    
    A = transpose(A)
    
    Ag = zeros(4,4);
    bg = zeros(4,1);
      
    Ag = A(:,1:4);
    bg = A(:,5);
    
    tic;
    [Ag,bg] = guassjordan_spark1( Ag, bg );
    [Ag,bg] = guassjordan_spark2( Ag, bg )
    t1 = toc;
    
    tic;
    A_out = gauss_jordan(A)
    t2 = toc;
    
    productW = A_out(1,5);
    productX = A_out(2,5);
    productY = A_out(3,5);
    productZ = A_out(4,5);
    
    productW2 = bg(1);
    productX2 = bg(2);
    productY2 = bg(3);
    productZ2 = bg(4);
    
    set(handles.w1,'string',round(A(1,1)*100)/100);
    set(handles.x1,'string',round(A(1,2)*100)/100);
    set(handles.y1,'string',round(A(1,3)*100)/100);
    set(handles.z1,'string',round(A(1,4)*100)/100);
    set(handles.b1,'string',round(A(1,5)*100)/100);
    
    set(handles.w2,'string',round(A(2,1)*100)/100);
    set(handles.x2,'string',round(A(2,2)*100)/100);
    set(handles.y2,'string',round(A(2,3)*100)/100);
    set(handles.z2,'string',round(A(2,4)*100)/100);
    set(handles.b2,'string',round(A(2,5)*100)/100);
    
    set(handles.w3,'string',round(A(3,1)*100)/100);
    set(handles.x3,'string',round(A(3,2)*100)/100);
    set(handles.y3,'string',round(A(3,3)*100)/100);
    set(handles.z3,'string',round(A(3,4)*100)/100);
    set(handles.b3,'string',round(A(3,5)*100)/100);
    
    set(handles.w4,'string',round(A(4,1)*100)/100);
    set(handles.x4,'string',round(A(4,2)*100)/100);
    set(handles.y4,'string',round(A(4,3)*100)/100);
    set(handles.z4,'string',round(A(4,4)*100)/100);
    set(handles.b4,'string',round(A(4,5)*100)/100);
    
    set(handles.productW,'string',round(productW*100)/100);
    set(handles.productX,'string',round(productX*100)/100);
    set(handles.productY,'string',round(productY*100)/100);
    set(handles.productZ,'string',round(productZ*100)/100);
    
    set(handles.productW2,'string',round(productW2*100)/100);
    set(handles.productX2,'string',round(productX2*100)/100);
    set(handles.productY2,'string',round(productY2*100)/100);
    set(handles.productZ2,'string',round(productZ2*100)/100);
    
    set(handles.timeS,'string',t1);
    set(handles.timeL,'string',t2);


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
begin
