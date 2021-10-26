%% Setup de puerto serie

%%Busca puertos series conectados al sistema:
serialportlist

% Asignar un objeto serial y su tasa de baudios:
s = serialport("COM3",115200)

% El terminador siguiente es para indicarle al sistema
% qué hacer cada que se haga una lectura. En este caso
% cada que se haga una lectura en el puerto "s" se va a
% hacer "CR/LF"
configureTerminator(s,"CR/LF")
%% Setup de la captura
name = "analogRead";
figure('Name',name,'NumberTitle','off');

% Creamos una línea animada:
h = animatedline;

% Coloca líneas paralelas al plot:
ax = gca;
ax.Ygrid = 'on'; %nada más queremos línes horizontales (Ygrid)

%Tiempo durante el cual se va a medir:
measureTime = seconds(10);
t = seconds(0)
%% Lectura y ploteo
% Esto limpia el puerto serial de todos los datos que hayan estado antes
flush(s);

%Obtine la fecha del sistema y la guarda como el momento inicial:
startTime = datetime('now');

while 1 %Grabado infinito cuando se escribe '1'
%while t <= measureTime %Grabado con tiempo fijo
    
    %Lectura del valor actual del sensor
    data = readline(s);
    data = str2double(data);

    %Tiempo transcurrido
    t = datetime('now') - startTime;
    addpoints(h,datenum(t),data);

    %Ajusta los límites de x:
    ax.XLim = datenum([t-seconds(5) t]);

    %Coloca un formato de fechas al eje x
    datetick('x','keeplimits');

    %Actualiza toda la información a la línea animada
    drawnow

    %Momento final de la muestra:
    endTime = datetime('now');
end
   








