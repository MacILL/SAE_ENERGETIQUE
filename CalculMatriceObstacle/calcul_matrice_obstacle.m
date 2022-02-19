%%%%%%%%%%%% CALCUL DE LA MATRICE D'OBSTACLE %%%%%%%%%%
% Ce script permet de calculer si chacun des triangles d'un b�timent
% re�oit la lumi�re du soleil ou bien s'il y a un obstacle entre 
%  chacun des triangles et le soleil pour chaque minute de la journ�e
% (minutes "conformes"=minutes o� la mesure m�t�o est valide) 
% Le r�sultat du calcul est stock� dans une matrice 
% Dimensions de la matrice: 
% autant de ligne que de triangles du b�timent consid�r�
% autant de colonnes que de minutes "conformes"
% 29 janvier 2022
% Camille Dianoux

close all;

%r�cup�ration des donn�es pour un jour particulier (via connexion au site)
[donnees_meteo] = recupere_meteo(date)

%chemin du fichier m�t�o
chem='vlx20QC_1_22012020.txt'; 
ind_jour=1;



% sommets et triangles des b�timents de la Part Dieu
configuration_part_dieu;
% param�tres (finesse de la tessellation par exemple)
configuration_scene;
% param�tres g�om�triques et thermiques du b�timent
configuration_batiment;

%calcul du b�timent
batim_tessele;

[Sommets_scene_complete, Triangles_scene_complete] = Insertion(Sommets_batiment, Triangles_batiment, Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu, 1);

[Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem, ind_jour);
 [indices_heure]=decoupage_bloc_heure(minutes_conforme);
pos_soleil=[];
 heure_decale=1;
 
 %%%%%%%%%%%% CALCUL DE LA MATRICE DES POSITIONS DU SOLEIL %%%%%%%%%
 % renvoit une matrice de trois colones (coordonn�es du soleil)
 % avec autant de lignes que de minutes conformes 
 %%%%%%%%% Ce calcul peut �tre effectu� une seule fois %%%%%%%%%%
    %for i=1:1:length(minutes_conforme) %pour calcul minute par minute
    for k=1:1:length(indices_heure)
        %calcul de l'heure et de la minute pour la fonction Calcul_position_soleil
        minute=indices_heure(k);
        m=rem(minute,60); %division euclidienne
        h=floor(minute/60)+heure_decale;
            if h<0
                h=24-abs(h); %emp�che d'avoir des heures n�gatives
            end
            
        [position_soleil, hauteur_soleil, azimut_soleil]=Calcul_position_soleil([jour(1) jour(2) jour(3)],[h, m],coord);
        pos_soleil(k,:)=position_soleil;
       
    end
%plot3(pos_soleil(:,1), pos_soleil(:,2), pos_soleil(:,3))

display('taille Triangles_batiment')
display(size(Triangles_batiment,1))

%%%%%%%%%%% Calcul de la matrice d'obstacle pour un b�timent tessel� %%%%%%
[matObstacle]=obstacle( Triangles_batiment, Sommets_batiment,  Triangles_scene_Part_Dieu, Sommets_scene_Part_Dieu,pos_soleil)
%Calcul de la matrice d'obstacle d'un b�timent non tessel�
%[matObstacle]=obstacle( TBat, S,  Triangles_scene_Part_Dieu, Sommets_scene_Part_Dieu,pos_soleil)
