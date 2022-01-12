function [T, S]=Construction_scene_bis(V1,G1,V2,G2,Vsol)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Derni�re modification 08/01/2022
%Version 2.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Donne les matrices refroupant:
%les sommets des deux bâtiments et du sol SBat1,SBat2,SSol
%les triangles où une ligne regroupe 3sommets du bâtiment et sol:TBat,TSol
[SBat1,SBat2,TBat,SSol,TSol]=Construction_S(V1,G1,V2,G2,Vsol);

S=[SBat1; SBat2; SSol];

TBat2=TBat+size(SBat1,1);
TSol=TSol+size(SBat1,1)+size(SBat2,1);
T=[TBat;TBat2; TSol];

%pour le batiment 
% est rangé dans l'ordre pour chaque facade qui comporte deux triangles donc
%de même orientation
%posons: 1SUD; 2EST; 3NORD; 4OUEST; 5toit 
%6:autre bâtiment
% 0 sol

TypeBat1=[];
for i=1:1:5
    TypeBat1=[TypeBat1;i*ones(2,1)];
end

TypeBat2=[6*ones(size(TBat,1),1)];

Type=[TypeBat1;TypeBat2;zeros(size(TSol,1),1)];

T=[T,Type];
end