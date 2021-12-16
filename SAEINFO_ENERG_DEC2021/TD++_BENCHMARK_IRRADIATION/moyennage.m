function [E_calib_moy]=moyennage(E_calib, indices_heure)
%E_calib_moy]=moyennage(E_calib, indices_heure)
%fonction qui fait la moyenne des mesures par bloc d'une heure
%paramètres d'entrée:
% E_calib: vecteurs des éclairements calibrés
% indices_heure: indices de la minute correspondant à la première valeur 
% conforme dans un bloc d'une heure de mesure
%paramètre de sortie:
% E_calib_moy: valeurs des éclairements calibrés moyennés par bloc 
%d'une heure de mesures conformes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=1;
if(FLAG_DEBUG==1)
    display('nb d elements de indices_heure')
    display(length(indices_heure))
    display('nb d elements de E_calib')
    display(length(E_calib))
end
%moyennage par heure prenant en compte les valeurs valides
for i=1:1:length(indices_heure)-1
E_calib_moy(i)=sum(E_calib(indices_heure(i):indices_heure(i+1)))/(indices_heure(i+1)-indices_heure(i));
end
E_calib_moy(length(indices_heure))=sum(E_calib(indices_heure(length(indices_heure)-1): length(E_calib)))/(indices_heure(i+1)-indices_heure(i));

if(FLAG_DEBUG==1)
    display('E_calib_moy')
    display(E_calib_moy)
end