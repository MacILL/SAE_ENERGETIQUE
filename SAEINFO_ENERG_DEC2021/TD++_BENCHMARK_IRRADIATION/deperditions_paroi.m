function Hp = deperditions_paroi (UbS,K)
%UbS un vecteur qui rassemble l'ensemble des b*U*S
c=0;
for i=1:1:length(UbS)
    c=c+UbS(i);
end
Hp=c*K;
end