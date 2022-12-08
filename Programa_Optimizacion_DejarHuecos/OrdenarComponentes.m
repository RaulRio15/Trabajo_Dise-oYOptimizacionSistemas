function [CompOrd] = OrdenarComponentes(Orden, DimComp, NCompRes)

[NComp,NColComp]=size(DimComp); %NComp indica el numero de componentes que se indican
CompOrd = zeros(NComp+NCompRes, NColComp); %Inicializamos la matriz que va a dar los componentes ordenados
CompRes = [30 50 0]; %Dimensiones Componente Reserva

[NOrden,NColOrden]=size(Orden);

if NColOrden < (NComp+NCompRes)
    for i=NColOrden+1 : 1: (NComp+NCompRes)
        Orden(i) = 0;
    end
end

for i=1: 1: NComp+NCompRes
    if Orden(i) == 0
        CompOrd(i,1) = CompRes(1,1);
        CompOrd(i,2) = CompRes(1,2);
        CompOrd(i,3) = CompRes(1,3);
    else
        for j=1: 1: NComp
            if Orden(i) == DimComp(j,3)
                CompOrd(i,:)=DimComp(j,:);
            end
        end
    end
end

end
