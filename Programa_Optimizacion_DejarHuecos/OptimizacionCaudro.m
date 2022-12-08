clc
clear
close all

%Leemos los datos que se introducen en la excell
%DimCuadro = xlsread('Informacion_Cuadro.xlsx',1,'A:B'); %Vector 1 Fila 2 Columnas dimensiones cuadro Columna1=Ancho y  Columna2=Alto
DimComp = xlsread('Informacion_Cuadro.xlsx',1,'D:G'); %Matriz con las dimensiones de los componenes 
PosExt = xlsread('Informacion_Cuadro.xlsx',1,'I:J'); %Vector 1 Fila 2 Columnas coordenadas toma exterior Columna1=X y  Columna2=Y
Conexiones = xlsread('Informacion_Cuadro.xlsx',2,'A:F'); %Matriz con las dimensiones de los componenes 

%%
Canaleta = 40; %Indicar la dimensison de la canaleta
PRes = 85;
NCarriles = 3;

%%
[DimCuadro, NCompRes] = CalculoCuadro(DimComp, PRes, NCarriles, Canaleta)


%%
Orden = [14 13 12 11 10 9 8 7 6 5 4 3 0 0 0 0 2 1 0 0];

[CompOrd] = OrdenarComponentes(Orden, DimComp, NCompRes) %Función que ordena los componentes con el orden de introducir que se haya indicado

%%
[PosComp, Carril] = CalculoPosicionComponentes(DimCuadro, CompOrd, Canaleta) %Función que calcula la posición de los componentes según el orden que se ha indicado
[CanaletaH, CanaletaV] = CoordenadasCanaletas(Canaleta, DimCuadro, Carril) %Función que calcula las coordenadas de las canaletas de las horizontales en X y de las verticales en Y

%%
%RepresentarCuadro(Orden, CompOrd, PosComp)
RepresentarCuadro(CompOrd, PosComp, DimCuadro, Canaleta, CanaletaH, CanaletaV, Carril)