function [] = RepresentarCuadro(CompOrd, PosComp, DimCuadro, Canaleta, CanaletaH, CanaletaV, Carril)


[NComp,NColComp]=size(CompOrd); %NComp indica el numero de componentes que se indican
[NCan,NColCan]=size(CanaletaH); %NComp indica el numero de canaletas que se indican
[NCarr,NColCarr]=size(Carril); %NComp indica el numero de carriles que se indican
CordComp = zeros(NComp, 5);

for i=1: 1: NComp
    CordComp(i,1) = PosComp(i,1) - CompOrd(i,1)/2;  %Asignamos coordenada 1 X1
    CordComp(i,2) = PosComp(i,2) - CompOrd(i,2)/2;  %Asignamos coordenada 2 Y1
    CordComp(i,3) =  CompOrd(i,1);  %Asignamos coordenada 3 X2
    CordComp(i,4) =  CompOrd(i,2);  %Asignamos coordenada 4 Y2
    CordComp(i,5) = CompOrd(i,3); %Asignamos el numero de componente
end

figure
grid on;
hold on;
rectangle('Position',[0 0 DimCuadro(1,1) DimCuadro(1,2)],'EdgeColor','k','LineWidth',3)
axis([0 DimCuadro(1,1) 0 DimCuadro(1,2)])
title('Posiciones de los componentes en el cuadro');
xlabel('X [mm]'); ylabel('Y [mm]');

for i=1: 1: 2
   rectangle('Position',[CanaletaV(i,1)-Canaleta/2, 0, Canaleta, DimCuadro(1,2)],'EdgeColor','r','LineWidth',1)
end

for i=1: 1: NCan
   rectangle('Position',[Canaleta, CanaletaH(i,1)-Canaleta/2, DimCuadro(1,1)-2*Canaleta, Canaleta],'EdgeColor','r','LineWidth',1)
end

for i=1: 1: NCarr
    x = [Canaleta, DimCuadro(1,1)-Canaleta];
    y = [Carril(i,1), Carril(i,1)];
    line(x,y,'Color','red','LineStyle','--')
end

for i=1: 1: NComp
   rectangle('Position',[CordComp(i,1) CordComp(i,2) CordComp(i,3) CordComp(i,4)],'EdgeColor','b','LineWidth',2)
end




end



