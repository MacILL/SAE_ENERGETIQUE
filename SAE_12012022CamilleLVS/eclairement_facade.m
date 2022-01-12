function [e_f]=eclairement_facade(i,j,SBat,Source)
%[E_calib, pos_soleil]=calibration_E(Eeg, Eed, minutes)
% fonction qui calcule un éclairement normalisé par rapport à la position
% du soleil (minute par minute)

%Paramètres d'entrée
%i,j : les deux triangles qui constituent une facade
%Paramètre de sortie
%e_f: l'eclairement de la facade constitué des triangles i et j

%Auteurs Dianoux, Gbaguidi, Qian
%Date 02/01/2022

% on cherche dans la matrice sommet, les coordonnées du triangle i
A=SBat(i(1),:);
B=SBat(i(2),:);
C=SBat(i(3),:);

% on cherche dans la matrice sommet, les coordonnées du triangle j
D=SBat(j(1),:);
E=SBat(j(2),:);
F=SBat(j(3),:);

E1=Calcul_eclairement(A,B,C,Source);
E2=Calcul_eclairement(D,E,F,Source);

e_f=(E1+E2)/2;
end


% pour le Bat 1 :
% e_moy_f =[ 0.0881   -0.9780   -0.2565    0.9691    0.0527]
% pour le Bat 2:
% e_moy_f = [0.1349   -0.9622   -0.3791    0.8958    0.0808]




