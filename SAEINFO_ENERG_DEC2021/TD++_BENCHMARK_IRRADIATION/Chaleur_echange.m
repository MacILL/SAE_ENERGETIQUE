function [Ql]=Chaleur_echange(h, Tconsigne, Temp_ext)
% [Ql]=Chaleur_echange(h, Tconsigne, Temp)
% Cette fonction calcule la chaleur échangée par le batiment
% Paramètres d'entrée:
% h: coefficient d'échange global
% Tconsigne: température à laquelle on veut garder le bâtiment
% Temp_ext: température extérieure heure par heure (vecteur de 24 éléments)
% Paramètre de sortie:
% Ql: chaleur échangée
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 14/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=0;

if(length(Temp_ext)~=)
    display('attention, taille de Temp_ext: ')
    display(length(Temp_ext) )
end

Ql=h*(Tconsigne-Temp_ext)/1000;
if(FLAG_DEBUG==1)
    display('chaleur échangée ')
    display(Ql )
end

end