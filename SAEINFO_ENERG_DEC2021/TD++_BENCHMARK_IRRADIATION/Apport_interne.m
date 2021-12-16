function [Qi]=Apport_interne(Surf, Gint)
%[Qi]=Qint(Surf, Gint)
%Paramètres de sortie: 
%Qi: chaleur interne
%Paramètres d'entrée:
%Surf: Surface chauffée (par exemple) 
%Gint: Gain de chaleur interne
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 14/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=0;
Qi=Surf*Gint./1000;
end