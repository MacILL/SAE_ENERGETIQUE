function[test] = Test_triangle_tourne_vers_source(A,B,C,Source)
%[test] = Test_triangle_tourne_vers_source(A,B,C,Source)
%test est un booleen qui renvoie 0 ou 1, 1 si face �clair�e 0 sinon
%A,B,C sont les coordon�es des sommets du triangle et Source les
%coordonn�es et l'intensit� de l'�clairement de la Source

% Centre de gravit� du triangle
G = Centre_de_gravite(A,B,C);

% Vecteur G-Source
xVR = Source(1)-G(1);
yVR = Source(2)-G(2);
zVR = Source(3)-G(3);

% Vecteur_rayon est le vecteur du rayon de G vers la source
vecteur_rayon = [xVR yVR zVR];

normale = Calcul_normale_triangle(A,B,C);

test = false;
if dot(vecteur_rayon,normale) > 0
    test = true;
end