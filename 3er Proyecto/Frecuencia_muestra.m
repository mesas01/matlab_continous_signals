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
                           _                          __                                     _       
                          | |                        / _|                                   (_)      
 _ __ ___  _   _  ___  ___| |_ _ __ ___  __ _ _ __  | |_ _ __ ___  ___ _   _  ___ _ __   ___ _  __ _ 
| '_ ` _ \| | | |/ _ \/ __| __| '__/ _ \/ _` | '__| |  _| '__/ _ \/ __| | | |/ _ \ '_ \ / __| |/ _` |
| | | | | | |_| |  __/\__ \ |_| | |  __/ (_| | |    | | | | |  __/ (__| |_| |  __/ | | | (__| | (_| |
|_| |_| |_|\__,_|\___||___/\__|_|  \___|\__,_|_|    |_| |_|  \___|\___|\__,_|\___|_| |_|\___|_|\__,_|
                                                                                                     
%}

% Esta función utiliza la FFT para muestrear y analizar el comportamiento
% de las señales con el soporte hallado en la función "Tiempo_Tecla", lo
% que hace es determinar cuáles son tanto las frecuencias altas como las
% frecuencias bajas de los intervalos en los que se encuentran los números.%

function [Tecla] = Frecuencia_muestra(In,Fn,Sonido_entrada,Fs)

n = In:Fn-1; % In y Fn son los valores límite hallados gracias a la función 
             % Tiempo_Tecla.
N = length(n);
F_Sonido = fft(Sonido_entrada(n));
Ab_F = abs(F_Sonido);
Ab_F(1:62) = 0;     % Se utiliza este "filtro" para evitar tomar la 
                    % componente DC de las señales.
[~,Inx]= max(Ab_F(1:N/2));
Freq_alta = (Inx-1)*Fs/N;     % Determina si es una frecuencia alta
Ab_F(Inx-10:Inx+10)= 0;
[~,Inx]= max(Ab_F(1:N/2));    % Determina si es una frecuencia baja
Freq_baja = (Inx-1)*Fs/N;

if Freq_alta < Freq_baja      % Comprueba si las frecuencias altas y bajas
                              % están correctamente nombradas y en caso de
                              % que no, se intercambian.
    Aux = Freq_baja;
    Freq_baja = Freq_alta;
    Freq_alta = Aux;
end
[Tecla] = Tecla_muestra(Freq_alta,Freq_baja);
end

