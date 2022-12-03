NComp = 11; %Indicar numero componenes a ordenar
AnchoCuadro = 340; %Indicar anchura del cuadro
AltoCuadro = 340; %Indicar altura del cuadro
Canaleta = 20; %Indicar la dimensison de la canaleta
Comp = [150 40; 15 60; 80 30; 25 70; 120 120; 48 60; 25 30; 80 30; 27 90; 200 70; 40 50 ]; %Matriz de las dimensiones de los componentes Columna1=AnchuraComponente, Columna2=AlturaComponente

LCarril = AnchoCuadro-2*Canaleta; %Calculamos la longitud maxima de la canaleta

PosComp = zeros(size(Comp)); %Inicializamos una matriz de ceros para rellenarla con las posiciones de los componentes Columna1=ComponenteX, Columna2=ComponenteY

%Asignamos posiciones del primer componente
PosComp(1,1) = Canaleta + Comp(1,1)/2; %Asignamos posición X
%Se emplea una matriz en la que almacenamos la información de los
%carriles
NCarril=1;
CompCarril=ones(1); %Creamos un vector que almacene los componentes que se encuentran en el carril
Carril(NCarril,1)= Canaleta + Comp(1,2)/2; %Indicamos la posición del carril 
Carril(NCarril,2)= Comp(1,2); %Indicamos el espacio del carril 1 (Altura)
PosComp(1,2) = Carril(NCarril,1); %Asignamos posición Y sabiendo que se encuentra en el carril 1

for i = 2: 1: NComp %Recorremos todas las filas de la matriz de uno en uno
    PosComp(i,1) = PosComp(i-1,1) + Comp(i-1,1)/2 + Comp(i,1)/2; %Asignamos posición X
	%Se comprueba si se sigue en el mismo carril o se empieza uno nuevo
	if PosComp(i,1)+Comp(i,1)/2-Canaleta <= LCarril %Si entra en el carril en el que estamos completando
        CompCarril(i)=i; 
        %Se comprueba si el componente entra en el carril en el que
        %nos encontramos
        if Carril(NCarril,2) < Comp(i,2) %Si no entra en la altura indicada en el carril en el que estamos
            %Hay que cambiar la altura del carril
            if NCarril == 1 %Si nos encontramos en el primer carril
                Carril(NCarril,1)= Canaleta + Comp(i,2)/2; %Actualizamos el valor de la posición del carril
                Carril(NCarril,2)= Comp(i,2); %Actualizamos el valor de la altura del carril
            else
                    Carril(NCarril,2)= Comp(i,2); %Actualizamos el valor de la altura del carril
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
        PosComp(i,1) = Canaleta + Comp(i,1)/2; %Reasignamos posición X
        Carril(NCarril,2)= Comp(i,2); %Damos el valor de la altura del nuevo carril
        Carril(NCarril,1)= Carril(NCarril-1,1) + Carril(NCarril-1,2)/2 + Canaleta + Carril(NCarril,2)/2; %Se calcula la posición Y del carril
        PosComp(i,2) = Carril(NCarril,1); %Asignamos la posición Y del componente
        CompCarril=ones(1);
        CompCarril(1)=i;
    end
end

PosComp