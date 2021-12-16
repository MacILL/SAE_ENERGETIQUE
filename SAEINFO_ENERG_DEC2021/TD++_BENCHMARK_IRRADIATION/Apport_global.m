function [Qg]=Apport_global(Qs, Qint)
%[Qg]=Apport_global(Qs, Qint)
% fonction qui calcule l'apport total en chaleur
% Paramètres de sortie:
% Qg: apport global de chaleur
% paramètres de sortie
% Qs: apport solaire
% Qint: apport interne
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 14/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=0;

Qg=Qi+Qs;
if (length(Qs)~=24)
    display('attention, le vecteur Qs contient ')
    display(length(Qs))
end
if(FLAG_DEBUG==1)
    display(Qg)
end
end
