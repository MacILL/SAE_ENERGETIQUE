function UbS= ens_UbS(mat_cara)
% Paramètres d'entrée: mat_cara : une matrice où chaque ligne prend 
% la surface S, la conductance U et le coefficient b d'un matériau
% mat_cara=[Sm Um bm;Sp Up bp;Ss Us bs; Sfen Ufen bf]
% Paramètres de sortis: UbS: un vecteur qui pour chque matériau donne le
% produit S, U,b
%Auteurs Dianoux, Gbaguidi, Qian
%Date 28/12/2021
%création du vecteur V, qui rassemble l'ensemble des b*U*S

%mat_cara une matrice qui rassemble [S1 U1 b1;S2 U2 b2, ...]
taille=size(mat_cara);
UbS=zeros(taille(1),1);

for i= 1:1:taille(1)
    x=mat_cara(i,:);
    UbS(i)=x(1)*x(2)*x(3);
end
end

%teste
%S=[432 0.19854401 1; 150 0.12368584 1;150 0.19844405 0.5; 168 1.493 1]