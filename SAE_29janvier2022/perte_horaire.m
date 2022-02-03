function Ql= perte_horaire(Temperature_par_heure,H,Tint)
% Paramètres d'entrée: 
%H: déperdition totale
%Tint: température interne fixe
% Paramètres de sortis: Ql:perte horaire
%Auteurs Dianoux, Gbaguidi, Qian
%Date 28/12/2021

a=length(Temperature_par_heure);
Ql=[];
for k= 1:a
    Ql(k)=H*(Tint-Temperature_par_heure(k))/1000;
end
end