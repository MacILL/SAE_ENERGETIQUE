function [Ql]=Chaleur_echange(h, Tconsigne, Temp_ext)
% [Ql]=Chaleur_echange(h, Tconsigne, Temp)
% Cette fonction calcule la chaleur �chang�e par le batiment
% Param�tres d'entr�e:
% h: coefficient d'�change global
% Tconsigne: temp�rature � laquelle on veut garder le b�timent
% Temp_ext: temp�rature ext�rieure heure par heure (vecteur de 24 �l�ments)
% Param�tre de sortie:
% Ql: chaleur �chang�e
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
    display('chaleur �chang�e ')
    display(Ql )
end

end