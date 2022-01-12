function [e] = Calcul_eclairement(A,B,C,S)
%[e] = Calcul_eclairement(A,B,C,S)
% Calcul_eclairement
% Dianoux Camille, Gbaguidi Benjamin, Qian Céline
% 12/10/2021
%Version 1.0
%Fonction qui calcule l'intensité de l'éclairement reçu par un triangle 
% en fonction de son orientation par rapport au soleil
%  paramètre d'entrée :coordonnées des points A B C (sommets du triangle)
%  et S (coordonnées de la source)
%  paramètre de sortie: valeur de l'éclairement (normalisée)

G=Centre_de_gravite(A,B,C);
normale=Calcul_normale_triangle(A,B,C);
rayon =S-G;
e = dot(rayon,normale)/norm(rayon);
end

