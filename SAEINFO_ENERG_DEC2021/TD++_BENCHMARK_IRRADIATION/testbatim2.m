%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PROGRAMME PRINCIPAL                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ce programme permet de suivre les étapes du TD++ POUR UN SEUL TRIANGLE:
% 1) construire la scène 3D;
% 2) calculer la position du soleil (au sein de la fonction calibration);
% 3) calculer l'éclairement d'un triangle (au sein de la fonction irradiation);
% 4) calibrer le résultat pour qu'il représente un éclairement énergétique.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
%  INITIALISATION %
%Chemin du fichier de mesures météo
%Attention au formatage mac/linux windows
chem='../vlx20QC_1/vlx20QC_1_22012020.txt'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% indice du jour pour lequel on fait les calculs:
ind_jour=1
%ATTENTION: il s'agit du premier jour du fichier. 
%Si le fichier ne comporte les données que d'un seul jour, num_jour=1
%Si le fichier contient plusieurs jours de mesure, ind_jour=numéro du jour
%dont on veut extraire les données.
%Par exemple, pour un fichier contenant les données du 1er janvier au 31
%janvier, ind_jour du 22 janvier=22
% Mais si le fichier ne comporte qu'un seul jour de mesures, ind_jour=1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Date
num_jour=22;
num_mois=01;
num_annee=2021;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%décalage d'heure: écrire 'hiver' ou 'été'
decalage_heure='hiver'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%génération d'un bâtiment de 6m de large, 3m de haut et 4m de profondeur, 
%dont le centre de gravité est placé en [5 5 0]
%la façade de 6m de large est orientée vers le sud
[T1,S1]= Batiment(6,3,4,[5,5,0]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Affichage du bâtiment
Aff_verification2(S1,T1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Choix d'un triangle en particulier
ind_triangle=4;
%le triangle 4 est un triangle de la façade Nord

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ALGORITHME PRINCIPAL                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% génération de vecteurs de donnée conforme (suppression des valeurs
% aberrantes)
% stockage des minutes correspondantes
[Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem, ind_jour);

% calibration de l'éclairement en fonction des heures du jour
 [calib, pos_soleil]=calibration_E(Eeg_conforme, Eed_conforme, minutes_conforme, num_jour, num_mois, num_annee, decalage_heure);
 
 % calcul de l'irradiation du triangle choisi
 [E_calib]=irradiation(calib, Eed_conforme, pos_soleil, T1, S1, ind_triangle);
 
 % génération de bloc temporels correspondants à des valeurs conformes sur
 % une heure
 minutes_decoupe=decoupage_bloc_heure(minutes_conforme);
 
 % calcul des valeurs moyennes d'irradiation par blocs temporels
 E_moy=moyennage(E_calib, minutes_decoupe)