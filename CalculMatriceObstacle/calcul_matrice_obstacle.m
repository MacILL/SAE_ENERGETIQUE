%%%%%%%%%%%% CALCUL DE LA MATRICE D'OBSTACLE %%%%%%%%%%
% Ce script permet de calculer si chacun des triangles d'un bâtiment
% reçoit la lumière du soleil ou bien s'il y a un obstacle entre 
%  chacun des triangles et le soleil pour chaque minute de la journée
% (minutes "conformes"=minutes où la mesure météo est valide) 
% Le résultat du calcul est stocké dans une matrice 
% Dimensions de la matrice: 
% autant de ligne que de triangles du bâtiment considéré
% autant de colonnes que de minutes "conformes"
% 29 janvier 2022
% Camille Dianoux

close all;

%récupération des données pour un jour particulier (via connexion au site)
[donnees_meteo] = recupere_meteo(date)

%chemin du fichier météo
chem='vlx20QC_1_22012020.txt'; 
ind_jour=1;



% sommets et triangles des bâtiments de la Part Dieu
configuration_part_dieu;
% paramètres (finesse de la tessellation par exemple)
configuration_scene;
% paramètres géométriques et thermiques du bâtiment
configuration_batiment;

%calcul du bâtiment
batim_tessele;

[Sommets_scene_complete, Triangles_scene_complete] = Insertion(Sommets_batiment, Triangles_batiment, Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu, 1);

[Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem, ind_jour);
 [indices_heure]=decoupage_bloc_heure(minutes_conforme);
pos_soleil=[];
 heure_decale=1;
 
 %%%%%%%%%%%% CALCUL DE LA MATRICE DES POSITIONS DU SOLEIL %%%%%%%%%
 % renvoit une matrice de trois colones (coordonnées du soleil)
 % avec autant de lignes que de minutes conformes 
 %%%%%%%%% Ce calcul peut être effectué une seule fois %%%%%%%%%%
    %for i=1:1:length(minutes_conforme) %pour calcul minute par minute
    for k=1:1:length(indices_heure)
        %calcul de l'heure et de la minute pour la fonction Calcul_position_soleil
        minute=indices_heure(k);
        m=rem(minute,60); %division euclidienne
        h=floor(minute/60)+heure_decale;
            if h<0
                h=24-abs(h); %empêche d'avoir des heures négatives
            end
            
        [position_soleil, hauteur_soleil, azimut_soleil]=Calcul_position_soleil([jour(1) jour(2) jour(3)],[h, m],coord);
        pos_soleil(k,:)=position_soleil;
       
    end
%plot3(pos_soleil(:,1), pos_soleil(:,2), pos_soleil(:,3))

display('taille Triangles_batiment')
display(size(Triangles_batiment,1))

%%%%%%%%%%% Calcul de la matrice d'obstacle pour un bâtiment tesselé %%%%%%
[matObstacle]=obstacle( Triangles_batiment, Sommets_batiment,  Triangles_scene_Part_Dieu, Sommets_scene_Part_Dieu,pos_soleil)
%Calcul de la matrice d'obstacle d'un bâtiment non tesselé
%[matObstacle]=obstacle( TBat, S,  Triangles_scene_Part_Dieu, Sommets_scene_Part_Dieu,pos_soleil)
