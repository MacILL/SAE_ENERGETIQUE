function [chauffe]=Besoins_journee_froide(Qch)
%[chauffe]=Besoins_journee_froide(Qch)
% Paramètre de sortie:
% chauffe: besoin en chauffage pour une journée
% Paramètre d'entrée
% Qch: besoins en chauffage par heure sur une journée
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 14/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=1;

chauffe=sum(Qch);

if(FLAG_DEBUG==1)
    display('Besoins en chaleur sur une journée très froide ')
    display(Qch)
end

end