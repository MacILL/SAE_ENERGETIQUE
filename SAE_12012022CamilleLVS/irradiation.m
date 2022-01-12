function [Irradiation]=irradiation(calib, Eed, pos_soleil, T, S, ind_triangle, FLAG_DEBUG)
%[E_calib]=irradiation(calib, Eed, pos_soleil, T, S, ind_triangle)
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

 % pour un triangle fixÃ©
 IND=T(ind_triangle,:);
%[S1 S2 S3]=eclate_triangle(T,i);
S1=S(IND(1),:);
S2=S(IND(2),:);
S3=S(IND(3),:);

if(FLAG_DEBUG==1)
    display('triangle sélectionné: ')
    display(IND)    
    display('sommets sélectionnés: ')
    display(S1)
    display(S2)
    display(S3)
end

for i=1:1:length(Eed)
    Irradiation(i)=calib(i)*Calcul_eclairement(S1, S2, S3,pos_soleil(i,:))+Eed(i);
end
    if(FLAG_DEBUG==1)
    display('nb d elements de E_calib')
    display(length(Irradiation))
    end