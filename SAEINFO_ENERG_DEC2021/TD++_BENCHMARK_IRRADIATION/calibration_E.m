function [calib, pos_soleil]=calibration_E(Eeg, Eed, minutes, num_jour, num_mois, num_annee, decalage_heure)
%[E_calib, pos_soleil]=calibration_E(Eeg, Eed, minutes)
% fonction qui calcule un ?clairement normalis? par rapport ? la position
% du soleil (minute par minute)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Param?tres d'entr?e
%Eeg: valeurs d'?clairement global
%Eed: valeurs d'?clairement direct
%minutes: minutes correspondantes aux mesures
%num_jour: num?ro du jour dans le mois
%num_mois: num?ro du mois dans l'ann?e
%num_ann?e: num?ro de l'ann?e
%decalage_heure: ?crire 'hiver' si heure d'hiver, 'ete' si heure d'?t?
%Param?tre de sortie
%calib: ?clairement normalis? par rapport ? la position
% du soleil (minute par minute)
%pos_soleil: position du soleil minute par minute (en tenant compte des minutes conformes)



FLAG_DEBUG=1;
%sommets triangle de référence
A=[0 0 0];
B=[0 1 0];
C=[1 0 0];

if(FLAG_DEBUG==1)
    display('calcul de la normale du triangle (doit valoir 1)')
Normale = Calcul_normale_triangle(A,B,C)
end 

%prise en compte de l'heure d'?t? et de l'heure d'hiver
if(decalage_heure=='hiver')
    heure_decale=-2;
    if(FLAG_DEBUG==1)
        display('heure d hiver')
    end
else
    heure_decale=-1;
        if(FLAG_DEBUG==1)
        display('heure d ete')
    end
end
jour=[num_jour num_mois num_annee];

%Lat: 45.7786 N, Long: 4.9225 E, Alt: 170 m
%conversion en minutes d'angle
%LAT=45 46' 43'' LONG 4 55' 21''
coord=[45 46  43; 4 55 21];  

% duree_minute=60;
% duree_jour=24;
% duree_une_journee=duree_jour*duree_minute
% indice_date=duree_une_journee*(num_jour-1)+1;
% journee=[indice_date,(indice_date+duree_une_journee)]
 
pos_soleil=zeros(length(Eed),3);
 
calib=[];
for i=1:1:length(Eed)
    m=rem(minutes(i),60); %division euclidienne
    h=floor(i/60)+heure_decale;
    heure=[h, m];  
    [position_soleil, hauteur_soleil, azimut_soleil]=Calcul_position_soleil([jour(1) jour(2) jour(3)],[h, m],coord);

    pos_soleil(i,:)=position_soleil;
    %cosphi est l'angle entre la noramle du triangle de réf et distance au
    %soleil
    cosphi=Calcul_eclairement(A, B, C, pos_soleil(i));
    calib(i)=(Eeg(i)-Eed(i))/cosphi; 
end
    if(FLAG_DEBUG==1)
    display('nb d elements de calib')
    display(length(calib))
    end
end


