%Dimensions 
x=0.2;
y=0.5;
z=0.3;
a=0.5;
b=0.4;

Sommets=[
%Objet parallélépipède
0,0,0;
x,0,0;
x,y,0;
x,0,z;
0,y,0;
0,y,z;
0,0,z;
x,y,z;
%Tétraèdre
-a,-a,a;
-a-b,-a,a;
-a,-a+b,a;
-a,-a,a+b];

Triangles=[
%Objet parallélépipède
1,2,3;
1,3,5;
1,4,2;
1,7,4;
1,5,6;
1,6,7;
2,8,3;
2,4,8;
5,3,8;
5,8,6;
7,8,4;
7,6,8;
%Tétraèdre
9,12,11;
9,11,10;
9,10,12;
11,12,10];

% Définition de la source
Source=[-1.6,-1.0,1.3];

%Intensité de la source
Intensite=1e3;

%Couleur de l'ombre
Penombre=100;