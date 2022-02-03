%CONFIGURATION DU BÂTIMENT
%dernière modification: 29 janvier 2022
%Camille Dianoux

%Ce fichier rassemble les caractéristiques géométriques et thermiques du
%bâtiment


%%%%%%%%%%%% CARACTÉRISTIQUES GÉOMÉTRIQUES %%%%%%%%%%%%%%%%%%%%%%
% le bâtiment est un paraléllépipède
longueur=50;
largeur=30;
hauteur=40;
%%%%%%%%%%%% MATRICE INITIALES DES TRIANGLES %%%%%%%%%%%%%%%%%%%%
% chaque facerectangulaire  est découpée en deux triangles 
TBat=[1 5 2;  % devant
    2 5 6;    % devant
    6 3 2;    %  droite
    3 6 7;    %  droite
    4 3 7;    %  derriÃ¨re
    7 8 4;    %  derriÃ¨re
    8 5 1;    %  gauche
    1 4 8;    %  gauche
    7 6 8;    % toit
    5 8 6];   %  toit

%%%%%%%%%%%%%% CARACTÉRISTIQUES THERMIQUES %%%%%%%%%%%%%%%%%%%%%

Em_platre=0.013;
Em_isolant=0.15;
Em_beton=0.2;
Em_enduit=0.02;
Ep_platre=0.013;
Ep_isolant=0.25;
Ep_beton=0.15;
Es_carr=0.02;
Es_beton1=0.05;
Es_isolant=0.15;
Es_beton2=0.15;
% CONDUCTIVITÉ THERMIQUE
lambda_platre=0.4;
lambda_isolant=0.032;
lambda_beton=1.5;
lambda_enduit=1.5;
lambda_carr=1.25;

inv_hint_m=0.13;
inv_hext_m=0.04;
inv_hint_p=0.1;
inv_hext_p=0.04;
inv_hint_s=0.17;
inv_hext_s=0.04;
Sfen=1;
bm=1;
bp=1;
bs=0.5;
bf=1;
K=1.1;

Cp_air=0.34;
n= 0.5;
Ufen=1.493;

Em=[Em_platre,Em_isolant,Em_beton,Em_enduit];
Ep=[Ep_platre, Ep_isolant,Ep_beton];
Es=[Es_carr,Es_beton1,Es_isolant,Es_beton2];
lambda_m=[lambda_platre,lambda_isolant,lambda_beton,lambda_enduit];
lambda_p=[lambda_platre, lambda_isolant,lambda_beton];
lambda_s=[lambda_carr,lambda_beton,lambda_isolant,lambda_beton];


DJUL=2100;
Tref=18;
Tint=20;
Gint=4;
Fs=0.5;
etage=4;

%valeurs thÃ©oriques
% IrrN=[0 0 0 0 0 0 0 10.3 54.7 92.4 110.6 142.4 132.1 134.4 72.2 42.3 4.4 0 0 0 0 0 0 0];
% IrrS= [0 0 0 0 0 0 0 31.5 126.4 378.7 151.8 523.7 572.7 512.8 239.1 88.9 17.9 0 0 0 0 0 0 0];
% IrrE=[0 0 0 0 0 0 0 43.1 128.7 274.5 126.2 161.3 132.1 134.4 72.2 42.3 4.4 0 0 0 0 0 0 0];
% IrrO=[0 0 0 0 0 0 0 10.3 54.7 92.4 110.6 144.8 202 309.9 201.5 98.2 27.3 0 0 0 0 0 0 0];
% on obtient Qc_an_surf = 43.6899

%vÃ©rification
%valeurs informatiques obtenues aprÃ¨s calibration sans obstacle pour 24H 
% pour le 22 janvier
% IrrSUD24h=[0 0 0 0 0 0 0 0.1176 12.0182 374.2352 439.1731 171.8055 556.1417 593.5447 492.3568 212.0932 71.2988 10.9965 0 0 0 0 0 0]; 
% IrrEST24h =[0 0 0 0 0 0 0 0.1176 12.0182 591.2834 438.1868 167.7715 286.2289 233.5328 153.2109 73.0500 42.6167 7.5789 0 0 0 0 0 0];
% IrrNORD24h =[0 0 0 0 0 0 0 0.1176 12.0182 55.7667 93.7000 112.5000 144.2833 135.8667 135.9000 73.0500 42.6167 7.5789 0 0 0 0 0 0];
% IrrOUEST24h =[0 0 0 0 0 0 0 0.1176 12.0182 55.7667 93.7000 112.5000 144.2833 137.0878 190.7442 121.4095 61.3192 10.4474 0 0 0 0 0 0];
% on obtient Qc_an_surf =43.6226

Temperature_par_heure=[0.46 0.13 0.06 0.07 -0.78 -1.24 -1.63 -1.73 -1.83 -1.16 0.14 1.3 2.41 5.11 5.24 5.2 4.45 3.62 3.04 2.53 1.83 1.4 1.06 1];
