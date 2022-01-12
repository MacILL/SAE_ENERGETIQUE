%% Script de test d'éclairage d'un objet
%% Définition de la scène

% Definition_scene; %--> Sommets, Triangles, Source, Intensite, ombre
% 
% %% Affichage objet non tessellé avec normales pour vérification
% 
% Aff_verification(Sommets,Triangles,Source);
% drawnow
% 
% %% Tesselle ave aire maximale des triangles spécifiée
% 
% aire=0.004;
% [Tri,Som]=Tesselle(Triangles,Sommets,aire);

%% Boucle principale
Tri=TScene;
Som=SScene;
Couleurs=[];

%Pour chaque triangle de sommets A B C, de centre de gravité G
for i=1:size(Tri,1)
    
    A=Som(Tri(i,1),:);
    B=Som(Tri(i,2),:);
    C=Som(Tri(i,3),:);
    
    G=Centre_de_gravite(A,B,C);
    
    %Si le triangle est tourné vers la source, alors on vérifie si le rayon
    %source-G est en intersection avec un autre triangle 
    if Test_triangle_tourne_vers_source(A,B,C,Source)
    
        [test,~]=Calcul_Intersection_Objet(Tri,Som,Source,G);
        
        if ~test
            % S'il ne l'est pas, on calcule la couleur du triangle
            couleur=Penombre+i_fixee(i);
            Couleurs=[Couleurs;couleur,couleur,couleur];
            
        else % s'il l'est on lui attribue du noir           
            
            Couleurs=[Couleurs;0,0,0];
        end
        
    else
        
        %Si le triangle n'est pas tourné vers la source, sa couleur est
        %Penombre
        Couleurs=[Couleurs;Penombre,Penombre,Penombre];
    end
end

%% Affichage final

%Normalisation des valeurs des couleurs 
Couleurs=Couleurs/max(max(Couleurs));

%Affichage de l'objet éclairé
figure ; hold on

Aff_objet_eclaire(Couleurs,Tri(:,1:3),Som)

plot3(Source(1),Source(2),Source(3),'or')
view(-83,25)