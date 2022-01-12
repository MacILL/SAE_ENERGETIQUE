function [TScene, SScene]=Construction_scene_tesselee_bis(V1,G1,V2,G2,Vsol,aire, TEST_DEBUG)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(TEST_DEBUG==1)
    display('==== fonction Construction_scene_tesselee_bis ====')
end

%Donne les matrices refroupant:
%les sommets des deux bâtiments et du sol SBat1,SBat2,SSol
%les triangles où une ligne regroupe 3sommets du bâtiment et sol:TBat,TSol
[SBat1,SBat2,TBat,SSol,TSol]=Construction_S(V1,G1,V2,G2,Vsol);

[TriBat1,SomBat1] = Tesselle(TBat,SBat1,aire);
[TriBat1,SomBat2] = Tesselle(TSol,SBat2,aire);
[Tri,Som] = Tesselle(TSol,SSol,aire);

SScene=[SomBat1; SomBat2; Som];

TBat2=TriBat1+size(SomBat1,1);
Tri=Tri+size(SomBat1,1)+size(SomBat2,1);
T=[TriBat1;TBat2; Tri];

%pour le batiment 
% est rangé dans l'ordre pour chaque facade qui comporte deux triangles donc
%de même orientation
%posons: 1devant; 2droite; 3derrière; 4gauche; 5toit 6:autre bâtiment
% 0 sol

TypeBat1=[];
for i=1:1:5
    TypeBat1=[TypeBat1;i*ones(2,1)];
end
TypeBat2=[6*ones(size(TriBat1,1),1)];
Type=[TypeBat1;TypeBat2;zeros(size(Tri,1),1)];

if(TEST_DEBUG==1)
    display('dimension de T')
    display(size(T))
        display('dimension de Type')
    display(size(Type))
end

TScene=[T,Type];

end