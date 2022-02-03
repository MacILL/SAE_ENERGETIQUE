%algo génétique
% initialisation aléatoire

%les parents
P1=[];
P2=[];
P3=[];
P4=[];
P5=[];
P6=[];
P7=[];
P8=[];
P9=[];
P10=[];
P11=[];

population=[P1;P2;P3;P4:P3;P4;P5;P6;P7;P8;P9;P10;P11];

for i=1:2:length(population)
%l'enfant 1 hérite au hasard de la moitié des caractères du parent 1
population(j)=Parent1;
population(j+1)=Parent2

    for i = 1 : length(Parent1)/2
    indice = randi(length(Parent1));
    Enfants1(indice) = Parent1(indice) ;
    end
%On prend le complémentaire
Enfants1(Enfants1 == 0) = Parents2((Enfants1 == 0)) ;

population(j)=Enfant1;
population(j+1)=Enfant2
end



