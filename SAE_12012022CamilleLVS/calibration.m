function [cosphi]= calibration(positionS)

% calcul du cosinus (angle de réference)
normale = [0, 0, 1];
cosphi = dot(normale, positionS/norm(positionS));

end