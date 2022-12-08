function [DimCuadro, NCompRes] = CalculoCuadro(DimComp, PRes, NCarriles, Canaleta)

ValMax = max(DimComp)

LTotal = 0;

for i=1: 1: ValMax(1,3)
    LTotal = LTotal + DimComp(i,1);
end

LTotalRes = LTotal*(1 + (PRes/100));

DimCuadro(1,1) = (LTotalRes/3) + 2*Canaleta;
DimCuadro(1,2) = (NCarriles + 1)*Canaleta + NCarriles*ValMax(1,2);

NCompRes = fix((LTotalRes - LTotal)/ValMax(1,1));
end