%% Ejemplo de primer filtro disenado
[xin fs] = audioread('Senal20201028H.wav');
[NumM1,NumC1]=size(xin);
Td=NumM1/fs;
Ts= 1/fs; % Tiempo de muestreo
N=Td/Ts; % N = fs*Td
t =[0:1/fs:Td-1/fs]; %Intervalo de tiempo
x = xin; % Señal sinusoidal
figure(1)
subplot(2,1,1)
plot(t,x,'Color', [1.0,0.5,1.0],'LineWidth',1);
grid on
ax = gca; ax.FontSize = 22;   
xf=fft(x);
subplot(2,1,2)
f=[0:1/Td:fs-1/Td];
%plot(f,abs(xf),'Color', [0.0,0.0,1.0],'LineWidth',2); % Magnitud de la FFT
stem(f,abs(xf)/N,'Color', [0.0,0.0,1.0],'LineWidth',1);
%stem(abs(xf),'Color', [0.0,0.0,1.0],'LineWidth',2);
grid on
ax = gca; ax.FontSize = 22;
[file ,path]=uigetfile('*.mat','Ingrese el .mat:');
yFir=filter(numB, xin); %Si se tienen los coeficientes
%yFir=filter(LPFFIRJH, xin); % Si se tiene el objeto
plot(t,yFir,'Color', [1.0,0.5,1.0],'LineWidth',1);