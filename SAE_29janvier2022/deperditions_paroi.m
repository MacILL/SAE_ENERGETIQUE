function Hp = deperditions_paroi (UbS,K)
% Paramètres d'entrée: UbS un vecteur qui rassemble l'ensemble des b*U*S
% Paramètres de sortis: Hp: dperdition des parois
%Auteurs Dianoux, Gbaguidi, Qian
%Date 28/12/2021

c=0;
for i=1:1:length(UbS)
    c=c+UbS(i);
end
Hp=c*K;
end