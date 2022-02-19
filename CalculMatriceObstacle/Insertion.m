function [Sommets_scene_complete, Triangles_scene_complete] = Insertion(Sommets_batiment, Triangles_batiment, Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu, affiche) 
% fonction qui affiche la scene part dieu et le bâtiment en question
%Paramètres d'entrée
% Sommets_batiment, Triangles_batiment : matrices qui regrupent l'ensemble 
% des sommets et triangles constituants le bâtiment
% Sommets_scene_Part_Dieu, Triangles_scene_Part_Dieu: matrices qui regrupent
% l'ensemble des sommets et triangles constituants la Part Dieu
% Paramètres de sortie:
% Sommets_scene_complete, Triangles_scene_complete

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 22/01/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Sommets_scene_complete=[Sommets_scene_Part_Dieu; Sommets_batiment];

Triangles_batiment(:,1:3)=Triangles_batiment(:,1:3)+size(Sommets_scene_Part_Dieu,1);
Triangles_scene_complete=[Triangles_scene_Part_Dieu; Triangles_batiment(:,1:3)];
    if(affiche==1)
    Aff_verification2(Sommets_scene_complete,Triangles_scene_complete)
    end
end