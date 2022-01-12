function [indices_heure]=decoupage_bloc_heure(minutes_conforme)
%[indices_heure]=decoupage_bloc_heure(minutes_conforme)
%fonction qui regroupe dans des blocs toutes les minutes correspondantes �
%des mesures conformes (non aberrantes)
%Param�tres d'entr�e:
% minutes_conforme: minutes correspondantes �
%des mesures conformes (non aberrantes)
% Param�tres de sortie:
% indices_heure: indices de la minute correspondant � la premi�re valeur 
% conforme dans un bloc d'une heure de mesure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
heure_courante=0;
indices_heure=[];
j=1;
E_calib_moy=0;
min_moy=0;

%r�cup�ration des indices de changement d'heure dans le vecteur des minutes
%correspondants � des mesures valides
for i=1:1:length(minutes_conforme)
    if(floor(minutes_conforme(i)/60) > heure_courante)
        heure_courante=heure_courante+1;
        indices_heure(heure_courante)=i;
    end
end