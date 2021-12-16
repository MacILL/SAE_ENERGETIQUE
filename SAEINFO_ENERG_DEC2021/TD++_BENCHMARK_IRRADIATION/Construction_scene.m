function [T, S]=Construction_scene(SBat1, TBat1 ,SBat2, TBat2, SSol, TSol, typeBat1, typeBat2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=1;

S=[SBat1; SBat2; SSol];

TBat2=TBat2+size(SBat1,1);
TSol=TSol+size(TBat1,1)+size(TBat2,1)
T=[TBat1;TBat2; TSol];

TypeBat=[ones(size(TBat1,1),1)*typeBat1;ones(size(TBat2,1),1)*typeBat2;0; 0]
if(FLAG_DEBUG==1)
    display('dimensions de TypeBat: ')
    display(size(TypeBat,1))
end
T=[T,TypeBat];


end