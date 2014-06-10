function varargout = Main(varargin)
% MAIN MATLAB code for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 10-Jun-2014 06:00:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
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

% Clear all data
%clear all;


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using Main.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles)
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
axes(handles.axes1);
cla;

global_handle = get(handles.pushbutton4, 'UserData');
global_protocols = global_handle.global_protocols;
global_protocols_keys = global_handle.global_protocols_keys;
global_vehi_density = global_handle.global_vehi_density;
global_zor_zof_range = global_handle.global_zor_zof_range;
global_buid_distance = global_handle.global_buid_distance;

popup_sel_index_scenario = get(handles.popupmenu3, 'Value');
scenario_name = '';
scenario_unit = '';
scenario_tag = '';
scenario = [];
switch popup_sel_index_scenario
    case 1
        scenario_name = 'Vehicle Density';
        scenario_unit = ' [vehicles/square kilometers]';
        scenario_tag = 'vehicle_density';
        scenario = global_vehi_density;
    case 2
        scenario_name = 'ZOR/ZOF Range';
        scenario_unit = ' [meters]';
        scenario_tag = 'zor_zof_range';
        scenario = global_zor_zof_range;
    case 3
        scenario_name = 'Building Distance';
        scenario_unit = ' [meters]';
        scenario_tag = 'buiding_distance';
        scenario = global_buid_distance;
end

popup_sel_index_performance_metrics = get(handles.popupmenu4, 'Value');
performance_metrics_name = '';
performance_metrics_unit = '';
all_data=[];
switch popup_sel_index_performance_metrics
    case 1
        performance_metrics_name = 'Delay Time per Hop';
        performance_metrics_unit = ' [milliseconds]';
        for i = 1:length(global_protocols_keys)
            key = global_protocols_keys(i);
            p = global_protocols(char(key));
            [scenario_index, param_index] = p.get_scenario_index(scenario_tag, 0);
            all_data = [all_data; p.delay_time_per_hop(scenario_index,:)];
        end
        %convert from seconds to milliseconds
        all_data = all_data * 1000.0;
    case 2
        performance_metrics_name = 'Packet Delivery Success Ratio';
        performance_metrics_unit = ' [%]';
        for i = 1:length(global_protocols_keys)
            key = global_protocols_keys(i);
            p = global_protocols(char(key));
            [scenario_index, param_index] = p.get_scenario_index(scenario_tag, 0);
            all_data = [all_data; p.packet_delivery_success_ratio(scenario_index,:)];
        end  
        
    case 3
        performance_metrics_name = 'Packet Delivery Efficiency';
        performance_metrics_unit = ' [%]';
        for i = 1:length(global_protocols_keys)
            key = global_protocols_keys(i);
            p = global_protocols(char(key));
            [scenario_index, param_index] = p.get_scenario_index(scenario_tag, 0);
            all_data = [all_data; p.packet_delivery_efficiency(scenario_index,:)];
        end         
        
    case 4
        performance_metrics_name = 'Standard Deviation of Delay Time per Hop';
        performance_metrics_unit = '';  
        for i = 1:length(global_protocols_keys)
            key = global_protocols_keys(i);
            p = global_protocols(char(key));
            [scenario_index, param_index] = p.get_scenario_index(scenario_tag, 0);
            all_data = [all_data; p.std_delay_time_per_hop(scenario_index,:)];            
        end       
end
show(global_protocols_keys, performance_metrics_name, performance_metrics_unit, scenario_name, scenario_unit, scenario, all_data);

%popup_sel_index = get(handles.popupmenu1, 'Value');
%protocol_name = '';
%switch popup_sel_index
%    case 1
%        protocol_name = 'Flooding';
%    case 2
%        protocol_name = 'DRG';
%    case 3
%        protocol_name = 'ROVER';
%    case 4
%        protocol_name = 'DTSG';
%end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% % --- Executes on selection change in popupmenu1.
% function popupmenu1_Callback(hObject, eventdata, handles)
% % hObject    handle to popupmenu1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
% %        contents{get(hObject,'Value')} returns selected item from popupmenu1
% 
% 
% % --- Executes during object creation, after setting all properties.
% function popupmenu1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to popupmenu1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: popupmenu controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%      set(hObject,'BackgroundColor','white');
% end
% 
% set(hObject, 'String', {'Flooding', 'DRG', 'ROVER', 'DTSG'});



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


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Vehicle Density', 'ZOR/ZOF Range', 'Building Distance'});


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject, 'String', {'Delay Time per Hop', 'Packet Delivery Success Ratio', 'Packet Delivery Efficiency', 'Standard Deviation of Delay Time per Hop'});


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;

global_handle = globalVar();

global_protocols = global_handle.global_protocols;
global_protocols_keys = global_handle.global_protocols_keys;
global_accept_delay_time = global_handle.global_accept_delay_time;
global_vehi_density = global_handle.global_vehi_density;
global_zor_zof_range = global_handle.global_zor_zof_range;
global_buid_distance = global_handle.global_buid_distance;

% Get result files path.
clear global;
[pathstruct,pathstr] = dirext('results', '[a-zA-z]+.xml$');

for index = 1:length(pathstr)
    path = char(pathstr(index));
    [ scenario_name,  scenario_param, protocol_name] = analysisPath(path);
    % Get result data.
    protocol_data = parseXML(path);
    [ delay_time_per_hop, packet_delivery_success_ratio, packet_delivery_efficiency, std_delay_time_per_hop ] = getPerformMetrics( protocol_data, global_accept_delay_time );
    
    %check data of the protocol exist or not.
    tf = isKey(global_protocols, protocol_name);
    key = 0;
    for itf = 1:length(tf)
        if(tf(itf))
            key = tf(itf);
        end
    end
    
    p = 0;
    delay_time_per_hop_all = [];
    packet_delivery_success_ratio_all = [];
    packet_delivery_efficiency_all = [];
    std_delay_time_per_hop_all = [];
    if(key)
        p = global_protocols(protocol_name);
        delay_time_per_hop_all = p.delay_time_per_hop;
        packet_delivery_success_ratio_all = p.packet_delivery_success_ratio;
        packet_delivery_efficiency_all = p.packet_delivery_efficiency;
        std_delay_time_per_hop_all = p.std_delay_time_per_hop;
    else
        p = protocol(protocol_name, global_vehi_density, global_zor_zof_range, global_buid_distance);
        global_protocols(protocol_name) = p;
        global_protocols_keys = [global_protocols_keys, cellstr(protocol_name)];
    end

    %set value
    [scenario_index, param_index] = p.get_scenario_index(scenario_name, scenario_param);
    delay_time_per_hop_all(scenario_index, param_index) = delay_time_per_hop;
    packet_delivery_success_ratio_all(scenario_index, param_index) = packet_delivery_success_ratio;
    packet_delivery_efficiency_all(scenario_index, param_index) = packet_delivery_efficiency;
    std_delay_time_per_hop_all(scenario_index, param_index) = std_delay_time_per_hop;    
    
    p.delay_time_per_hop = delay_time_per_hop_all;
    p.packet_delivery_success_ratio = packet_delivery_success_ratio_all;
    p.packet_delivery_efficiency = packet_delivery_efficiency_all;
    p.std_delay_time_per_hop = std_delay_time_per_hop_all;

    global_protocols(protocol_name) = p;
end
global_handle.global_protocols = global_protocols;
global_handle.global_protocols_keys = global_protocols_keys;
set(handles.pushbutton4, 'UserData', global_handle);
set(handles.text6, 'String','Loading Done.');
