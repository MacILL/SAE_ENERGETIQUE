
%optimisation
%global matObstacle
%clear all;
close all;
chemMat='../MATOBSTACLES/matObstacle15AOUT2020.txt'
 matObstacle=importdata(chemMat);
chem='../CalculMatriceObstacle/vlx20/vlx20QC_8_15012020.txt'; 
configuration_part_dieu
configuration_batiment
configuration_scene
Batim_tesselle;

[Sommets_scene_complete, Triangles_scene_complete] = Insertion(Sommets_batiment, Triangles_batiment, Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu,1);


fen_sud=0.6;
fen_est=0.25;
fen_ouest=0.25;
fen_nord=0.05;

%avec le bat fixé dans la scene part dieu, on obtient Consommation_energetique = 44.3928
[Consommation_energetique] = modele_thermique(matObstacle,Sommets_batiment, TBatType, Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu, chem, fen_sud,fen_nord,fen_ouest,fen_est);


