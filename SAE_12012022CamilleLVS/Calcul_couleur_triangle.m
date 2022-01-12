function[couleur] = Calcul_couleur_triangle(A,B,C,Source,intensite)
%[couleur] = Calcul_couleur_triangle(A,B,C,Source,intensite)
%couleur renvoie un nombre entre 0 et intensite, valeur maximale de
%référence
%A,B,C sont les coordonées des sommets du triangle et Source les
%coordonnées de la Source
% Fonction créée modifiée par S. Antczak, L. Fraisse, A. Gaboriau

%Calcul du centre de gravité G du triangle
G = Centre_de_gravite(A,B,C);

%Coordonnées et norme du vecteur source-G
vecteur_rayon = Source-G;
d = norm(vecteur_rayon);

%Calcul de la normale extérieure au triangle (supposée de norme 1)
normale = Calcul_normale_triangle(A,B,C);

%Cosinus de l'angle entre la normale et le rayon
costheta = dot(vecteur_rayon,normale)/d;

%Calcul de la couleur
couleur = intensite*costheta/(d^2);
end