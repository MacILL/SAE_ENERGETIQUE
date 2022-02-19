close all;

% chem='vlx20QC_1_22012020.txt'; 
% configuration_part_dieu
% configuration_scene
%  ind_jour=1;
 
% [Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem, ind_jour);
%  
% pos_soleil=zeros(length(Eed_conforme),3);
%  heure_decale=1;
% %Eclairement_calibre=[];
%     for i=1:1:length(minutes_conforme)
%         m=rem(minutes_conforme(i),60); %division euclidienne
%         h=floor(i/60)+heure_decale;
%             if h<0
%                 h=24-abs(h); %empêche d'avoir des heures négatives
%             end
%         [position_soleil, hauteur_soleil, azimut_soleil]=Calcul_position_soleil([jour(1) jour(2) jour(3)],[h, m],coord);
%         pos_soleil(i,:)=position_soleil;
%        
%     end
display('taille Triangles_batiment')
display(size(Triangles_batiment,1))
%[matObstacle]=obstacle( Triangles_batiment, Sommets_batiment,  Triangles_scene_Part_Dieu, Sommets_scene_Part_Dieu,pos_soleil)
[matObstacle]=obstacle( TBat, S,  Triangles_scene_Part_Dieu, Sommets_scene_Part_Dieu,pos_soleil)
