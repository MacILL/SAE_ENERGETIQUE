function [Qcan]=Besoins_annee(Qcj, DJLU, Tref, Tjour_moy)
% [Qcan]=Besoins_annee(Qcj, DJLU, Tref, Tjour)
% Paramètres de sortie:
% Qcan besoins en chauffage pour une année
% Paramètres d'entrée:
% Qcj: besoins en chauffage par jour   
% DJLU coefficient (dépend de la localisation) 
% Tref: température de référence 
% Tjour: température MOYENNE de la journée  
%NB cette température moyenne est préalablement calculée par la fonction
%Temp_moy_jour
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 14/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=1;

Qcan= (Qcj*DJLU)/(Tref-Tjour);

if(FLAG_DEBUG==1)
    display('Besoins en chaleur sur une journée très froide ')
    display(Qcan)
end