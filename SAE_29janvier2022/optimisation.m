
%optimisation
%clear all;
close all;

chem='vlx20QC_1_22012020.txt'; 
configuration_part_dieu

[Sommets_scene_complete, Triangles_scene_complete] = Insertion(Sommets_batiment, Triangles_batiment, Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu,1);

fen_sud=0.6;
fen_est=0.25;
fen_ouest=0.25;
fen_nord=0.05;

%avec le bat fixé dans la scene part dieu, on obtient Consommation_energetique = 44.3928
[Consommation_energetique] = modele_thermique(Sommets_batiment, Triangles_batiment, Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu, chem, fen_sud,fen_nord,fen_ouest,fen_est);


