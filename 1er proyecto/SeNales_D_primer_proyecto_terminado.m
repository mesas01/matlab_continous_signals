%{
     _______. ___________.    _______     
    /       ||          |    |       \    
   |   (----` ---|  |----`   |  .--.  |   
    \   \        |  |        |  |  |  |   
.----)   |   _   |  |   __   |  '--'  |   
|_______/  (__)  |__|  (__)  |_______/    
%}


%Desarrollado por: Fabio Sánchez, Santiago Mesa y Juan Clavijo
%Proyecto 1 - Señales de Tiempo Discreto
%puede encontrar este y los demás proyectos en: https://github.com/jclavijomartinez/SeNalesTiempoDiscrerto2030
 
while 1%pone en repetición todo el codigo para poder usarlo cuantas veces se desee
 pause()%con esto se pausa la ejecución del progama y cuando presiones una tecla el programa continua
 %esto con el fin de poder ver el periodo de la señal del punto 2 sin que
 %se borre de inmediato
 clear all;%limpiar workspace
 clc;%limpiar comand window
 disp('Bienvenido al primer proyecto de aprendizaje de Señales de Tiempo Discreto');%se muestra en pantalla lo presentado en comillas
 disp('Desarrollado por: Fabio Sánchez, Santiago Mesa y Juan Clavijo');%se muestra en pantalla lo presentado en comillas
 disp('Digite "1" para el primer punto');%se muestra en pantalla lo presentado en comillas
 disp('Digite "2" para el segundo punto');%se muestra en pantalla lo presentado en comillas
 disp('Digite "3" para salir del código');%se muestra en pantalla lo presentado en comillas
 u = input('¿Cual punto desea ejecutar?: ');%se muestra en pantalla lo presentado en comillas y toma el valor digitado por el usuario

while 1%loop para el codigo
 switch u%switch para que el la opción que el usuario puso se ejecute

     case 1%en caso de que sea 1

         A=2; %defino la amplitud

         X=linspace(0,8*pi,1000); %creamos un vector con 1000 puntos equidistantes entre si, en el rango [0,8*pi]

         F=cos(X)-j*sin(X); %expreso la funcion exp en terminos de sin y cos

         Y=A*real(F); %le asigno a Y la parte real de la func. exp

         Z=A*imag(F); %le asigno a Z la parte imag de la func. exp

         figure %creamos la ventana de la figura

         plot3(X,Y,Z) %graficamos la señal en 3D

         hold on % mantenemos las propiedades del plot de la espiral, para que los otros plot3, no lo modifiquen

         plot3(X,Y,zeros(size(X))-2) % graficamos laparte real de la función en el plano 2d

         plot3(X,zeros(size(X))+2,Z) % graficamos la parte imag de la funcion en el plano 2d

         hold off % si pusieramos un plot3 debajo de este comando modificaría libremente la grafica de la espiral

         grid %le ponemos grilla

         xlabel('t(s)','FontSize',12,'FontWeight','bold','Color','r') %nombramos el eje tiempo (x)

         ylabel('Eje real','FontSize',12,'FontWeight','bold','Color','g') %nombramos el eje real (y)

         zlabel('Eje imaginario','FontSize',12,'FontWeight','bold','Color','b') %nombramos el eje imag. (z)

         title('Exponencial compleja') %agregamos titulo
        
         break;%comando para que se salga del bucle y no cause un loop infinito de la grafica dada
     
      case 2%en caso de que sea 2

         omega0=input('(recuerda usar un multiplo racional de pi, por ej: 5*pi/8) dame la frecuencia angular: ');%pedimos al usuario la freq. angular

         T=(2*pi)/omega0;%operacion para hallar el periodo con la freq. angular

         [N,m]= rat(T);%sacar la parte racional de la operacion

         if (m)==1%if para que muestre el valor dependiendo del resultado de la operación rat

         disp(['El valor del periodo de la señal discreta es: ', num2str(T)]);%desplegar en pantalla periodo discreto

         disp(['El valor del periodo de la señal continua es: ', num2str(T)]);%desplegar en pantalla periodo continuo

         else%opcion contraria si el racional de la operacion no es 1

         disp(['El valor del periodo de la señal discreta es: ', num2str(N)]);%desplegar en pantalla periodo discreto

         disp(['El valor del periodo de la señal continua es: ', num2str(T)]);%desplegar en pantalla periodo continuo

         end%fin del if, else

         t=[0:1/1000:3*N];%creación del vector t, representación en t.continuo

         n=[0:1:3*N];%creación del vector n, representación en t.discreto

         figure%creación de la ventana para graficar las figuras

         plot(t,sin(omega0*t),'m','LineWidth',1.2)%graficación de la señal en t.continuo

         hold on%mantenemos las propiedades del plot de la señal en t.continuo para que las otras señales plot no se modifiquen

         stem(n,sin(omega0*n),'. k','MarkerSize',15,'LineWidth',0.8)%graficas de la señal en t.discreto

         title('Representacion Grafica de las señales','FontSize',12,'FontWeight','bold','Color','b')%nombramos el titulo y lo ponemos con colores y tamaño de letra

         xlabel('Tres periodos de la señal en T.D','FontSize',12,'FontWeight','bold','Color','b') %nombramos el eje tiempo (x)y lo ponemos con colores y tamaño de letra

         ylabel('Amplitud de la Señal','FontSize',12,'FontWeight','bold','Color','b') %nombramos el eje real (y)y lo ponemos con colores y tamaño de letra

         hold off%soltar las propiedades de la grafica

         grid on%poner rejilla para visualizar mas facilmente los periodos
         break;%comando para que se salga del bucle y no cause un loop infinito de la grafica dada

     case 3%caso 3 para salir del programa
         return;%comando que se sale de todo el programa
         
     otherwise%opcion de lo contrario por si no se escoge opcion "1, 2 o 3"

         disp('ERROR!, esta no es una opcion valida digite "1, 2 o 3"');%se despliega lo que esta en pantalla y se regresa al inicio
         break;%comando para que se salga del bucle y no cause un loop infinito 
end%fin del switch 
end% fin del while 1 
end%fin del while 2    
