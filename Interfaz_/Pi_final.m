
function varargout = Pi_final(varargin)
% PI_FINAL MATLAB code for Pi_final.fig
%      PI_FINAL, by itself, creates a new PI_FINAL or raises the existing
%      singleton*.
%
%      H = PI_FINAL returns the handle to a new PI_FINAL or the handle to
%      the existing singleton*.
%
%      PI_FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PI_FINAL.M with the given input arguments.
%
%      PI_FINAL('Property','Value',...) creates a new PI_FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pi_final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pi_final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pi_final

% Last Modified by GUIDE v2.5 06-Sep-2022 15:13:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pi_final_OpeningFcn, ...
                   'gui_OutputFcn',  @Pi_final_OutputFcn, ...
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


% --- Executes just before Pi_final is made visible.
function Pi_final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pi_final (see VARARGIN)

% Choose default command line output for Pi_final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Pi_final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pi_final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function grosor_Callback(hObject, eventdata, handles)
handles.sal2=0;
handles.sal1=1;
grosor = str2double(get(hObject, 'String'));
if isnan(grosor)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new largo value
handles.metricdata.grosor = grosor;
guidata(hObject,handles)
function grosor_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ancho_Callback(hObject, eventdata, handles)
handles.k=3
handles.valor=1;
handles.cmasa=0.23;
handles.tabs=0;
handles.sal=1;
ancho = str2double(get(hObject, 'String'));
if isnan(ancho)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.metricdata.ancho = ancho;
guidata(hObject,handles)
function ancho_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function largo_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function largo_Callback(hObject, eventdata, handles)

largo = str2double(get(hObject, 'String'));
if isnan(largo)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.metricdata.largo = largo;
guidata(hObject,handles)

function Mod_Callback(hObject, eventdata, handles)
Mod = str2double(get(hObject, 'String'));
if isnan(Mod)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.metricdata.Mod = Mod;
guidata(hObject,handles)
function Mod_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function densidad_Callback(hObject, eventdata, handles)
handles.sal=1;handles.ent=1;
handles.Wdis=0;%handles.fdif=100;
densidad = str2double(get(hObject, 'String'));
if isnan(densidad)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.metricdata.densidad = densidad;
guidata(hObject,handles)
function densidad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to densidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function M_v2_Callback(hObject, eventdata, handles)
M_v2 = str2double(get(hObject, 'String'));
if isnan(M_v2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.metricdata.M_v2 = M_v2;
guidata(hObject,handles)
function M_v2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to M_v2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% boton frecuencia 
function fresonancia_Callback(hObject, eventdata, handles)

[x,y,M_bt,frecw,k1,mass]=wn(handles.metricdata.largo,handles.metricdata.ancho,handles.metricdata.grosor,handles.metricdata.M_motor,handles.metricdata.Mod,handles.metricdata.M_v2,handles.metricdata.densidad,handles.k,handles.cmasa,handles.sal,handles.ent,handles.Wdis,handles.fdif);

plot(handles.axes1,x,y)
 

set(handles.k1, 'String', k1);
set(handles.frecw, 'String', frecw);
set(handles.M_bt, 'String', M_bt);
set(handles.mass, 'String', mass);
%set(handles.extra, 'String', extra);
guidata(hObject,handles)


function empotramiento_SelectionChangedFcn(hObject, eventdata, handles)
if (hObject == handles.voladizo)
handles.k=3
handles.cmasa=0.23;
else 
    handles.k=192
    handles.cmasa=0.5;
end
guidata(hObject,handles)

function M_motor_Callback(hObject, eventdata, handles)
M_motor = str2double(get(hObject, 'String'));
if isnan(M_motor)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.metricdata.M_motor = M_motor;
guidata(hObject,handles)
function M_motor_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% function masares_Callback(hObject, eventdata, handles)
% handles.masares= masares;
% handles.tabs=1;
% guidata(hObject,handles)
function tipoabsorbedor_SelectionChangedFcn(hObject, eventdata, handles)

if (hObject == handles.masares)
    handles.tabs=1;
    set(handles.text24, 'String', 'G');
    set(handles.text26, 'String', 'D');
    set(handles.text27, 'String', 'd');
    set(handles.elastico2, 'String', 'Na');
    set(handles.densidad2, 'String', ' ');
    set(handles.mv3, 'String', '');
       
    set(handles.text25, 'String', 'N/m2');
    set(handles.text28, 'String', 'm');
    set(handles.text29, 'String', 'm');
    set(handles.text31, 'String', 'Espiras');
    set(handles.text53, 'String', ' ');
    
else
    handles.tabs=0;
     set(handles.text24, 'String', 'Largo');
    set(handles.text26, 'String', 'Ancho');
    set(handles.text27, 'String', 'Grosor');
    set(handles.elastico2, 'String', 'E');
    set(handles.densidad2, 'String', 'Densidad');
    
    
    set(handles.text25, 'String', 'm');
    set(handles.text28, 'String', 'm');
    set(handles.text29, 'String', 'm');
    set(handles.text31, 'String', 'Gpa');
    set(handles.text53, 'String', 'kg/m3');
    
end
guidata(hObject,handles)

% --- Executes on button press in viga.
function viga_Callback(hObject, eventdata, handles)
% hObject    handle to viga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of viga


function Grosor2_Callback(hObject, eventdata, handles)
handles.sal2=1;handles.ent2=1;

Grosor2 = str2double(get(hObject, 'String'));
if isnan(Grosor2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new largo value
handles.metricdata.Grosor2 = Grosor2;
guidata(hObject,handles)
function Grosor2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ancho2_Callback(hObject, eventdata, handles)
ancho2 = str2double(get(hObject, 'String'));
if isnan(ancho2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new largo value
handles.metricdata.ancho2 = ancho2;
guidata(hObject,handles)
function ancho2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ancho2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function largo2_Callback(hObject, eventdata, handles)
largo2 = str2double(get(hObject, 'String'));
if isnan(largo2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new largo value
handles.metricdata.largo2 = largo2;
guidata(hObject,handles)
function largo2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function E2_Callback(hObject, eventdata, handles)
E2 = str2double(get(hObject, 'String'));
if isnan(E2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.metricdata.E2 = E2;
guidata(hObject,handles)
function E2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function mv3_Callback(hObject, eventdata, handles)
mv3 = str2double(get(hObject, 'String'));
if isnan(mv3)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.metricdata.mv3 = mv3;
guidata(hObject,handles)
function mv3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mv3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function voladizo_Callback(hObject, eventdata, handles)
%handles.voladizo= voladizo;
guidata(hObject,handles)


% --- Executes on button press in doble.
function doble_Callback(hObject, eventdata, handles)
% hObject    handle to doble (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of doble




% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4



function W2_Callback(hObject, eventdata, handles)
% hObject    handle to W2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of W2 as text
%        str2double(get(hObject,'String')) returns contents of W2 as a double


% --- Executes during object creation, after setting all properties.
function W2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function fdif_Callback(hObject,eventdata,handles)
fdif = str2double(get(hObject, 'String'));
if isnan(fdif)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.fdif = fdif*(2*pi);
guidata(hObject,handles)
function fdif_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function guardararchivo_Callback(hObject, eventdata, handles)
guardararchivo = str2double(get(hObject, 'String'));
% Save the new largo value
handles.metricdata.guardararchivo = guardararchivo;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function guardararchivo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to guardararchivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function abrirarchivo_Callback(hObject, eventdata, handles)
abrirarchivo = str2double(get(hObject, 'String'));
% Save the new largo value
handles.metricdata.abrirarchivo = abrirarchivo;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function abrirarchivo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to abrirarchivo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
nombre = get(handles.guardararchivo,'String');
tiempo='_tiempo';
ext='.csv';
n = strcat(nombre,ext);
t = strcat(nombre,tiempo,ext);

writematrix(handles.val,n);
writematrix(handles.time,t);


% --- Executes on button press in abrir.
function abrir_Callback(hObject, eventdata, handles)
% nombre = get(handles.abrirarchivo,'String');
% tiempo='_tiempo';
% ext='.csv';
% n = strcat(nombre,ext);
% t = strcat(nombre,tiempo,ext);  
% handles.val=readmatrix(n)
%   handles.time=readmatrix(t)  
%   figure(1);
%   plot(handles.time,handles.val,'.');
handles.valor
if(handles.valor==1)
     nombre = get(handles.abrirarchivo,'String');
     tiempo='_tiempo';
     ext='.csv';
     n = strcat(nombre,ext);
     t = strcat(nombre,tiempo,ext);  
     val=readmatrix(n);
     handles.val=val;
     handles.time=readmatrix(t)  
     figure(1);
     plot(handles.time,handles.val,'.');
else if(handles.valor==4)
     nombre = get(handles.abrirarchivo,'String');
    ext='.CSV';
    n = strcat(nombre,ext);
    val=readmatrix(n);
    L=2000;
o=001;
    handles.val=val(o:L,(handles.valor+1))+8;
    handles.time=val(o:L,(handles.valor))

    figure(1);
     plot(handles.time,handles.val,'.');
    end
end
guidata(hObject,handles)

% --- Executes on button press in arduino.
function arduino_Callback(hObject, eventdata, handles)
[handles.val,handles.time] = lectura_arduino();
   cla(handles.axes4,'reset');
  cla(handles.axes1,'reset');
plot(handles.axes1,handles.time,handles.val,'.');
figure(1);
plot(handles.time,handles.val,'.');
guidata(hObject,handles)

% --- Executes on button press in acelerometro.
function acelerometro_Callback(hObject, eventdata, handles)

[DatX1,Datx1,f,P1]= facelerometro3(handles.val,handles.time,handles.Fs_osc,handles.valor);
cla(handles.axes4,'reset');
  cla(handles.axes1,'reset');
  plot(handles.axes1,DatX1,'m')
  
 plot(handles.axes4,f,P1,'k')



% --- Executes on button press in radiobutton23.
function radiobutton23_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton23

function salida2_Callback(hObject, eventdata, handles)
%handles.salida2= salida2;
guidata(hObject,handles)
function salidas2_SelectionChangedFcn(hObject, eventdata, handles)
if (hObject == handles.salida2)
handles.sal2=1;
else 
    handles.sal2=2;
end
guidata(hObject,handles)




% --- Executes on button press in Barrido_2.
function Barrido_2_Callback(hObject, eventdata, handles)
% hObject    handle to Barrido_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Barrido_2


% --- Executes on button press in abrir2.
function abrir2_Callback(hObject, eventdata, handles)
%handles.valor
if(handles.valor==1)
     nombre2 = get(handles.abrirarchivo2,'String');
     tiempo2='_tiempo';
     ext2='.csv';
     n2 = strcat(nombre2,ext2);
     t2 = strcat(nombre2,tiempo2,ext2);  
     val2=readmatrix(n2);
     handles.val2=val2
     handles.time2=readmatrix(t2)  
     figure(1);
     plot(handles.time2,handles.val2,'.');
else if(handles.valor==4)
     nombre2 = get(handles.abrirarchivo2,'String');
    ext2='.CSV';
    n2 = strcat(nombre2,ext2);
    val2=readmatrix(n2);
    L=2000;
o=001;
    handles.val2=val2(o:L,(handles.valor+1))
    handles.time2=val2(o:L,(handles.valor))
    figure(1);
     plot(handles.time2,handles.val2,'.');
    end
end
 guidata(hObject,handles)


function abrirarchivo2_Callback(hObject, eventdata, handles)
abrirarchivo2 = str2double(get(hObject, 'String'));
% Save the new largo value
handles.metricdata.abrirarchivo2 = abrirarchivo2;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function abrirarchivo2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to abrirarchivo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Datos_obtenidos_ButtonDownFcn(hObject, eventdata, handles)


% --- Executes on button press in Doble.
function Doble_Callback(hObject, eventdata, handles)
% hObject    handle to Doble (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Doble


% --- Executes during object creation, after setting all properties.
function empotramiento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to empotramiento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in salidas.
function salidas_SelectionChangedFcn(hObject, eventdata, handles)
if (hObject == handles.salida1)
handles.sal=1;
else 
    handles.sal=2;
end
guidata(hObject,handles)


% --- Executes when selected object is changed in tipoabsorbedor.
function uibuttongroup10_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in tipoabsorbedor 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in masares.
function masares_Callback(hObject, eventdata, handles)
%handles.masares= masares;
handles.tabs=1;
guidata(hObject,handles)


% --- Executes on button press in absorbedor1.
function absorbedor1_Callback(hObject, eventdata, handles)
 [x,y,Mt2,w,k2,Mt]= absorbedor(handles.metricdata.largo,handles.metricdata.ancho,handles.metricdata.grosor,handles.metricdata.M_motor,handles.metricdata.Mod,handles.metricdata.M_v2,handles.metricdata.densidad,handles.k,handles.sal2,handles.ent2,handles.Wdis,handles.fdif,handles.metricdata.largo2,handles.metricdata.ancho2,handles.metricdata.Grosor2,handles.metricdata.E2,handles.metricdata.mv3,handles.tabs);
if(handles.sal2==1)
cla(handles.axes4,'reset');
    hold on

plot(handles.axes4,y,'m');
plot(handles.axes4,x,'b');
hold off

else
    plot(handles.axes4,x,y);
end
    
set(handles.k2, 'String', k2);
set(handles.Mt2, 'String', Mt);
set(handles.mv2, 'String', Mt2);


% --- Executes when selected object is changed in Entrada1.
function entrada_sen_Callback(hObject, eventdata, handles)
handles.entrada_sen= entrada_sen;
guidata(hObject,handles)
function Entrada1_SelectionChangedFcn(hObject, eventdata, handles)
if (hObject == handles.entrada_sen)
handles.ent=1;
else 
    handles.ent=2;
end
guidata(hObject,handles)

% --- Executes when selected object is changed in Entradas2.
function entrada_sen_2_Callback(hObject, eventdata, handles)
%handles.entrada_sen_2= entrada_sen_2;
guidata(hObject,handles)
function Entradas2_SelectionChangedFcn(hObject, eventdata, handles)
if (hObject == handles.entrada_sen_2)
handles.ent2=1;
else 
    handles.ent2=2;
end
guidata(hObject,handles)


% --- Executes when selected object is changed in Datos_obtenidos.
function Datos_obtenidos_SelectionChangedFcn(hObject, eventdata, handles)
if (hObject == handles.arch_arduino)
handles.valor=1;
end
if (hObject == handles.arch_osc)
    handles.valor=4;
end
guidata(hObject,handles)

% --- Executes on button press in arch_osc.
function arch_osc_Callback(hObject, eventdata, handles)
handles.valor=4;
guidata(hObject,handles)

% Hint: get(hObject,'Value') returns toggle state of arch_osc


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over comparar1.
function comparar1_ButtonDownFcn(hObject, eventdata, handles)
  


% --- Executes on button press in comparar1.
function comparar1_Callback(hObject, eventdata, handles)
cla(handles.axes4,'reset');
cla(figure(2),'reset');

hold on
plot(handles.axes4,handles.time,handles.val,'m');
plot(handles.axes4,handles.time2,handles.val2,'b');
hold off
figure(2)
hold on
plot(handles.time,handles.val,'m');
plot(handles.time2,handles.val2,'b');
hold off


% --- Executes on button press in arch_arduino.
function arch_arduino_Callback(hObject, eventdata, handles)
% hObject    handle to arch_arduino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of arch_arduino


function frecuencia_SelectionChangedFcn(hObject, eventdata, handles)
if (hObject == handles.Wres)
handles.Wdis=0;
else 
    handles.Wdis=1;
end
guidata(hObject,handles)


% --- Executes on button press in wres.
function Wres_Callback(hObject, eventdata, handles)
%handles.Wres= Wres;
guidata(hObject,handles)

% Hint: get(hObject,'Value') returns toggle state of wres



function Fs_osc_Callback(hObject, eventdata, handles)
% hObject    handle to Fs_osc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs_osc = str2double(get(hObject, 'String'));
if isnan(Fs_osc)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.Fs_osc = 1/Fs_osc;
guidata(hObject,handles)

% Hints: get(hObject,'String') returns contents of Fs_osc as text
%        str2double(get(hObject,'String')) returns contents of Fs_osc as a double


% --- Executes during object creation, after setting all properties.
function Fs_osc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fs_osc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
