%algo génétique
% initialisation aléatoire

%les parents
P1=[50 40 30];
P2=[30 50 20];
P3=[10 6 30];
P4=[10 5 5];
P5=[6 3 4];
P6=[2 5 6];
P7=[25 25 25];
P8=[40 24 14];
P9=[18 65 34];
P10=[18 36 49];


population=[P1;P2;P3;P4;P3;P4;P5;P6;P7;P8;P9;P10]; 
Enfants1=zeros(size(population));

for j=1:1:length(population)-1
%l'enfant 1 hérite au hasard de la moitié des caractères du parent 1
Parent1=population(j,:);
Parent2=population(j+1,:);

%condition if
for i = 1 : length(Parent1)/2
indice = randi(length(Parent1));
Enfants1(indice) = Parent1(indice) ;
end

%On prend le complémentaire
Enfants1(j,Enfants1(j,:) == 0) = Parent2((Enfants1(j,:) == 0)) ;

end



