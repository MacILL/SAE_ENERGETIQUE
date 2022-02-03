function Qc_jour=besoin_de_chauffage_par_jour2(Ql,Qg,tau)
% Paramètres d'entrée: Ql:perte horaire; Qg: apport horaire
% Paramètres de sortis: Qc_jour : besoin en chauffage journalière
% surfacique
%Auteurs Dianoux, Gbaguidi, Qian
%Date 28/12/2021

Qc=[];
a=length(Ql);
for heure=1:a
    %pour une journée fixée
    xj=Qg(heure)/Ql(heure);
    F=(xj-xj^tau)/(1-xj^tau);
    Qc(heure)=Ql(heure)*(1-F);
end
Qc_jour=sum(Qc);
end