%construction d'un b�timent tessel�
%� partir des dimensions (largeur, longueur, hauteur) et du centre de gravit�, 
%ce script donne la matrice de triangle et de sommet du b�timent.
%On peut faire varier la finesse de la tessellation gr�ce au param�tre
%d'aire.

%calcul des coordonn�es du b�timent
S= Batiment(longueur,hauteur,largeur,G1)

Aff_verification2(TBat, S)
%on rajoute une 4e colonne (le type) pour connaître où se trouve le
%triangle sur la facade du bâtiment
%posons: 1 sud; 2 est; 3 nord; 4 ouest; 5toit 6:autre bâtiment 0 sol

% Le type du batiment 1 avant tesselation
TypeBat1=[];
TriBat1=[];
for i=1:1:5
    TypeBat1=[TypeBat1;i*ones(2,1)];
end
%ajout de la 4e colonne : le type
TriBat=[TBat,TypeBat1];
%tessellation du b�timent, qui renvoie un num�ro associ� � chaque fa�ade
[Triangles_batiment,Sommets_batiment,Type] = tesselle_type(TriBat,S,100)

Aff_verification2(Triangles_batiment,Sommets_batiment)