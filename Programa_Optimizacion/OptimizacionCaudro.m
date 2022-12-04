clc
clear
close all

%Leemos los datos que se introducen en la excell
DimCuadro = xlsread('Inforrmacion_Cuadro.xlsx',1,'A3:B3'); %Vector 1 Fila 2 Columnas dimensiones cuadro Columna1=Ancho y  Columna2=Alto
DimComp = xlsread('Inforrmacion_Cuadro.xlsx',1,'D3:G13'); %Matriz con las dimensiones de los componenes 

Canaleta = 20; %Indicar la dimensison de la canaleta

%%
Orden = [1 2 3 4 5 6 7 8 9 10 11];

[CompOrd] = OrdenarComponentes(Orden, DimComp) %Función que ordena los componentes con el orden de introducir que se haya indicado
[PosComp, Carril] = CalculoPosicionComponentes(DimCuadro, CompOrd, Canaleta) %Función que calcula la posición de los componentes según el orden que se ha indicado
[CanaletaH, CanaletaV] = CoordenadasCanaletas(Canaleta, DimCuadro, Carril) %Función que calcula las coordenadas de las canaletas de las horizontales en X y de las verticales en Y

%%
%RepresentarCuadro(Orden, CompOrd, PosComp)
RepresentarCuadro(CompOrd, PosComp, DimCuadro, Canaleta, CanaletaH, CanaletaV, Carril)