function [Consommation_energetique] = modele_thermique(matObstacle,Sommets_batiment, TBatType, Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu, chem, fen_sud,fen_nord,fen_ouest,fen_est)
% fonction qui affiche la consommation thermique
%Paramètres d'entrée
%Paramètres de sortie:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 22/01/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[IrrS, IrrE,IrrN, IrrO]=Irradiation_calibree_24(matObstacle,TBatType,Sommets_batiment,Triangles_scene_Part_Dieu,Sommets_scene_Part_Dieu,chem);


%[IrrS, IrrE,IrrN, IrrO]=Irradiation_calibree_24(Triangles_batiment,Sommets_batiment,Triangles_scene_Part_Dieu,Sommets_scene_Part_Dieu);

configuration_batiment 

Consommation_energetique = benchmark2(Tref,Fs,etage,DJUL,Gint,Tint, IrrN, IrrS, IrrE, IrrO,Temperature_par_heure,Em,Ep,Es,lambda_m,lambda_p,lambda_s,fen_sud,fen_nord,fen_ouest,fen_est, inv_hint_m, inv_hext_m,inv_hint_p,inv_hext_p,inv_hint_s,inv_hext_s,bm,bp,bs,bf,K,Ufen,longueur,largeur,hauteur,Cp_air,n);


