function [indices_heure]=decoupage_bloc_heure(minutes_conforme)
%[indices_heure]=decoupage_bloc_heure(minutes_conforme)
%fonction qui regroupe dans des blocs toutes les minutes correspondantes à
%des mesures conformes (non aberrantes)
%Paramètres d'entrée:
% minutes_conforme: minutes correspondantes à
%des mesures conformes (non aberrantes)
% Paramètres de sortie:
% indices_heure: indices de la minute correspondant à la première valeur 
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

%récupération des indices de changement d'heure dans le vecteur des minutes
%correspondants à des mesures valides
for i=1:1:length(minutes_conforme)
    if(floor(minutes_conforme(i)/60) > heure_courante)
        heure_courante=heure_courante+1;
        indices_heure(heure_courante)=i;
    end
end