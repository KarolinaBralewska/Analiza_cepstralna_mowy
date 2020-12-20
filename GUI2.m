function varargout = GUI2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_OutputFcn, ...
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


function GUI2_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);


function varargout = GUI2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function pushbutton_nagraniepatologiczna_Callback(hObject, eventdata, handles)

sound(handles.currentData2,handles.fp2);


function pushbutton_spektrogrampatologiczna_Callback(hObject, eventdata, handles)

axes(handles.axes2);
spectrogram(handles.currentData2, 'yaxis');
xlabel('Numer próbki');
ylabel('Znormalizowana czestotliwość');
title('Spektrogram sygnału:',handles.tmp2)


function pushbutton_sygnalpatologiczna_Callback(hObject, eventdata, handles)

axes(handles.axes2);
plot(handles.t2,handles.currentData2);
grid on;
title('Zmiana w czasie sygnału wejściowego:', handles.tmp2);
xlabel('Czas(s)');
ylabel('Amplituda');
axis([0 max(handles.t2) min(handles.currentData2)-0.05 max(handles.currentData2)+0.05]);


function pushbutton_mfccpatologiczna_Callback(hObject, eventdata, handles)

axes(handles.axes2);
x2=handles.currentData2;
fp2=handles.fp2;
tmp2=handles.tmp2;
cepstrum_main(x2,fp2,tmp2);


function pushbutton_nagraniezdrowa_Callback(hObject, eventdata, handles)

sound(handles.currentData1,handles.fp1);


function pushbutton_spektrogramzdrowa_Callback(hObject, eventdata, handles)

axes(handles.axes1);
spectrogram(handles.currentData1, 'yaxis');
xlabel('Numer próbki');
ylabel('Znormalizowana czestotliwość');
title('Spektrogram sygnału:',handles.tmp1);


function pushbutton_sygnalzdrowa_Callback(hObject, eventdata, handles)

axes(handles.axes1);
plot(handles.t1,handles.currentData1);
grid on;
title('Zmiana w czasie sygnału wejściowego:',handles.tmp1);
xlabel('Czas(s)');
ylabel('Amplituda');
axis([0 max(handles.t1) min(handles.currentData1)-0.05 max(handles.currentData1)+0.05]);


function pushbutton_mfcczdrowa_Callback(hObject, eventdata, handles)

axes(handles.axes1);

x1=handles.currentData1;
fp1=handles.fp1;
tmp1=handles.tmp1;
cepstrum_main(x1,fp1,tmp1);

function wybor_sygnalu_patologicznego_Callback(hObject, eventdata, handles)

s = get(hObject,'String');
sV = get(hObject, 'Value');

tmp = s(sV);
    
[x, fp]=audioread(tmp{1});
N=length(x);
t=[0:N-1]./fp;

handles.x=x;
handles.fp2=fp;
handles.t2=t;
handles.currentData2=handles.x;
handles.tmp2=tmp{1};

axes(handles.axes2);

guidata(hObject, handles)


function wybor_sygnalu_patologicznego_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function wybor_plci_Callback(hObject, eventdata, handles)
val = get(hObject, 'Value');
switch val
    case 1 
    case 2 
        set(handles.wybor_sygnalu_zdrowego, 'String',{
 '1-a.wav', 
 '2-a.wav', 
 '3-a.wav',
 '6-a.wav',
 '7-a.wav',
 '8-a.wav',
 '13-a.wav',
 '14-a.wav',
 '16-a.wav',
 '17-a.wav',
 '18-a.wav',
 '19-a.wav',
 '20-a.wav',
 '24-a.wav',
 '27-a.wav',
 '31-a.wav',
 '34-a.wav',
 '36-a.wav',
 '37-a.wav',
 '42-a.wav',
 '44-a.wav',
 '46-a.wav',
 '48-a.wav',
 '49-a.wav',
 '57-a.wav',
 '64-a.wav',
 '65-a.wav',
 '72-a.wav',
 '79-a.wav',
 '83-a.wav',
 '86-a.wav',
 '97-a.wav',
 '104-a.wav',
 '113-a.wav',
 '116-a.wav',
 '99-a.wav',
 '102-a.wav',
 '56-a.wav',
 '39-a.wav',
 '71-a.wav',
 '1-u.wav',
 '2-u.wav',
 '3-u.wav',
 '6-u.wav',
 '7-u.wav',
 '8-u.wav',
 '13-u.wav',
 '14-u.wav',
 '16-u.wav',
 '17-u.wav',
 '18-u.wav',
 '19-u.wav',
 '20-u.wav',
 '24-u.wav',
 '27-u.wav',
 '31-u.wav',
 '34-u.wav',
 '36-u.wav',
 '37-u.wav',
 '42-u.wav',
 '44-u.wav',
 '46-u.wav',
 '48-u.wav',
 '49-u.wav',
 '57-u.wav',
 '64-u.wav',
 '65-u.wav',
 '72-u.wav',
 '79-u.wav',
 '83-u.wav',
 '86-u.wav',
 '97-u.wav',
 '104-u.wav',
 '113-u.wav',
 '116-u.wav',
 '99-u.wav',
 '102-u.wav',
 '56-u.wav',
 '39-u.wav',
 '71-u.wav'});
    case 3
        set(handles.wybor_sygnalu_zdrowego, 'String',{
 '4-a.wav',
 '5-a.wav',
 '9-a.wav',
 '11-a.wav',
 '15-a.wav',
 '53-a.wav',
 '59-a.wav',
 '61-a.wav',
 '98-a.wav',
 '103-a.wav',
 '134-a.wav',
 '29-a.wav',
 '43-a.wav',
 '32-a.wav',
 '63-a.wav',
 '69-a.wav',
 '74-a.wav',
 '81-a.wav',
 '87-a.wav',
 '92-a.wav',
 '4-u.wav',
 '5-u.wav',
 '9-u.wav',
 '11-u.wav',
 '15-u.wav',
 '53-u.wav',
 '59-u.wav',
 '61-u.wav',
 '98-u.wav',
 '103-u.wav',
 '134-u.wav',
 '29-u.wav',
 '43-u.wav',
 '32-u.wav',
 '63-u.wav',
 '69-u.wav',
 '74-u.wav',
 '81-u.wav',
 '87-u.wav',
 '92-u.wav'});
         
end           
 
function wybor_plci_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function wybor_sygnalu_zdrowego_Callback(hObject, eventdata, handles)

s = get(hObject,'String');
sV = get(hObject, 'Value');

tmp = s(sV);
    
[x, fp]=audioread(tmp{1});
N=length(x);
t=[0:N-1]./fp;

handles.x=x;
handles.fp1=fp;
handles.t1=t;
handles.currentData1=handles.x;
handles.tmp1=tmp{1};

axes(handles.axes1);

guidata(hObject, handles)

function wybor_sygnalu_zdrowego_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function wybor_zaburzenia_Callback(hObject, eventdata, handles)
val = get(hObject, 'Value');
switch val
    case 1
    case 2
        set(handles.wybor_sygnalu_patologicznego, 'String',{
'368-a.wav',
'445-a.wav',
'451-a.wav',
'495-a.wav',
'561-a.wav',
'674-a.wav',
'872-a.wav',
'1057-a.wav',
'2147-a.wav',
'1248-a.wav',
'1312-a.wav',
'1502-a.wav',
'2350-a.wav',
'1636-a.wav',
'1833-a.wav',
'1894-a.wav',
'2019-a.wav',
'2096-a.wav',
'2097-a.wav',
'2106-a.wav',
'2117-a.wav',
'2118-a.wav',
'2119-a.wav',
'2311-a.wav',
'2333-a.wav',
'2347-a.wav',
'2366-a.wav',
'1187-a.wav',
'2389-a.wav',
'2392-a.wav',
'2405-a.wav',
'2422-a.wav',
'2428-a.wav',
'2583-a.wav',
'2369-a.wav',
'2537-a.wav',
'2087-a.wav',
'2309-a.wav',
'2127-a.wav',
'1187-a.wav',
'368-u.wav',
'445-u.wav',
'451-u.wav',
'495-u.wav',
'561-u.wav',
'674-u.wav',
'872-u.wav',
'1057-u.wav',
'2147-u.wav',
'1248-u.wav',
'1312-u.wav',
'1502-u.wav',
'2350-u.wav',
'1636-u.wav',
'1833-u.wav',
'1894-u.wav',
'2019-u.wav',
'2096-u.wav',
'2097-u.wav',
'2106-u.wav',
'2117-u.wav',
'2118-u.wav',
'2119-u.wav',
'2311-u.wav',
'2333-u.wav',
'2347-u.wav',
'2366-u.wav',
'1187-u.wav',
'2389-u.wav',
'2392-u.wav',
'2405-u.wav',
'2422-u.wav',
'2428-u.wav',
'2583-u.wav',
'2369-u.wav',
'2537-u.wav',
'2087-u.wav',
'2309-u.wav',
'2127-u.wav',
'1187-u.wav',});
    case 3
        set(handles.wybor_sygnalu_patologicznego, 'String',{
'493-a.wav',
'497-a.wav',
'818-a.wav',
'824-a.wav',
'884-a.wav',
'930-a.wav',
'1237-a.wav',
'1259-a.wav',
'1315-a.wav',
'1414-a.wav',
'1463-a.wav',
'1567-a.wav',
'1629-a.wav',
'1783-a.wav',
'2585-a.wav',
'2126-a.wav',
'2075-a.wav',
'2028-a.wav',
'2003-a.wav',
'107-a.wav',
'1978-a.wav',
'2120-a.wav',
'904-a.wav',
'2351-a.wav',
'2443-a.wav',
'139-a.wav',
'2321-a.wav',
'2404-a.wav',
'1795-a.wav',
'2424-a.wav',
'1780-a.wav',
'2296-a.wav',
'1599-a.wav',
'1614-a.wav',
'1235-a.wav',
'1426-a.wav',
'1456-a.wav',
'1617-a.wav',
'2600-a.wav',
'910-a.wav',
'493-u.wav',
'497-u.wav',
'818-u.wav',
'824-u.wav',
'884-u.wav',
'930-u.wav',
'1237-u.wav',
'1259-u.wav',
'1315-u.wav',
'1414-u.wav',
'1463-u.wav',
'1567-u.wav',
'1629-u.wav',
'1783-u.wav',
'2585-u.wav',
'2126-u.wav',
'2075-u.wav',
'2028-u.wav',
'2003-u.wav',
'107-u.wav',
'1978-u.wav',
'2120-u.wav',
'904-u.wav',
'2351-u.wav',
'2443-u.wav',
'139-u.wav',
'2321-u.wav',
'2404-u.wav',
'1795-u.wav',
'2424-u.wav',
'1780-u.wav',
'2296-u.wav',
'1599-u.wav',
'1614-u.wav',
'1235-u.wav',
'1426-u.wav',
'1456-u.wav',
'1617-u.wav',
'2600-u.wav',
'910-u.wav'});
    case 4
        set(handles.wybor_sygnalu_patologicznego, 'String',{
'110-a.wav',
'500-a.wav',
'742-a.wav',
'1048-a.wav',
'1239-a.wav',
'1245-a.wav',
'1273-a.wav',
'1332-a.wav',
'1341-a.wav',
'1383-a.wav',
'1391-a.wav',
'1403-a.wav',
'1416-a.wav',
'1428-a.wav',
'1451-a.wav',
'1458-a.wav',
'1465-a.wav',
'1545-a.wav',
'2343-a.wav',
'2467-a.wav',
'1247-a.wav',
'1267-a.wav',
'1449-a.wav',
'1490-a.wav',
'110-u.wav',
'500-u.wav',
'742-u.wav',
'1048-u.wav',
'1239-u.wav',
'1245-u.wav',
'1273-u.wav',
'1332-u.wav',
'1341-u.wav',
'1383-u.wav',
'1391-u.wav',
'1403-u.wav',
'1416-u.wav',
'1428-u.wav',
'1451-u.wav',
'1458-u.wav',
'1465-u.wav',
'1545-u.wav',
'2343-u.wav',
'2467-u.wav',
'1247-u.wav',
'1267-u.wav',
'1449-u.wav',
'1490-u.wav'});

    case 5
        set(handles.wybor_sygnalu_patologicznego, 'String',{
'1249-a.wav',
'108-a.wav',
'1256-a.wav',
'130-a.wav',
'138-a.wav',
'142-a.wav',
'1262-a.wav',
'152-a.wav',
'356-a.wav',
'362-a.wav',
'448-a.wav',
'450-a.wav',
'565-a.wav',
'627-a.wav',
'632-a.wav',
'1263-a.wav',
'671-a.wav',
'1272-a.wav',
'716-a.wav',
'1292-a.wav',
'728-a.wav',
'1293-a.wav',
'855-a.wav',
'859-a.wav',
'864-a.wav',
'869-a.wav',
'1330-a.wav',
'879-a.wav',
'1382-a.wav',
'1390-a.wav',
'893-a.wav',
'1397-a.wav',
'1402-a.wav',
'928-a.wav',
'1407-a.wav',
'1040-a.wav',
'1418-a.wav',
'1054-a.wav',
'1437-a.wav',
'1206-a.wav',
'1249-u.wav',
'108-u.wav',
'1256-u.wav',
'130-u.wav',
'138-u.wav',
'142-u.wav',
'1262-u.wav',
'152-u.wav',
'356-u.wav',
'362-u.wav',
'448-u.wav',
'450-u.wav',
'565-u.wav',
'627-u.wav',
'632-u.wav',
'1263-u.wav',
'671-u.wav',
'1272-u.wav',
'716-u.wav',
'1292-u.wav',
'728-u.wav',
'1293-u.wav',
'855-u.wav',
'859-u.wav',
'864-u.wav',
'869-u.wav',
'1330-u.wav',
'879-u.wav',
'1382-u.wav',
'1390-u.wav',
'893-u.wav',
'1397-u.wav',
'1402-u.wav',
'928-u.wav',
'1407-u.wav',
'1040-u.wav',
'1418-u.wav',
'1054-u.wav',
'1437-u.wav',
'1206-u.wav'}); 
               
end

% --- Executes during object creation, after setting all properties.
function wybor_zaburzenia_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
