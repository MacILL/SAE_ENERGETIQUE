function [besoins]=Besoins_horaires(Ql, Qg)
%[besoins]=Besoins_horaires(Ql, Qg)
% Param�tres d'entr�e:
% Ql: chaleur �chang�e par le b�timent (heure par heure)
% Attention, Ql est un vecteur de 24 valeurs
% Qg: chaleur du b�timent
% Param�tre de sortie: besoins en chauffage du b�timent
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 14/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=1;

if (length(Qs)~=24)
    display('attention, le vecteur Qs contient ')
    display(length(Qg))
end

Zer= zeros(length(Ql),1)

besoins=max(Zer, Ql-Qg);
if(FLAG_DEBUG==1)
    display('Besoins en chaleur, par heure ')
    display(besoins)
end
end