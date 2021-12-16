function [calib] = calibration_meteo(cosphi,chem)
%    [calib] = calibration_meteo(cosphi,chem)
%   
load('donnees_meteo.m')
%ouverture du fichier
%récupération valeur
%...
%
[Struct]=importdata('C:\Users\celine.qian\Documents\SAEINFO_ENERG\vlx20QC_1\vlx20QC_1.txt')

donnees_meteo=Struct.data;
jour=donnees_meteo(:, size(donnees_meteo)-2)
Ees=data(:,N-3) %récupérer la 3ème ligne avant la fin
pas_temps=60;
for i=0:pas_temps:fin_simul
    Ees_moy=moy(val, pas_temps)
    meteo=Ees_moy;
    calcul_eclairement()
    cosphi=dot(pos_soleil, norm)
calib=meteo/cosphi 
end
end

