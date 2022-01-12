%TD++ 
% 1) construire la scène 3D;
% 2) calculer la position du soleil (au sein de la fonction calibration);
% 3) calculer l'éclairement d'un triangle (au sein de la fonction irradiation);
% 4) calibrer le résultat pour qu'il représente un éclairement énergétique.
%Auteurs Dianoux, Gbaguidi, Qian
%Date 07/12
%Derni�re modification 10 janvier 2022 Camille

clear all;
close all;

configuration_scene

%STEP 1
%Renvoie une matrice 
%sommet S qui concatène deux matrices sommets des deux bâtiments et sol
%triangle T qui concatène deux matrices triangles des deux bâtiments et sol
%avec identification du type de matériaux pour la 4e colonne de T
[T, S]=Construction_scene_bis(V1,G1,V2,G2,Vsol);

%%%%%%%TEST AVEC BATIMENT NON TESSELLE
TScene=T;
SScene=S;

%Aff_verification2(S,T(:,1:3))

%après tessellation du sol:
%[TScene, SScene]=Construction_scene_tesselee(V1,G1,V2,G2,Vsol,aire_min_bat,aire_min_sol)
%Aff_verification2(SScene_sol,TScene_sol(:,1:3))
%Aff_verification(SScene_sol,TScene_sol(:,1:3),Source)

%tesselation du sol et du batiment
%[TScene, SScene]=Construction_scene_tesselee_bis(V1,G1,V2,G2,Vsol,aire_min_bat, 1);
%Aff_verification(SScene,TScene,Source)
%Aff_verification(SScene,TScene(:,1:3),Source)

%test avec le script final donné sur moodle pour voir les bâtiments et sol
%selon la position de la source
%Script_principal


%STEP3



%STEP4 
%Chemin du fichier de mesures météo
%chemin relatif : chem='../../vlx20QC_1_22012020.txt'
chem='vlx20QC_1_22012020.txt';

% génération de vecteurs de donnée conforme (suppression des valeurs aberrantes)
% et stockage des minutes correspondantes
[Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem, ind_jour);

%Calibration de l'éclairement en fonction des heures du jour
[Eclairement_calibre, pos_soleil]=calibration_E(Eeg_conforme, Eed_conforme, minutes_conforme, jour,coord, decalage_heure);
 
IrrSUD=[]; nb_facadeSUD=0;
IrrEST=[]; nb_facadeEST=0;
IrrNORD=[]; nb_facadeNORD=0;
IrrOUEST=[]; nb_facadeOUEST=0;

%BOUCLE SUR LES TRIANGLES DU BATIMENT TESSELLE
for ind_triangle=1:1:size(TScene,1)
    %Si obstacle, pas de calcul
        %if ~(Calcul_Intersection_Objet()) %%� compl�ter!!
    %donne l'intensité lumineuse d'un triangle par min pour 24heures
    %il y a 24*60 valeurs moins les valeurs aberrantes
    [Irradiation]=irradiation(Eclairement_calibre,Eed_conforme, pos_soleil, TScene,SScene,ind_triangle,0); 
    % calcul des valeurs moyennes d'irradiation par blocs temporels
    % On obtient une valeur moyenne par heure de la journ�e
    [Irr_moy]=moyennage(Irradiation,minutes_conforme);
    %Stockage des valeurs d'irradiations moyennes par bloc d'une heure
    %Pour la fa�ade SUD
        if( TScene(ind_triangle,4)==1 )
            IrrSUD=[IrrSUD Irr_moy'];
            nb_facadeSUD=nb_facadeSUD+1;
        end
    %Pour la fa�ade EST
        if( TScene(ind_triangle,4)==2 )
            IrrEST=[IrrEST Irr_moy'];
            nb_facadeEST=nb_facadeEST+1;
        end
    %Pour la fa�ade NORD
        if( TScene(ind_triangle,4)==3 )
            IrrNORD=[IrrNORD Irr_moy'];
            nb_facadeNORD=nb_facadeNORD+1;
        end
   %Pour la fa�ade OUEST
        if( TScene(ind_triangle,4)==4 )
            IrrOUEST=[IrrOUEST Irr_moy'];
            nb_facadeOUEST=nb_facadeOUEST+1;
        end
        %fin condition obstacle
        %end
end

%Moyenne des valeurs de l'irradiation pour tous les triangles
IrrSUD24h=mean(IrrSUD, 2);
IrrEST24h=mean(IrrEST, 2);
IrrNORD24h=mean(IrrNORD, 2);
IrrEST24h=mean(IrrEST, 2);
