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
                                           _             
                                          | |            
  ___ _ __ ___  __ _ _ __  __   _____  ___| |_ ___  _ __ 
 / __| '__/ _ \/ _` | '__| \ \ / / _ \/ __| __/ _ \| '__|
| (__| | |  __/ (_| | |     \ V /  __/ (__| || (_) | |   
 \___|_|  \___|\__,_|_|      \_/ \___|\___|\__\___/|_| 

%}

% Esta función toma el Audio de entrada y analiza las muestras para poder
% ver entre qué valores se encuentran los valores de las señales que
% necesitamos identificar.

function [Mtx] = Tiempo_tecla(Sonido_entrada, N)

Limites = 1;
i = 1;

while Limites <= N      % Crea una matriz con intervalos de 2000 muestras 
                        % que contienen la información de los números
                        % digitados y que empiezan después de 500 muestras 
                        % a partir de la primera señal con una magnitud 
                        % mayor de 0,04, mientras que crea intervalos de 
                        % 5000 que "salta" para evitar tomar tanto "ruido".
                        % Cabe aclarar que estos valores son toltamente
                        % arbitrarios y se obtuvieron a través de prueba y
                        % error.
                        
    if ( abs(Sonido_entrada(Limites)) > 0.04)
        Mtx(i,1) = Limites+500;         
        Mtx(i,2) = Limites+2500;
        i = i + 1;
        Limites = Limites + 5001;
    else
    Limites = Limites + 1;
    end
end

end

