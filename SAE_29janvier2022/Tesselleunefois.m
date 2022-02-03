function [Tri,Som] = tesselleunefois(n,Triangles,Sommets)
% [Tri,Som] = tesselleunefois(n,Triangles,Sommets)
% Fonction qui "tesselle une fois" un triangle donn�, c'est-�-dire qui 
% renvoie quatre triangles obtenus en coupant le triangle donn� par les
% milieux de ses c�t�s.
% Version 0.0, Par Stanislas Antczak, Lucile Fraisse, Alice Gaboriau
%
% Sommets : matrice à trois colonnes, 
% dans laquelle se trouvent des coordonn�es de sommets.
% Triangles : matrice � trois colonnes, o� chaque ligne
% contient trois entiers strictements positifs �tant les trois num�ros de 
% ligne de la matrice Sommets contenant les coordonn�es des sommets du
% triangle en question.
% n : entier, num�ro de ligne de la matrice Triangles, c'est la r�f�rence
% du triangle qu'on va tesseller une fois.
% Som : matrice 6 lignes, 3 colonnes, contenant les coordonn�es des six 
% sommets des nouveaux triangles (trois sommets de l'ancien, trois
% milieux).
% Tri : matrice 4 lignes, 3 colonnes, contenant les triplets de num�ros de
% sommets de la matrice Som d�finisssant les quatre nouveaux triangles.
% On part du principe que les triangles sont rep�r�s dans le sens horaire.

% D�finition des points A B C sommets du grand triangle
mon_triangle=Triangles(n,:);
A=Sommets(mon_triangle(1),:);
B=Sommets(mon_triangle(2),:);
C=Sommets(mon_triangle(3),:);

% Calcul des points milieux des c�t�s du grand triangle
a=(B+C)/2;      % a milieu de [BC]
b=(A+C)/2;      % b milieu de [AC]
c=(A+B)/2;      % c milieu de [AB]

% D�finition de la matrice additionnelle de sommets
Som=[a;b;c];

% Nombre de sommets avant ajout
nbsom=size(Sommets,1);

% D�finition de la matrice additionnelle de triangles
Tri=[mon_triangle(1),nbsom+3,nbsom+2;     % triangle Acb
     mon_triangle(2),nbsom+1,nbsom+3;     % triangle Bac
     mon_triangle(3),nbsom+2,nbsom+1;     % triangle Cba
     nbsom+1,nbsom+2,nbsom+3];            % triangle abc
end

