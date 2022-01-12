function[couleur] = Calcul_couleur_triangle(A,B,C,Source,intensite)
%[couleur] = Calcul_couleur_triangle(A,B,C,Source,intensite)
%couleur renvoie un nombre entre 0 et intensite, valeur maximale de
%r�f�rence
%A,B,C sont les coordon�es des sommets du triangle et Source les
%coordonn�es de la Source
% Fonction cr��e modifi�e par S. Antczak, L. Fraisse, A. Gaboriau

%Calcul du centre de gravit� G du triangle
G = Centre_de_gravite(A,B,C);

%Coordonn�es et norme du vecteur source-G
vecteur_rayon = Source-G;
d = norm(vecteur_rayon);

%Calcul de la normale ext�rieure au triangle (suppos�e de norme 1)
normale = Calcul_normale_triangle(A,B,C);

%Cosinus de l'angle entre la normale et le rayon
costheta = dot(vecteur_rayon,normale)/d;

%Calcul de la couleur
couleur = intensite*costheta/(d^2);
end