function [Posbornas]=PosicionesBornas(Posiciones) %Me dan matriz x*3 con las posiciones y que elemento es y devuelvo matriz x*4 con elemento, posicion x, posicion y borna 1, posicion y borna 2
    
    %Comp = [150 40 1; 15 60 2; 80 30 3; 25 70 4; 120 120 5; 48 60 6; 25 30 7; 80 30 8; 27 90 9; 200 70 10; 40 50 11]; %Datos para comprobacion
    %Posiciones=[95 55 1;177.5 55 2;225 55 3;277.5 55 4;80 170 5;164 70 6;200.5 170 7;253 170 8;306.5 170 9;120 285 10;240 285 11] %Datos para comprobacion
    ElemReg=5; %defino cuantos "elementos" componen la regleta
    elementos=size(Posiciones,1); % Saco numero de elementos sacando el numero de filas
    cont=0; %inicializo contador para tener en cuenta los elementos de la regleta mas tarde
    for i=1: elementos %bucle recorre las filas de las matrices
        if Posiciones(i,3)==9 %si el elemento que vemos es la regleta, que la he supuesto la 9 hacer:
            for n=0:ElemReg-1 %bucle que recorre todos los elementos de la regleta
                Posbornas(n,1)=Posiciones(i,3)+n; %Asignar el elemento a cada borna
                Posbornas(n,3)= Posiciones(i,2); %Asignar la coordenada y comun a todas las bornas
                for j=1: elementos %Bucle que recorre la matriz de dimensiones
                    if Comp(j,3)==Posiciones(i,3); %condicion de que el elemento de posiciones sea el de las dimensiones
                        Posbornas(n,2)= Posiciones(i,2)-Comp(j,1)/2+Comp(j,1)/(ElemReg*2)+(n*Comp(j,1))/ElemReg; %Asignar la coordenada x de cada una de las bornas
                    else

                    end             
                cont=cont+1; %Actualizar el contador
            end
        else %si no es la regleta hacer:  
            Posbornas(i+cont,1)=Posiciones(i,3); %Asignar el elemento
            Posbornas(i+cont,2)=Posiciones(i,1); %Asignar la coordenada x (igual en ambas bornas y a la del elemento)  
            for j=1: elementos %Bucle que recorre la matriz de dimensiones
                if Comp(j,3)==Posiciones(i,3); %condicion de que el elemento de posiciones sea el de las dimensiones
                    Posbornas(i+cont,3)=Posiciones(i,2)+Comp(j,2)/2; %Asignar la coordenada y borna 1
                    Posbornas(i+cont,4)=Posiciones(i,2)-Comp(j,2)/2; %Asignar la coordenada y borna 2
                else

            end
    end
end