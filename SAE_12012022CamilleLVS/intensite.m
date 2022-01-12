function [Irradiation, minutes_conforme]=intensite(chem, ind_jour,T,S,ind_triangle,jour,coord, decalage_heure)
%[Irradiation, minutes_conforme]=intensite(chem, ind_jour,T,S,ind_triangle,jour,coord, decalage_heure, orientation)
% fonction qui calcule l'irradiation d'un triangle
%Paramètres d'entrée
%calib: vecteur d'éclairements calibrés
%Eed: vecteur d'éclairements directs
%pos_soleil: vecteur de position du soleil (par exemple au cours d'une journée)
%T: matrice des triangle
%S: matrice des sommets
%ind_triangle: indice du triangle considéré
% Paramètres de sortie:
% E_calib: éclairements calibrés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % pour un triangle fixé
 
 %A, B, C :sommets triangle de référence normalisé
A=[0 0 0];
B=[0 1 0];
C=[1 0 0];

% génération de vecteurs de donnée conforme (suppression des valeurs aberrantes)
% stockage des minutes correspondantes
[Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem, ind_jour);

%Calibration de l'éclairement en fonction des heures du jour
[calib, pos_soleil]=calibration_Ebis(A, B, C,Eeg_conforme, Eed_conforme, minutes_conforme, jour,coord, decalage_heure);
 
 % calcul de l'irradiation du triangle choisi
[Irradiation]=irradiation_bis(calib,Eed_conforme, pos_soleil, T,S,ind_triangle);

  % pour un triangle fixÃ©
IND=T(ind_triangle,:);
%[S1 S2 S3]=eclate_triangle(T,i);
S1=S(IND(1),:);
S2=S(IND(2),:);
S3=S(IND(3),:);

for i=1:1:length(Eed_conforme)
    Irradiation(i)=calib(i)*Calcul_eclairement(S1, S2, S3,pos_soleil(i,:))+Eed_conforme(i);
end
