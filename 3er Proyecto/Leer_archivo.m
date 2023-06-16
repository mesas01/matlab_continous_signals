%{
 _____             _   _                            __   __    _                       
/  ___|           | | (_)                           \ \ / /   | |                      
\ `--.  __ _ _ __ | |_ _  __ _  __ _  ___    _   _   \ V /___ | |__   __ _ _ __  _   _ 
 `--. \/ _` | '_ \| __| |/ _` |/ _` |/ _ \  | | | |   \ // _ \| '_ \ / _` | '_ \| | | |
/\__/ / (_| | | | | |_| | (_| | (_| | (_) | | |_| |   | | (_) | | | | (_| | | | | |_| |
\____/ \__,_|_| |_|\__|_|\__,_|\__, |\___/   \__, |   \_/\___/|_| |_|\__,_|_| |_|\__, |
                                __/ |         __/ |                               __/ |
                               |___/         |___/                               |___/ 
%}
%{
 _                                     _     _            
| |                                   | |   (_)           
| |     ___  ___ _ __    __ _ _ __ ___| |__  ___   _____  
| |    / _ \/ _ \ '__|  / _` | '__/ __| '_ \| \ \ / / _ \ 
| |___|  __/  __/ |    | (_| | | | (__| | | | |\ V / (_) |
\_____/\___|\___|_|     \__,_|_|  \___|_| |_|_| \_/ \___/

%}

% Esta función permite seleccionar el archivo de audio (ya sea en formato
% .way o en .mp3) que se va a procesar.


function [Sonido_entrada,Fs] = Leer_archivo()

archivo = 0;
while archivo == 0
    [archivo,~] = uigetfile('*.wav; *.mp3',...
                         'Seleccione el Audio de entrada que quiere procesar',...
                         'DTMF 02.wav');
    if archivo == 0
        uiwait(msgbox('No ha seleccionado ningun archivo, por favor escoja uno',...
            'Error','corregir'));
    end
end

uiwait(msgbox({'Ha seleccionado el siguiente archivo: ',archivo}));
[Sonido_entrada, Fs] = audioread(archivo); % Devuelve el contenido del Audio 
                                            % y su respectiva frecuencia
                                            
end

