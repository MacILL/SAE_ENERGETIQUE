%% Boucle principale
%function Couleurs=test_couleur_triangle(TScene,SScene,Source,Intensite,Intensite)

Couleurs=[];

%Pour chaque triangle de sommets A B C, de centre de gravité G
for i=1:size(TScene,1)
    
    A=SScene(TScene(i,1),:);
    B=SScene(TScene(i,2),:);
    C=SScene(TScene(i,3),:);
    
    G=Centre_de_gravite(A,B,C);
    
    %Si le triangle est tourné vers la source, alors on vérifie si le rayon
    %source-G est en intersection avec un autre triangle 
    if Test_triangle_tourne_vers_source(A,B,C,Source)
    
        [test,~]=Calcul_Intersection_Objet(TScene,SScene,Source,G);
        
        if ~test
            % S'il ne l'est pas, on calcule la couleur du triangle
            couleur=Penombre+Calcul_couleur_triangle(A,B,C,Source,Intensite);
            Couleurs=[Couleurs;couleur,couleur,couleur];
            
        else % s'il l'est on lui attribue du noir           
            
            Couleurs=[Couleurs;0,0,0];
        end
        
    else
        
        %Si le triangle n'est pas tourné vers la source, sa couleur est
        %Penombre
        Couleurs=[Couleurs;Penombre,Penombre,Penombre]
    end
end

%% Affichage final

%Normalisation des valeurs des couleurs 
Couleurs=Couleurs/max(max(Couleurs));

%Affichage de l'objet éclairé 
plot3(Source(1),Source(2),Source(3),'or')
hold on
Aff_objet_eclaire(Couleurs,TScene(:,1:3),SScene)

view(-83,25)
axis equal