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
 _           _            _   _  __ _                _               _            _       
(_)         | |          | | (_)/ _(_)              (_)             | |          | |      
 _ _ __   __| | ___ _ __ | |_ _| |_ _  ___ __ _  ___ _  ___  _ __   | |_ ___  ___| | __ _ 
| | '_ \ / _` |/ _ \ '_ \| __| |  _| |/ __/ _` |/ __| |/ _ \| '_ \  | __/ _ \/ __| |/ _` |
| | | | | (_| |  __/ | | | |_| | | | | (_| (_| | (__| | (_) | | | | | ||  __/ (__| | (_| |
|_|_| |_|\__,_|\___|_| |_|\__|_|_| |_|\___\__,_|\___|_|\___/|_| |_|  \__\___|\___|_|\__,_|
   
%}                                                                                      

% Esta función hace un muestro tanto de las frecuencias altas como de las
% frecuencias bajas y establece a qué número corresponden estas
% frecuencias, para esto, se asigna un valor "arbitrario" que corresponde
% a las frecuencias de los números y de las teclas * y #, finalmente
% verifica las frecuencias altas y bajas para devolver el número
% correspondiente.

function [Tecla] = Tecla_muestra(Freq_alta,Freq_baja) 

if ((Freq_baja>686) & (Freq_baja<708)) % Fija las frecuencias bajas en
                                       % determinados rangos para facilitar
                                       % su identificación.
   Freq_baja=697;
   
     elseif ((Freq_baja>758) & (Freq_baja<782))
        Freq_baja=770;
        
     elseif ((Freq_baja>839) & (Freq_baja<865))
        Freq_baja=852;
        
     elseif ((Freq_baja>926) & (Freq_baja<956))
        Freq_baja=941;
else
    msgbox('Frecuencia fuera de rango', 'Error','Corregir'); 
end

if ((Freq_alta>1190) & (Freq_alta<1228)) % Fija las frecuencias altas en
                                         % determinados rangos para
                                         % facilitar su identificación.
   Freq_alta=1209;
   
     elseif ((Freq_alta>1315) & (Freq_alta<1357))
        Freq_alta=1336;
        
     elseif ((Freq_alta>1454) & (Freq_alta<1500))
        Freq_alta=1477;
else
    msgbox('Frecuencia fuera de rango', 'Error','corregir');
end


switch(Freq_baja);  % Asigna los valores a las teclas dependiendo de sus
                    % frecuencias altas y bajas.
    
       case{697};
           switch(Freq_alta);
               case{1209};
                   Tecla='1';
               case{1336};
                   Tecla='2';
               case{1477};
                   Tecla='3';
           end
           
       case{770};
           switch(Freq_alta);
               case{1209};
                   Tecla='4';
               case{1336};
                   Tecla='5';
               case{1477};
                   Tecla='6';
           end
           
        case{852};
           switch(Freq_alta);
               case{1209};
                   Tecla='7';
               case{1336};
                   Tecla='8';
               case{1477};
                   Tecla='9';
           end
           
        case{941};
           switch(Freq_alta);
               case{1209};
                   Tecla='*';
               case{1336};
                   Tecla='0';
               case{1477};
                   Tecla='#';
           end
end



