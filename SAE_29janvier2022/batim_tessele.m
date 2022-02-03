%construction d'un bâtiment tesselé
%à partir des dimensions (largeur, longueur, hauteur) et du centre de gravité, 
%ce script donne la matrice de triangle et de sommet du bâtiment.
%On peut faire varier la finesse de la tessellation grâce au paramètre
%d'aire.

%calcul des coordonnées du bâtiment
S= Batiment(longueur,hauteur,largeur,G1)

Aff_verification2(TBat, S)
%on rajoute une 4e colonne (le type) pour connaÃ®tre oÃ¹ se trouve le
%triangle sur la facade du bÃ¢timent
%posons: 1 sud; 2 est; 3 nord; 4 ouest; 5toit 6:autre bÃ¢timent 0 sol

% Le type du batiment 1 avant tesselation
TypeBat1=[];
TriBat1=[];
for i=1:1:5
    TypeBat1=[TypeBat1;i*ones(2,1)];
end
%ajout de la 4e colonne : le type
TriBat=[TBat,TypeBat1];
%tessellation du bâtiment, qui renvoie un numéro associé à chaque façade
[Triangles_batiment,Sommets_batiment,Type] = tesselle_type(TriBat,S,100)

Aff_verification2(Triangles_batiment,Sommets_batiment)