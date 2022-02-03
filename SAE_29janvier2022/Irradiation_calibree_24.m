function [IrrSUD24h, IrrEST24h,IrrNORD24h, IrrOUEST24h]=Irradiation_calibree_24(TScene,SScene,TBat,SBat2,chem)

% fonction qui renvoie les irradiations du bâtiment pour chaque heure en
% prenant en compte les éventuels obstacles lui faisant de l'ombre
%Paramètres d'entrée
% Sommets_batiment, Triangles_batiment : matrices qui regrupent l'ensemble 
% des sommets et triangles constituants le bâtiment
% Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu: matrices qui regrupent
% l'ensemble des sommets et triangles constituants la Part Dieu
% Paramètres de sortie:
% Sommets_scene_complete, Triangles_scene_complete

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 22/01/2022

configuration_scene

% gÃ©nÃ©ration de vecteurs de donnÃ©e conforme (suppression des valeurs aberrantes)
% et stockage des minutes correspondantes
[Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem, ind_jour);


%Calibration de l'Ã©clairement en fonction des heures du jour
[Eclairement_calibre, pos_soleil,hauteur_soleil,azimut_soleil]=calibration_E(Eeg_conforme, Eed_conforme, minutes_conforme, jour,coord, decalage_heure);
 
%plot3(pos_soleil(:,1), pos_soleil(:,2), pos_soleil(:,3), 'o')
%grid on

IrrSUD=zeros(1,24); nb_facadeSUD=0;
IrrEST=zeros(1,24); nb_facadeEST=0;
IrrNORD=zeros(1,24); nb_facadeNORD=0;
IrrOUEST=zeros(1,24); nb_facadeOUEST=0;

%BOUCLE SUR LES TRIANGLES DU BATIMENT TESSELLE
for ind_triangle=1:1:size(TScene,1)
    %Si obstacle, pas de calcul
        
    %donne l'intensitÃ© lumineuse d'un triangle par min pour 24heures
    %il y a 24*60 valeurs moins les valeurs aberrantes
    [Irradiation]=irradiation(Eclairement_calibre,Eed_conforme, pos_soleil, TScene,SScene,ind_triangle,0,TBat,SBat2); 
    % calcul des valeurs moyennes d'irradiation par blocs temporels
    % On obtient une valeur moyenne par heure de la journée
    [Irr_moy]=moyennage(Irradiation,minutes_conforme);
    %plot(Irr_moy)
    %hold on
    %Stockage des valeurs d'irradiations moyennes par bloc d'une heure
    %Pour la façade SUD
        if( TScene(ind_triangle,4)==1 )
            IrrSUD=IrrSUD+Irr_moy;
            nb_facadeSUD=nb_facadeSUD+1;
        end
    %Pour la façade EST
        if( TScene(ind_triangle,4)==2 )
            IrrEST=IrrEST+Irr_moy;
            nb_facadeEST=nb_facadeEST+1;
        end
    %Pour la façade NORD
        if( TScene(ind_triangle,4)==3 )
            IrrNORD=IrrNORD+Irr_moy;
            nb_facadeNORD=nb_facadeNORD+1;
        end
   %Pour la façade OUEST
        if( TScene(ind_triangle,4)==4 )
            IrrOUEST=IrrOUEST+Irr_moy;
            nb_facadeOUEST=nb_facadeOUEST+1;
        end
end


%Moyenne des valeurs de l'irradiation pour tous les triangles avec obstacle
IrrSUD24h=IrrSUD/nb_facadeSUD;
IrrEST24h=IrrEST/nb_facadeEST;
IrrNORD24h=IrrNORD/nb_facadeNORD;
IrrOUEST24h=IrrOUEST/nb_facadeOUEST;