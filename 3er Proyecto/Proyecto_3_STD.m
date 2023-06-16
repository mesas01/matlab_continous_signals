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
___  ___      _       
|  \/  |     (_)      
| .  . | __ _ _ _ __  
| |\/| |/ _` | | '_ \ 
| |  | | (_| | | | | |
\_|  |_/\__,_|_|_| |_|

%}

% Este es el Script principal, para ejecutar el programa solo es necesario
% correr este archivo.

clear all;
while 1

disp(' ');
disp('Proyecto de aprendizaje #3')
disp(' ');
disp('Desarrollado por: Santiago Mesa y Yohany Quintero')
disp(' ');
disp('El programa se ha pausado, si desea continuar con el siguiente archivo presione 1');
disp('De lo contrario presione 2 para cerrar el programa');
disp(' ');
opcion = input('Opción: ')
switch opcion
    case 1

close all;
clear all;
clc;


[Sonido_entrada,Fs] = Leer_archivo();   % Ejecuta la función encargada de 
                                        % mostrarle al usuario los audios
                                        % para que este escoja el que desea
                                        % procesar.

N = length(Sonido_entrada);             % Tamaño del audio de entrada
Mtx = Tiempo_tecla(Sonido_entrada, N);  % Crea la matriz que contiene las 
                                        % posiciones que nos interesa
                                        % procesar.

for i=1:(length(Mtx(:,1)))  % Recorre la función que permite "filtrar" el 
                            % audio para encontrar los intervalos en los
                            % que se presionan las teclas.
    [Tecla(i)] = Frecuencia_muestra(Mtx(i,1),Mtx(i,2),Sonido_entrada,Fs);
end
soundsc(Sonido_entrada,Fs);             % Reproduce el archivo de Audio 
                                        % seleccioanado.
                                    
disp('El número marcado es:');          
disp(Tecla);                            % Despliega en la ventana de 
                                        % comandos el número encontra
disp('El programa se ha pausado para poder desplegar el numero de manera indefinida');
disp('Para continuar presione cualquier tecla');
pause
    case 2
        clear all
        clc
        break
end
end
                                                    
                                        