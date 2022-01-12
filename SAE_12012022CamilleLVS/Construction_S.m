function [SBat1,SBat2,TBat,SSol,TSol]=Construction_S(V1,G1,V2,G2,Vsol)

% ParamÃ¨tres d'entrÃ©e: 
% Vi=[LX,HZ,LY]
% Gi: centre de gravitÃ© du bÃ¢timent i
% Vsol vecteur contenant les coordonnÃ©es du sol Vsol=[largueur,longueur]
% Paramètres de sortie:
% SBat1: coordonnées des sommets des triangles du bâtiment 1
% SBat2: coordonnées des sommets des triangles du bâtiment 2
% TBat: indices des sommets (ie numéro de ligne de la matrice des sommets) formant un triangle du bâtiment
% chaque ligne de cette matrice représente un triangle
% SSol: coordonnées des sommets des triangles du sol
% TSol: indices des sommets (ie numéro de ligne de la matrice des sommets) formant un triangle du sol
%Auteurs Dianoux, Gbaguidi, Qian
%Date 31/12/2021

LX1=V1(1);
HZ1=V1(2);
LY1=V1(3);
SBat1= Batiment(LX1,HZ1,LY1,G1);

LX2=V2(1);
HZ2=V2(2);
LY2=V2(3);
SBat2= Batiment(LX2,HZ2,LY2,G2);

% TBat=[2 3 6;
%     6 3 7;
%     7 3 4;
%     4 8 7;
%     8 4 1;
%     8 1 5;
%     1 5 5;
%     2 1 6;
%     5 6 7;
%     7 8 5];

TBat=[1 5 2;  % devant
    2 5 6;    % devant
    6 3 2;    %  droite
    3 6 7;    %  droite
    4 3 7;    %  derriÃ¨re
    7 8 4;    %  derriÃ¨re
    8 5 1;    %  gauche
    1 4 8;    %  gauche
    7 6 8;    % toit
    5 8 6];   %  toit

largueur=Vsol(1);
longueur=Vsol(2);

SSol=[0 0 0 ;         % 6:sol
    largueur 0 0 ;
    largueur longueur 0 ;
    0 longueur 0 ];

TSol=[1 3 2;
    1 4 3];

end