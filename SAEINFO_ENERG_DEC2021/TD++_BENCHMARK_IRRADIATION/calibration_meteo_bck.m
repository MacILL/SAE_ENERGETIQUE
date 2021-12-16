
function [Eed, calib] = calibration_meteo()
%sommets triangle de référence
A=[0 0 0];
B=[1 0 0];
C=[0 1 0];

%ouverture du fichier
%récupération valeur
[Struct]=importdata('C:\Users\celine.qian\Documents\SAEINFO_ENERG\vlx20QC_1\vlx20QC_1.txt')

donnees_meteo=Struct.data;

jour=1;
duree_moy=60; %durée de la moyenne en minutes
coord=[45.7786 0 0; 4.9225 0 0];  % à vérifier
fin_simul=size(donnees_meteo,1);

Eed=donnees_meteo(:, 12);
Eeg=donnees_meteo(:, 13);

cpt=0;
for i=1:1:fin_simul
    if(Eed(i)==-99){cpt=cpt+1; Eed(i)=[]; Eeg(i)=[]}     
    end
end
for    i=1:1:length(Eed)
    m=rem(i,60) %division euclidienne
    h=floor(i/60)
    pos_soleil=Calcul_position_soleil([h m],jour,coord);
    %cosphi est l'angle entre la noramle du triangle de réf et distance au
    %soleil
    cosphi=calcul_eclairement(A, B, C, pos_soleil);
    calib(i)=(Eeg-Eed)/cosphi; 
end

end


