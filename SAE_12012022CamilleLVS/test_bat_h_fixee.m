for i=1:size(TScene,1)
    couleur=Penombre+i_fixee(i);
    Couleurs=[Couleurs;couleur,couleur,couleur];
end

Couleurs=Couleurs/max(max(Couleurs));

%Affichage de l'objet éclairé
plot3(Source(1),Source(2),Source(3),'or')
hold on
Aff_objet_eclaire(Couleurs,TScene(:,1:3),SScene)
