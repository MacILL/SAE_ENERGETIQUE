function Qg=apport_horaire(Gint,Ach,IrrN, AsN, IrrS, AsS, IrrO, AsO, IrrE, AsE, Fs)
% Paramètres d'entrée: 
% Gint: le gain interne
% Ach: la surface chauffée
% Irri et Asi sont respectivements les irradiations et la surface de vitrage
% pour l'orientation i
% Paramètres de sortis: Qg: apport horaire
%Auteurs Dianoux, Gbaguidi, Qian
%Date 28/12/2021

Qi=Ach*Gint./1000;
Qs=Apport_solaire(IrrN, AsN, IrrS, AsS, IrrO, AsO, IrrE, AsE, Fs);
Qg=Qi+Qs; 
end