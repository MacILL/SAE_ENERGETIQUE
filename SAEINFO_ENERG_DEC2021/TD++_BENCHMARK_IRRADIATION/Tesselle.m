function [Tri,Som] = tesselle(Triangles,Sommets,aire)
% [Tri,Som] = tesselle(Triangles,Sommets,aire)
% Fonction de tessellation d'un ensemble de triangles jusqu'� une aire
% donn�e.
% Version 1.2, Stanislas Antczak, Lucile Fraisse, Alice Gaboriau
%
% Sommets : matrice � trois colonnes, 
% dans laquelle se trouvent des coordonn�es de sommets.
% Triangles : matrice � trois colonnes, o� chaque ligne
% contient trois entiers strictements positifs �tant les trois num�ros de 
% ligne de la matrice Sommets contenant les coordonn�es des sommets du
% triangle en question.
% aire : aire maximale tol�r�e des triangles apr�s tessellation
% Som : matrice � 3 colonnes, contenant les coordonn�es des  
% sommets des nouveaux triangles.
% Tri : matrice � 3 colonnes, contenant les triplets de num�ros de
% sommets de la matrice Som d�finisssant les nouveaux triangles.
% On part du principe que les triangles sont rep�r�s dans le sens horaire.

% Initialisations
Som=Sommets;                % Matrice de travail de sommets
Tri=Triangles;              % Matrice de travail de triangles
i=1;                        % Indice qui parcourt les lignes de la matrice Triangles

% Boucle parcourant la matrice Tri, qui grossit au fur et � mesure de la
% tessellation.
while i<=size(Tri,1)
    
    %Calcule l'aire du triangle en question
    if Calcule_surface(Som(Tri(i,1),:),Som(Tri(i,2),:),Som(Tri(i,3),:))>aire
        
        % Pour chaque triangle, si son aire est sup�rieure � la limite,
        % alors on lui applique la tessellation.
        [T,S]=Tesselleunefois(i,Tri,Som);
        
        % La ligne du triangle d�coup� est remplac�e par une ligne vide.
        % L'occurrence suivante de la boucle sera faite sur le triangle
        % suivant.
        Tri(i,:)=[];
        
        % Les coordonn�es (S) et les triangles (T) produits par la
        % fonction tesselleunefois sont ajout�es � la fin de Som et Tri
        Som=[Som;S];
        Tri=[Tri;T];
        
    else
        % Si le triangle est d�j�assez petit, on avance d'une ligne
        i=i+1;
        
    end
end