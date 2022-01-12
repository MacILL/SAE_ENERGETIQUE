function [Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem, num_jour)
%[Eed_conforme, Eeg_conforme, minutes_conforme]=lecture_fichier(chem)
% fonction qui ouvre un fichier météo, extrait les valeurs conformes de Eed et Eeg
% pour un jour entier 
%paramètres d'entrée: 
% chem: chaîne de caractère contenant le chemin du fichier à ouvrir
%num_jour: numéro du jour dans le fichier à extraire. 
%Attention: il s'agit du premier jour du fichier. 
%Si le fichier ne comporte les données que d'un seul jour, num_jour=1
%Si le fichier contient plusieurs jours de mesure, num_jour=numéro du jour
%dont on veut extraire les données.
%Par exemple, pour un fichier contenant les données du 1er janvier au 31
%janvier, num_jour du 22 janvier=22
%Paramètres de sortie:
%Eed_conforme: vecteur colonne ne contenant pas de valeurs aberrantes de
%Eed
%Eeg_conforme: vecteur colonne ne contenant pas de valeurs aberrantes de
%Eeg
%minutes_conforme: vecteur colonne contenant les minutes correspondantes
%aux valeurs conformes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Auteurs Dianoux, Gbaguidi, Qian
%Date 12/12/2021
%Version 1.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%flag de débuggage
FLAG_DEBUG=1;
%ouverture du fichier
%rÃ©cupÃ©ration valeur
[Struct]=importdata(chem);
donnees_meteo=Struct.data;

%num_jour=29;
duree_minute=60;
duree_jour=24;
duree_une_journee=duree_jour*duree_minute;
indice_date=duree_une_journee*(num_jour-1)+1;
journee=[indice_date,(indice_date+duree_une_journee)-1];

%Extraction des valeurs correspondants à un jour
Eed=donnees_meteo(journee(1):journee(2), 11);
Eeg=donnees_meteo(journee(1):journee(2), 10);
taille_Eed=length(Eed);
minutes=linspace(0,taille_Eed-1,taille_Eed);
minutes2=[];
% 
% if(FLAG_DEBUG==0)
% display('nb d elements de Eed:')
% display(taille_Eed);
% display('nb d elements de minutes:')
% display(length(minutes))
% end

Eed_conforme=[];
Eeg_conforme=[];
j=1;
for i=1:1:taille_Eed
%         if(rem(i,60)==0) display(Eed(i))
%                           display(minutes(i)) 
%         end
    if(Eed(i)>=0)
        Eed_conforme(j)=Eed(i);
        Eeg_conforme(j)=Eeg(i); 
        minutes_conforme(j)=minutes(i);
        j=j+1;
    end
end

% if(FLAG_DEBUG==1)
%    taille_Eed_conforme= length(Eed_conforme)
% display('nb d elements de Eed_conforme:')
% display(taille_Eed_conforme);
% display(length(minutes_conforme))
%end