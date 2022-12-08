function [CanaletaH, CanaletaV] = CoordenadasCanaletas(Canaleta, DimCuadro, Carril)

[NCarril,NColCarril]=size(Carril); %NComp indica el numero de componentes que se indican

CanaletaV = [Canaleta/2 ;  DimCuadro(1)-Canaleta/2];

CanaletaH(1,1)=Canaleta/2;
for i=2: 1: NCarril+1 
    CanaletaH(i,1) = Carril(i-1,1)+Carril(i-1,2)/2+Canaleta/2;
end


end