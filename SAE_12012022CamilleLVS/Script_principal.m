%% Script de test d'�clairage d'un objet

% clear all;
% close all;
% disp('...')
% disp('Le calcul dure quelques secondes (2 � 10 suivant le PC)...')
% 
% %% D�finition de la sc�ne
% 
% Definition_scene; %--> Sommets, Triangles, Source, Intensite, ombre
% 
% %% Affichage objet non tessell� avec normales pour v�rification
% 
% Aff_verification(Sommets,Triangles,Source);
% drawnow
% 
% %% Tesselle ave aire maximale des triangles sp�cifi�e
% 
% aire=0.004;
% [Tri,Som]=Tesselle(Triangles,Sommets,aire);
% 
% %% Boucle principale

Tri=TScene;
Som=SScene;
Couleurs=[];

%Pour chaque triangle de sommets A B C, de centre de gravit� G
for i=1:size(Tri,1)
    
    A=Som(Tri(i,1),:);
    B=Som(Tri(i,2),:);
    C=Som(Tri(i,3),:);
    
    G=Centre_de_gravite(A,B,C);
    
    %Si le triangle est tourn� vers la source, alors on v�rifie si le rayon
    %source-G est en intersection avec un autre triangle 
    if Test_triangle_tourne_vers_source(A,B,C,Source)
    
        [test,~]=Calcul_Intersection_Objet(Tri,Som,Source,G);
        
        if ~test
            % S'il ne l'est pas, on calcule la couleur du triangle
            couleur=Penombre+Calcul_couleur_triangle(A,B,C,Source,Intensite);
            Couleurs=[Couleurs;couleur,couleur,couleur];
            
        else % s'il l'est on lui attribue du noir           
            
            Couleurs=[Couleurs;0,0,0];
        end
        
    else
        
        %Si le triangle n'est pas tourn� vers la source, sa couleur est
        %Penombre
        Couleurs=[Couleurs;Penombre,Penombre,Penombre];
    end
end

%% Affichage final

%Normalisation des valeurs des couleurs 
Couleurs=Couleurs/max(max(Couleurs));

%Affichage de l'objet �clair�
figure ; hold on

Aff_objet_eclaire(Couleurs,Tri,Som)

plot3(Source(1),Source(2),Source(3),'or')
view(-83,25)
axis equal