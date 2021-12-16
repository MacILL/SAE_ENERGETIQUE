function Normale = Calcul_normale_triangle(A,B,C)
% Normale = calcul_normale(A,B,C)
%
% Calcule les coordonnées de la normale au triangle ABC
%
% A,B,C et Normale sont des vecteurs (1,3)

AC = C-A;
AB = B-A;

Normale = cross(AC,AB);

Normale = Normale/norm(Normale);

end