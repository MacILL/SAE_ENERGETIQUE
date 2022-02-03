function Qc_jour=besoin_de_chauffage_par_jour(Ql,Qg)
% Paramètres d'entrée: Ql:perte horaire; Qg: apport horaire
% Paramètres de sortis: Qc_jour : besoin en chauffage journalière
% surfacique
%Auteurs Dianoux, Gbaguidi, Qian
%Date 28/12/2021

Qc=[];
a=length(Ql);
for k=1:a
    %consommation = perte-apport
    Qc(k)=max(0,Ql(k)-Qg(k)); 
end
Qc_jour=sum(Qc);
end

