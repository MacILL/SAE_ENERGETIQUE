function S= Batiment(LX,HZ,LY,G)
% [T,S] = Batiment(long,haut,LX,G)
% fonction qui cr�� la matrice de sommets (coordonn�es des sommets)
%et la matrice de triangles correspondants
%param�tres d'entr�e: 
% LX: largeur (selon X)
% HZ: hauteur du b�timent
% LY: profondeur (dimension selon Y)
% G: position du centre de gravit�
%param�tres de sortie:
%T: matrice des triangles
%S: matrice des sommets
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S1= [G(1)-LX/2,G(2)-LY/2,0];
S2= [G(1)+LX/2,G(2)-LY/2,0];
S3= [G(1)+LX/2,G(2)+LY/2,0];
S4= [G(1)-LX/2,G(2)+LY/2,0];

S5= [G(1)-LX/2,G(2)-LY/2,HZ];
S6= [G(1)+LX/2,G(2)-LY/2,HZ];
S7= [G(1)+LX/2,G(2)+LY/2,HZ];
S8= [G(1)-LX/2,G(2)+LY/2,HZ];
S= [S1; S2; S3; S4; S5; S6; S7; S8];

end

