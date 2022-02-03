%algo génétique
%mutation

[Individu_mute] = Mutation(Individu)
% Choisir au hasard l’une de ses caractéristiques
% La modifier légèrement

Individu_mute = Individu ;

indice = randi(length(Individu));
Individu_mute(indice) = Individu_mute(indice) * ((1.05-0.95)*rand() + 0.95) ;
