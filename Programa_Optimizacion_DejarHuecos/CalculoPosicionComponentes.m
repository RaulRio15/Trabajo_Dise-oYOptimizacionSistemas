function [PosComp, Carril] = CalculoPosicionComponentes(DimCuadro, DimComp, Canaleta)

[NComp,NColComp]=size(DimComp); %NComp indica el numero de componentes que se indican
LCarril = DimCuadro(1,1)-2*Canaleta; %Calculamos la longitud maxima de la canaleta
PosComp = zeros(NComp,NColComp+1); %Inicializamos una matriz de ceros para rellenarla con las posiciones de los componentes Columna1=ComponenteX, Columna2=ComponenteY

%Asignamos posiciones del primer componente
PosComp(1,1) = Canaleta + DimComp(1,1)/2; %Asignamos posición X
%Se emplea una matriz en la que almacenamos la información de los
%carriles
NCarril=1;
CompCarril=ones(1); %Creamos un vector que almacene los componentes que se encuentran en el carril
Carril(NCarril,1)= Canaleta + DimComp(1,2)/2; %Indicamos la posición del carril 
Carril(NCarril,2)= DimComp(1,2); %Indicamos el espacio del carril 1 (Altura)
PosComp(1,2) = Carril(NCarril,1); %Asignamos posición Y sabiendo que se encuentra en el carril 1
PosComp(NCarril,3)= DimComp(1,3); %Indicamos el numero de componente
PosComp(NCarril,4)= NCarril; %Indicamos el numero de carril en el que se encuentra

for i = 2: 1: NComp %Recorremos todas las filas de la matriz de uno en uno
    PosComp(i,3) = DimComp(i,3); %Indicamos el numero de componente
    PosComp(i,1) = PosComp(i-1,1) + DimComp(i-1,1)/2 + DimComp(i,1)/2; %Asignamos posición X
	%Se comprueba si se sigue en el mismo carril o se empieza uno nuevo
	if PosComp(i,1)+DimComp(i,1)/2-Canaleta <= LCarril %Si entra en el carril en el que estamos completando
        PosComp(i,4)= NCarril; %Indicamos el numero de carril en el que se encuentra
        CompCarril(i)=i; 
        %Se comprueba si el componente entra en el carril en el que
        %nos encontramos
        if Carril(NCarril,2) < DimComp(i,2) %Si no entra en la altura indicada en el carril en el que estamos
            %Hay que cambiar la altura del carril
            if NCarril == 1 %Si nos encontramos en el primer carril
                Carril(NCarril,1)= Canaleta + DimComp(i,2)/2; %Actualizamos el valor de la posición del carril
                Carril(NCarril,2)= DimComp(i,2); %Actualizamos el valor de la altura del carril
            else
                    Carril(NCarril,2)= DimComp(i,2); %Actualizamos el valor de la altura del carril
                    Carril(NCarril,1)= Carril(NCarril-1,1) + Carril(NCarril-1,2)/2 + Canaleta + Carril(NCarril,2)/2; %Actualizamos el valor de la posición del carril
            end 
            
            %Hay que actualizar el valor de las Y de los componentes que
            %están en el carril que se ha modificado la altura  
            [nFil,NCompCarril]=size(CompCarril); %Creamos este paso intermedio para saber el núemro de componentes que se encuentran es esta fila
            for j=CompCarril(1): 1: CompCarril(NCompCarril) %Recorremos todos los componentes del carril para modificar su coordenada Y
                PosComp(j,2)=Carril(NCarril,1);
            end 
        else
            PosComp(i,2) = Carril(NCarril,1); %Asignamos posición Y del carril en el que nos encontramos 
        end  
             
    else %Si no entra en el carril que estamos completando saltamos de carril
        NCarril = NCarril+1;
        PosComp(i,1) = Canaleta + DimComp(i,1)/2; %Reasignamos posición X
        Carril(NCarril,2)= DimComp(i,2); %Damos el valor de la altura del nuevo carril
        Carril(NCarril,1)= Carril(NCarril-1,1) + Carril(NCarril-1,2)/2 + Canaleta + Carril(NCarril,2)/2; %Se calcula la posición Y del carril
        PosComp(i,2) = Carril(NCarril,1); %Asignamos la posición Y del componente
        PosComp(i,4)= NCarril; %Indicamos el numero de carril en el que se encuentra
        
        CompCarril=ones(1); %Reiniciamos la matriz en la que se almacenan los componentes del carril
        CompCarril(1)=i;
    end
end

end
