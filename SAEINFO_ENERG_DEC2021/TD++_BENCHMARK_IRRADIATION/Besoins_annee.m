function [Qcan]=Besoins_annee(Qcj, DJLU, Tref, Tjour_moy)
% [Qcan]=Besoins_annee(Qcj, DJLU, Tref, Tjour)
% Param�tres de sortie:
% Qcan besoins en chauffage pour une ann�e
% Param�tres d'entr�e:
% Qcj: besoins en chauffage par jour   
% DJLU coefficient (d�pend de la localisation) 
% Tref: temp�rature de r�f�rence 
% Tjour: temp�rature MOYENNE de la journ�e  
%NB cette temp�rature moyenne est pr�alablement calcul�e par la fonction
%Temp_moy_jour
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 14/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=1;

Qcan= (Qcj*DJLU)/(Tref-Tjour);

if(FLAG_DEBUG==1)
    display('Besoins en chaleur sur une journ�e tr�s froide ')
    display(Qcan)
end