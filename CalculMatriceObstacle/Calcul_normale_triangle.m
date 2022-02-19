function Normale = Calcul_normale_triangle(A,B,C)
% Calcule les coordonnées de la normale au triangle ABC
% A,B,C : sommets des triangles

AC = C-A;
AB = B-A;

Normale = cross(AC,AB);

Normale = Normale/norm(Normale);

end