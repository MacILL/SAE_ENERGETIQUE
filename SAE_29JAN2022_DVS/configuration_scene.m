%configuration scene

%STEP 1
% caractéristiques du bâtiment:
% Vi=[LX,HZ,LY] Lx:longueur; Hy: hauteur; Ly: largeur
% centre de gravité Gi=[Gx Gy Gz]
V1=[50 40 30];
V2=[60 60 10];
G1=[40 80 30];
G2=[40 20 30];
%Caractéristiques du sol
% Vsol=[longueur, largueur]
Vsol=[100 100];

%l'aire minimale d'un triangle pour la tesselation
%aire_min_bat=0.05;
aire_min_bat=10;
aire_min_sol=150;


%STEP3
%longueur, largueur,hauteur
Source=[8 8 6];



%STEP4
num_jour=22;
num_mois=01;
num_annee=2020;
jour=[num_jour num_mois num_annee];

%Lat: 45.7786 N, Long: 4.9225 E, Alt: 170 m
%conversion en minutes d'angle : LAT=45 46' 43'' LONG 4 55' 21''
% LAT=[45 46  43];
% LONG=[4 55 21];
LAT=[45 77 86];
LONG=[4 92 25];
coord=[LAT;LONG]; 

% indice du jour pour lequel on fait les calculs:
ind_jour=1;   %premier jour du mois du fichier

decalage_heure='hiver' ;

%Intensité de la source
Intensite=1e3;

%Couleur de l'ombre
Penombre=100;

% retrouver les valeurs d'irradiation conformes au fichier
%Chemin du fichier de mesures mÃ©tÃ©o
%chemin relatif : chem='../../vlx20QC_1_22012020.txt'
%chem='vlx20QC_1_22012020.txt';