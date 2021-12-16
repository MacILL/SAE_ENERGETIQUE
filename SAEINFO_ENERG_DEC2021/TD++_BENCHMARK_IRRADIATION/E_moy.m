function [E_benchmark]=E_moy(E_calib,T)

E_benchmark = 
for i=0:1:fin_simul
moy_calib=E_calib[i*60+1:1+(i+1)*60]/duree_moy;
end

end
