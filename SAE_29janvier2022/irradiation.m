function [Irradiation]=irradiation(calib, Eed, pos_soleil, T, S, ind_triangle, FLAG_DEBUG,TBat,SBat)

%[E_calib]=irradiation(calib, Eed, pos_soleil, T, S, ind_triangle)
% fonction qui calcule l'irradiation d'un triangle
%Param�tres d'entr�e
%calib: vecteur d'�clairements calibr�s
%Eed: vecteur d'�clairements directs
%pos_soleil: vecteur de position du soleil (par exemple au cours d'une journ�e)
%T: matrice des triangle
%S: matrice des sommets
%ind_triangle: indice du triangle consid�r�
% Param�tres de sortie:
% E_calib: �clairements calibr�s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % pour un triangle fixé
 IND=TBat(ind_triangle,:);
%[S1 S2 S3]=eclate_triangle(T,i);
S1=SBat(IND(1),:);
S2=SBat(IND(2),:);
S3=SBat(IND(3),:);

if(FLAG_DEBUG==1)
    display('triangle s�lectionn�: ')
    display(IND)    
    display('sommets s�lectionn�s: ')
    display(S1)
    display(S2)
    display(S3)
end


G=Centre_de_gravite(S1,S2,S3);
for i=1:1:length(Eed)
    if(matObstacle(ind_triangle,i)==0)
    %si il n'y a pas d'intersection
        if test==0
            e=Calcul_eclairement(S1, S2, S3,pos_soleil(i,:));
            if e < 0
                Irradiation(i)=Eed(i);
            else
                Irradiation(i)=calib(i)*Calcul_eclairement(S1, S2, S3,pos_soleil(i,:))+Eed(i);
            end
        else
        Irradiation(i)=0; 
    end
end
end

    if(FLAG_DEBUG==1)
    display('nb d elements de E_calib')
    display(length(Irradiation))
    end