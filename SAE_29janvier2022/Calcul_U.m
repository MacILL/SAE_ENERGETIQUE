function [U_m,U_p,U_s] = Calcul_U(Em ,lambda_m ,Ep, lambda_p, Es, lambda_s, inv_hint_m, inv_hext_m,inv_hint_p,inv_hext_p,inv_hint_s,inv_hext_s)

%        [U_m,U_p,U_s] = Calcul_U(e_m ,lamda_m ,e_p, lamda_p, e_s, lamda_s, hint_m, hext_m,hint_p,hext_p,hint_s,hext_s)
%        nom du fichier : Calcul_U
%   Dianoux Camille, Qian Céline, Gbaguidi Benjamin
%      15/10/2021
%   Version1.0
%   e_m vecteur donnant les epaisseurs du mur
%   lamda_m vecteur donnnant les conductivites pour le mur
%   e_p vecteur donnant les epaisseur du plafond
%   lamda_p vecteur donnant les conductivites du palfond
%   e_s vecteur donnant les epaisseurs du sol
%   lamda_s vecteur donnant les conductivites du sol
%   U_m conductance du mur
%   U_p conductance du plafond
%   U_s conductance du sol
%   inv_hint_m l'inverse du coefficient de convectivite interieur mur
%   inv_hext_m l'inverse coefficient de convectivite exterieur mur
% respectivement pour ceux du plafond, du sol

 %toutes les valeurs correspondent au benchmark1 vérifié le 17/12/21:

 Rtot_m =sum(Em./lambda_m); 
 U_m =1/(Rtot_m +inv_hint_m +inv_hext_m);
 Rtot_p = sum(Ep./lambda_p);
 U_p =1/(Rtot_p+ inv_hint_p +inv_hext_p);
 Rtot_s =sum(Es./lambda_s);
 U_s =1/(Rtot_s + inv_hint_s +inv_hext_s);
 
end

% proposition de regrouper les paramètres d'entrés dans une matrice
% matU=[Em lambda_m inv_hint_m inv_hext_m
   % Ep lambda_p inv_hint_p inv_hext_p
    %Es, lambda_s inv_hint_s inv_hext_s]


