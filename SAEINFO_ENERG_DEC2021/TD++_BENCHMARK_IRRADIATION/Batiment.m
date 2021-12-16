function [T,S] = Batiment(LX,HZ,LY,G, type)
% [T,S] = Batiment(long,haut,LX,G)
% fonction qui créé la matrice de sommets (coordonnées des sommets)
%et la matrice de triangles correspondants
%paramètres d'entrée: 
% LX: largeur (selon X)
% HZ: hauteur du bâtiment
% LY: profondeur (dimension selon Y)
% G: position du centre de gravité
%paramètres de sortie:
%T: matrice des triangles
%S: matrice des sommets
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FLAG_DEBUG=1;

S1= [G(1)-LX/2,G(2)-LY/2,0];
S2= [G(1)+LX/2,G(2)-LY/2,0];
S3= [G(1)+LX/2,G(2)+LY/2,0];
S4= [G(1)-LX/2,G(2)+LY/2,0];

S5= [G(1)-LX/2,G(2)-LY/2,HZ];
S6= [G(1)+LX/2,G(2)-LY/2,HZ];
S7= [G(1)+LX/2,G(2)+LY/2,HZ];
S8= [G(1)-LX/2,G(2)+LY/2,HZ];
S= [S1; S2; S3; S4; S5; S6; S7; S8]

if(FLAG_DEBUG==1)
    display('sommets:')
    display(S)
end

T=[%1 2 3; 
    %3 4 1;
    2 3 6;
    6 3 7;
    7 3 4;
    8 7 4;
    8 4 1;
    8 1 5;
    1 6 5;
    1 2 6;
    5 6 7;
    7 8 5]
% T=[S1 S2 S3; 
%     S3 S4 S1;
%     S2 S3 S6;
%     S6 S3 S7;
%     S7 S3 S4;
%     S8 S7 S4;
%     S8 S4 S1;
%     S8 S1 S5;
%     S1 S6 S5;
%     S1 S2 S6;
%     S5 S6 S7;
%     S7 S8 S5]
end

