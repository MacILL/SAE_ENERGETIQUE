%configuration scene

%STEP 1
% caractéristiques du bâtiment:
% Vi=[LX,HZ,LY] Lx:longueur; Hy: hauteur; Ly: largeur
% centre de gravité Gi=[Gx Gy Gz]
V1=[0.1 1 0.3];
V2=[0.2 1 1];
G1=[5 1 1];
G2=[2 3 3];
%Caractéristiques du sol
% Vsol=[longueur, largueur]
Vsol=[5 5];

%l'aire minimale d'un triangle pour la tesselation
aire_min_bat=0.5;
aire_min_sol=1;


%STEP3
%longueur, largueur,hauteur
Source=[3,2.5,1.3];
%Source=[-1.6,-1.0,1.3];



%STEP4
num_jour=22;
num_mois=01;
num_annee=2020;
jour=[num_jour num_mois num_annee];

%Lat: 45.7786 N, Long: 4.9225 E, Alt: 170 m
%conversion en minutes d'angle : LAT=45 46' 43'' LONG 4 55' 21''
LAT=[45 46  43];
LONG=[4 55 21];
coord=[LAT;LONG]; 

% indice du jour pour lequel on fait les calculs:
ind_jour=1;   %premier jour du mois du fichier

decalage_heure='hiver' ;

%Intensité de la source
Intensite=1e3;

%Couleur de l'ombre
Penombre=100;