function [E_calib_moy]=moyennage(E_calib, minutes_conforme)
%E_calib_moy]=moyennage(E_calib, indices_heure)
%fonction qui fait la moyenne des mesures par bloc d'une heure
%param�tres d'entr�e:
% E_calib: vecteurs des �clairements calibr�s
% indices_heure: indices de la minute correspondant � la premi�re valeur 
% conforme dans un bloc d'une heure de mesure
%param�tre de sortie:
% E_calib_moy: valeurs des �clairements calibr�s moyenn�s par bloc 
%d'une heure de mesures conformes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/01/2022
%Version 2.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% g�n�ration de bloc temporels correspondants � des valeurs conformes sur
% une heure
[indices_heure]=decoupage_bloc_heure(minutes_conforme);

%moyennage par heure prenant en compte les valeurs valides
for i=1:1:length(indices_heure)-1
E_calib_moy(i)=sum(E_calib(indices_heure(i):indices_heure(i+1)))/(indices_heure(i+1)-indices_heure(i));
end
E_calib_moy(length(indices_heure))=sum(E_calib(indices_heure(length(indices_heure)-1): length(E_calib)))/(indices_heure(i+1)-indices_heure(i));

