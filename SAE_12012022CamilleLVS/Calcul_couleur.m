function Couleurs = Calcul_couleur(E_calib,T,S,Intensite,Penombre)

Couleurs=[];

%pour chaque triangle
for i=1:1:size(T,1)
couleur=Penombre+E_calib(i);
Couleurs=[Couleurs;couleur,couleur,couleur];
end
