%% Version Final Interfaz
%version anterior: Pi_final
%Esta version de la Interfaz permite:
%Lectura del Arduino
%Comparar archivos
%Recuperar datos leidos con el arduino
%Recuperar datos leidos con el osciloscipo
               %Nota: Se deben de cambiar los offsets y el rango de datos 
               %Lineas :500 aprox
               %Se debe ingresar la Frecuencia de muestreo en la interfaz
               
%Se deben cargar los datos aunque aparezcan en la interfaz predefinidos
%Se debe de probar primero un absorbedor tipo calcular, y posteriormente el tipo
%masa resorte o marca error
%Para lectura de un solo archivo abrir de prefencia en el Archivo 1

%WARNINGS

%El absorbedor primero correr el tipo calcular y posteriormente el masa-resorte.
%Se debe seleccionar previamente el tipo de archivo o marca error.




function varargout = Interfaz(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @Interfaz_OutputFcn, ...
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


% --- Executes just before Interfaz is made visible.
function Interfaz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interfaz (see VARARGIN)

% Choose default command line output for Interfaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interfaz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interfaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% Parametros del sistema Primario
%Grosor
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
%Ancho
function ancho_Callback(hObject, eventdata, handles)
handles.k=3
handles.valor=1;
handles.cmasa=0.23;
handles.calcular=0;
handles.kpred=0
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
%Largo
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
%Modulo Elastico
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

[x,y,Mbt,frecw,k1,mass]=wn(handles.metricdata.largo,handles.metricdata.ancho,handles.metricdata.grosor,handles.metricdata.M_motor,handles.metricdata.Mod,handles.metricdata.M_v2,handles.metricdata.densidad,handles.k,handles.cmasa,handles.sal,handles.ent,handles.Wdis,handles.fdif);

plot(handles.axes1,x,y)
 

set(handles.k1, 'String', k1);
set(handles.frecw, 'String', frecw);
set(handles.M_bt, 'String', Mbt);
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
% handles.definida= definida;
% handles.tabs=1;
% guidata(hObject,handles)
function Kdef_SelectionChangedFcn(hObject, eventdata, handles)
if (hObject == handles.Kdef)
handles.calcular=1;
else 
    handles.calcular=0;
end

%if (hObject == handles.definida)
    
%     set(handles.text24, 'String', 'G');
%     set(handles.text26, 'String', 'D');
%     set(handles.text27, 'String', 'd');
%     set(handles.elastico2, 'String', 'Na');
%     %set(handles.densidad2, 'String', ' ');
%     %set(handles.mv3, 'String', '');
%        
%     set(handles.text25, 'String', 'N/m2');
%     set(handles.text28, 'String', 'm');
%     set(handles.text29, 'String', 'm');
%     set(handles.text31, 'String', 'Espiras');
%     %set(handles.text53, 'String', ' ');
%     
% else
%     handles.tabs=0;
%      set(handles.text24, 'String', 'Largo');
%     set(handles.text26, 'String', 'Ancho');
%     set(handles.text27, 'String', 'Grosor');
%     set(handles.elastico2, 'String', 'E');
%     set(handles.densidad2, 'String', 'Densidad');
%     
%     
%     set(handles.text25, 'String', 'm');
%     set(handles.text28, 'String', 'm');
%     set(handles.text29, 'String', 'm');
%     set(handles.text31, 'String', 'Gpa');
%     set(handles.text53, 'String', 'kg/m3');
%     
% end
guidata(hObject,handles)

% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
% hObject    handle to calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of calcular


function diam_2_Callback(hObject, eventdata, handles)
handles.sal2=1;handles.ent2=1;

diam_2 = str2double(get(hObject, 'String'));
if isnan(diam_2)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new largo value
handles.metricdata.diam_2 = diam_2;
guidata(hObject,handles)
function diam_2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Diam_1_Callback(hObject, eventdata, handles)
Diam_1 = str2double(get(hObject, 'String'));
if isnan(Diam_1)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new largo value
handles.metricdata.Diam_1 = Diam_1;
guidata(hObject,handles)
function Diam_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Diam_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function G_Callback(hObject, eventdata, handles)
G = str2double(get(hObject, 'String'));
if isnan(G)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
% Save the new largo value
handles.metricdata.G = G;
guidata(hObject,handles)
function G_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Na_Callback(hObject, eventdata, handles)
Na = str2double(get(hObject, 'String'));
if isnan(Na)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new largo value
handles.metricdata.Na = Na;
guidata(hObject,handles)
function Na_CreateFcn(hObject, eventdata, handles)

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
%   plot(handles.time,handles.val);
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
     figure(2);
     plot(handles.time,handles.val);
     plot(handles.axes1,handles.time,handles.val,'m');
     title('Señal adquirda por el acelerometro')
     xlabel('Tiempo(s)')
 ylabel('Aceleración(m/s^2)')
     set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
set(gcf,'color','w')
else if(handles.valor==4)
     nombre = get(handles.abrirarchivo,'String');
    ext='.CSV';
    n = strcat(nombre,ext);
    val=readmatrix(n);
    o=handles.valorincial;
    L=o+1999;
     
    handles.val=val(o:L,(handles.valor+1));
    handles.time=val(o:L,(handles.valor))

    figure(2);
     plot(handles.time,handles.val);
     plot(handles.axes1,handles.time,handles.val,'m');
     title('Señal adquirirda por el sensor de distancia')
     set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
set(gcf,'color','w')
xlabel('Tiempo(s)')
 ylabel('Amplitud(V)')
    end
end
guidata(hObject,handles)

% --- Executes on button press in arduino.
function arduino_Callback(hObject, eventdata, handles)
[handles.val,handles.time] = lectura_arduino();
   cla(handles.axes4,'reset');
  cla(handles.axes1,'reset');
plot(handles.axes1,handles.time,handles.val);
figure(3);
plot(handles.time,handles.val);
title('Lectura Arduino')
guidata(hObject,handles)

% --- Executes on button press in acelerometro.
function acelerometro_Callback(hObject, eventdata, handles)

[DatX1,Datx1,f,P1]= facelerometro3(handles.val,handles.time,handles.Fs_osc,handles.valor,handles.metricdata.offset);
cla(handles.axes4,'reset');
  cla(handles.axes1,'reset');
  plot(handles.axes1,DatX1,'m')
  
 xlim([0,15]); 
 plot(handles.axes4,f,P1,'k');
 xlim([0,15]);
 guidata(hObject,handles)



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
     figure(4);
     plot(handles.time2,handles.val2);
     plot(handles.axes4,handles.time2,handles.val2,'m');
     title('Señal adquirida por el acelerometro')
     set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
set(gcf,'color','w')
xlabel('Tiempo(s)')
 ylabel('Aceleración(m/s^2)')
else if(handles.valor==4)
     nombre2 = get(handles.abrirarchivo2,'String');
    ext2='.CSV';
    n2 = strcat(nombre2,ext2);
    val2=readmatrix(n2);
    o=handles.valorincial;
    L=o+1999;
    
    handles.val2=val2(o:L,(handles.valor+1))
    handles.time2=val2(o:L,(handles.valor))
    figure(4);
     plot(handles.time2,handles.val2);
     plot(handles.axes4,handles.time2,handles.val2,'m');
     title('Señal adquirida por el sensor de distancia')
     set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
set(gcf,'color','w')
xlabel('Tiempo(s)')
 ylabel('Amplitud(V)')
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


% --- Executes when selected object is changed in Kdef.
function uibuttongroup10_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in Kdef 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in definida.
function definida_Callback(hObject, eventdata, handles)
%handles.definida= definida;
handles.calcular=1;
guidata(hObject,handles)


% --- Executes on button press in absorbedor1.
function absorbedor1_Callback(hObject, eventdata, handles)
 [x,y,Mt2,w,k2]= absorbedor2(handles.metricdata.largo,handles.metricdata.ancho,handles.metricdata.grosor,handles.metricdata.M_motor,handles.metricdata.Mod,handles.metricdata.M_v2,handles.metricdata.densidad,handles.k,handles.sal2,handles.ent2,handles.Wdis,handles.fdif,handles.metricdata.G,handles.metricdata.Diam_1,handles.metricdata.diam_2,handles.metricdata.Na,handles.kpred,handles.calcular,handles.cmasa);
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
%set(handles.Mt2, 'String', Mt);
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
cla(figure(5),'reset')
cla(handles.axes4,'reset')
cla(handles.axes1,'reset')


%Com=(handles.val)+6.3%-2.6%+6.7;
Com=(handles.val)+handles.metricdata.offset;
%handles.time2=handles.time2-0.9;



%Com2=(handles.val2)+6.3;%-2.6%+7;
Com2=(handles.val2)+handles.metricdata.offset;
if(handles.valor==4)
Com=Com*(1/4.09468);
Com2=Com2*(1/4.09468);
end

%handles.time2=handles.time2+0.8;
M1 = max( Com  )
M = max( Com2  )
P=M*100/M1
P=100-P
set(handles.porcentaje, 'String', P);
%handles.porcentaje=P;
cla(handles.axes4,'reset');
hold on
plot(handles.axes4,Com,'m')
plot(handles.axes4,Com2,'b')
hold off
figure(5)
hold on
plot(handles.time,Com,'m');
plot(handles.time2,Com2,'b');
xlabel('Tiempo(s)')
ylabel('Amplitud(mm)')
%ylabel('Amplitud(m/s^2)')
title('Comparación de la respuesta del sistema al implementar el absorbedor'); 
set(gca, 'FontName','Times New Roman','FontSize', 10,  'FontAngle', 'italic')
set(gcf,'color','w')


guidata(hObject,handles)

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


% --- Executes during object creation, after setting all properties.
function text_offset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function offset_Callback(hObject, eventdata, handles)
offset = str2double(get(hObject, 'String'));
if isnan(offset)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.metricdata.offset=offset;

% Save the new largo value
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function offset_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end













function valorincial_Callback(hObject, eventdata, handles)
valorincial = str2double(get(hObject, 'String'));
if isnan(valorincial)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.valorincial=valorincial;
% Save the new largo value
guidata(hObject,handles)

function valorincial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valorincial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kpred_Callback(hObject, eventdata, handles)
kpred = str2double(get(hObject, 'String'));
if isnan(kpred)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.kpred=kpred;
% Save the new largo value
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function kpred_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kpred (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
