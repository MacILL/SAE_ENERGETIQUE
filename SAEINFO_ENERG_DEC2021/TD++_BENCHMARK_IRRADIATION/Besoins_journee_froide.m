function [chauffe]=Besoins_journee_froide(Qch)
%[chauffe]=Besoins_journee_froide(Qch)
% Param�tre de sortie:
% chauffe: besoin en chauffage pour une journ�e
% Param�tre d'entr�e
% Qch: besoins en chauffage par heure sur une journ�e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 14/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=1;

chauffe=sum(Qch);

if(FLAG_DEBUG==1)
    display('Besoins en chaleur sur une journ�e tr�s froide ')
    display(Qch)
end

end