function [CompOrd] = OrdenarComponentes(Orden, DimComp)

CompOrd = zeros(size(DimComp)); %Inicializamos la matriz que va a dar los componentes ordenados
[NComp,NColComp]=size(DimComp); %NComp indica el numero de componentes que se indican

for i=1: 1: NComp
    for j=1: 1: NComp
        if Orden(i) == DimComp(j,3)
            CompOrd(i,:)=DimComp(j,:);
        end
    end
end

end
