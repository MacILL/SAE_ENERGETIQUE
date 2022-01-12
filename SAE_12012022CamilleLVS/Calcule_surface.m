function S = calcule_surface(A,B,C)
% S = calcule_surface(A,B,C)
%
% A,B et C sont des vecteurs (1,3)
% S est un scalaire

% Définition des vecteurs du triangle
V1 = C-A;
V2 = B-A;

% Calcul de la surface en utilisant le produit vectoriel
S = (norm((cross(V1,V2))))/2;

end

