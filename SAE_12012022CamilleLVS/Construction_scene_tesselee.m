function [TScene, SScene]=Construction_scene_tesselee(V1,G1,V2,G2,Vsol,aire_min_bat,aire_min_sol)

% Paramètres d'entrée: 
% Paramètres de sortis:
%TScene matrice des triangles tesselés des 2 bâtiments et du sol
%SScene matrice  regroupant les sommets  des 2 bâtiments et du sol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 11/01/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Donne les matrices regroupant:
%les sommets des deux bâtiments et du sol SBat1,SBat2,SSol
%les triangles où une ligne regroupe 3sommets du bâtiment et sol:TBat,TSol
[SBat1,SBat2,TBat,SSol,TSol]=Construction_S(V1,G1,V2,G2,Vsol);


%on rajoute une 4e colonne (le type) pour connaître où se trouve le
%triangle sur la facade du bâtiment
%posons: 1 sud; 2 est; 3 nord; 4 ouest; 5toit 6:autre bâtiment 0 sol

% Le type du batiment 1 avant tesselation
TypeBat1=[];
TriBat1=[];
for i=1:1:5
    TypeBat1=[TypeBat1;i*ones(2,1)];
end
%ajout de la 4e colonne : le type
TriBat1=[TBat,TypeBat1];

%Tesselation du bâtiment 1
[TriBat1,SomBat1,TypeBat1] = tesselle_type(TriBat1,SBat1,aire_min_bat);
%Aff_verification(SomBat1,TriBat1,Source)

%Tesselation du deuxième bâtiment
[TriBat2,SomBat2] = Tesselle(TBat,SBat2,aire_min_bat);
%Aff_verification(SomBat2,TriBat2,Source)

%Tesselation du sol
[Tri,Som] = Tesselle(TSol,SSol,aire_min_sol);

% On rassemble tout les sommets de tous les triangles
SScene=[SomBat1; SomBat2; Som];

%Concaténation
TriBat2=TriBat2+size(SomBat1,1);
Tri=Tri+size(SomBat1,1)+size(SomBat2,1);
TScene=[TriBat1;TriBat2; Tri];

TypeBat2=[6*ones(size(TriBat2,1),1)];

Type=[TypeBat1;TypeBat2;zeros(size(Tri,1),1)];
% size(TScene)
% size(Type)
TScene=[TScene,Type];

end