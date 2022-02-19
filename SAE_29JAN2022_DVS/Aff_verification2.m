function Aff_verification2(sommets,triangles)
%VERSION SIMPLIFIEE
%Aff_verification(sommets,triangles,sources)
%Permet de vérifier que l'objet est correct
%
%Paramètres d'entrée: sommets(matrice) triangles(matrice des indices des
%sommets) sources (vecteur des coordonnée d'un point)
%
%Par Afnan, Matthias et Alain Version 4.2  14/10/2020

plot3(sommets(:,1),sommets(:,2),sommets(:,3),'o')
hold on 

patch('Faces',triangles,'Vertices',sommets,'Facecolor',[0.7 0.2 0.3])


for i = 1:size(triangles(:,1))
    
    G = (sommets(triangles(i,1),:)+sommets(triangles(i,2),:)+sommets(triangles(i,3),:))/3;
    H = Calcul_normale_triangle(sommets(triangles(i,1),:),sommets(triangles(i,2),:),sommets(triangles(i,3),:));
    quiver3(G(1), G(2),G(3),H(1) ,H(2), H(3))    
    
end

%axis([-10, 10, -10, 10, -5, 20 ]) 