function Aff_objet_eclaire(couleurs,triangles,sommets)
%Aff_objet_eclaire(couleurs,triangles,sommets)
%Affiche l'objet avec les bonnes couleurs correspondant eclairement source
%
%Paramètres d'entrée: sommets(matrice) triangles(matrice des indices des
%sommets) couleurs (matrice de triplet RVB associé aux triangles)
%
%Par Afnan, Matthias et Alain   Version 3.26  14/10/2020

%plot3(sommets(:,1),sommets(:,2),sommets(:,3),'ob')
hold on

for i= 1:length(couleurs)
    patch('Faces',triangles(i,:),'Vertices',sommets,'Facecolor',couleurs(i,:),'LineStyle','none')
end

