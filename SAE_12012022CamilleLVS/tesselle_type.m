function [Tri,Som,Type] = tesselle_type(Triangles,Sommets,aire)
% [Tri,Som] = tesselle(Triangles,Sommets,aire)
% Fonction de tessellation d'un ensemble de triangles jusqu'à une aire
% donnée.
% Version 1.2, Stanislas Antczak, Lucile Fraisse, Alice Gaboriau
%
% Sommets : matrice à  trois colonnes, 
% dans laquelle se trouvent des coordonnées de sommets.
% Triangles : matrice à  trois colonnes, où chaque ligne
% contient trois entiers strictements positifs étant les trois numéros de 
% ligne de la matrice Sommets contenant les coordonnées des sommets du
% triangle en question.
% aire : aire maximale tolérée des triangles après tessellation
% Som : matrice à 3 colonnes, contenant les coordonnées des  
% sommets des nouveaux triangles.
% Tri : matrice à 3 colonnes, contenant les triplets de numéros de
% sommets de la matrice Som définisssant les nouveaux triangles.
% On part du principe que les triangles sont repérés dans le sens horaire.

% Initialisations
Som=Sommets;                % Matrice de travail de sommets
Tri=Triangles(:,1:3) ;           % Matrice de travail de triangles
i=1;                        % Indice qui parcourt les lignes de la matrice Triangles
Type=Triangles(:,4);

% Boucle parcourant la matrice Tri, qui grossit au fur et à mesure de la
% tessellation.
while i<=size(Triangles,1)
    %size(Tri,1)
    %Calcule l'aire du triangle en question
    if Calcule_surface(Som(Tri(i,1),:),Som(Tri(i,2),:),Som(Tri(i,3),:))>aire
        
        % Pour chaque triangle, si son aire est supérieure à la limite,
        % alors on lui applique la tessellation.
        [T,S]=Tesselleunefois(i,Tri,Som);
        
        % La ligne du triangle découpé est remplacée par une ligne vide.
        % L'occurrence suivante de la boucle sera faite sur le triangle
        % suivant.
        Tri(i,:)=[];
        
        % Les coordonnées (S) et les triangles (T) produits par la
        % fonction tesselleunefois sont ajoutées à la fin de Som et Tri
        Som=[Som;S];
        Tri=[Tri;T];
        Type=[Type; Type(i)*ones(size(T,1),1)];
        Type(i,:)=[];
        
   
    else
        % Si le triangle est déjà assez petit, on avance d'une ligne
        i=i+1;
        
    end
   
end