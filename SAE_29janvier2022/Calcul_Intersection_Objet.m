function [test, I] = Calcul_Intersection_Objet(Triangles, Sommets,O,G)
% [test] = Calcul_Intersection_Objet(Triangles,O,G)
% Cette fonction vérifie si le rayon OG coupe l'objet constitués de
% triangles (dans le vecteur Triangle)
test = 0;
I = [];
s = size(Triangles);
l=s(1);

for k=1:l % pour toutes les faces (triangles) de l'objet
    
    a= Triangles(k,1); %on va chercher les coordonnées des sommets
    A = [Sommets(a,1), Sommets(a,2), Sommets(a,3)] ;
    
    b= Triangles(k,2);
    B = [Sommets(b,1), Sommets(b,2), Sommets(b,3)] ;
    
    c= Triangles(k,3);
    C = [Sommets(c,1), Sommets(c,2), Sommets(c,3)] ;
    
    GG=Centre_de_gravite(A,B,C);
    
    if norm(GG-G) > eps % cas où le centre de grav correspond ne correspond pas à celui de la face en question
        
        [result, Ip] = Calcul_Intersection_Triangle_Segment(A,B,C,O,G); %pour chaque triangle, on vérifie si il y a intersection avec le triangle, si il y a un triangle qui le coupe, alors on arrete la boucle
     
        if result == 1 % si il y a intersection on renvoie le booléen test = 1 et un point d'intersection entre le segment et l'objet qui correspond au point d'intersection entre une de ses faces et le segment
          
            test = 1;
            I = Ip;
            break
            
        end
    end
    
end
